;;; practice-exercise-generator.el --- Practice Exercise Generator (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(exercism//install-required-packages)

(require 'mustache)
(require 'ht)
(require 'json)
(require 'string-inflection)
(require 'subr-x)
(require 'seq)

;; TODO(FAP): add optional prefix to function names.. per exercise? general exercism prefix?
;; TODO(FAP): currently mustache adds two newlines at the end of files, maybe we should remove them?
;;            (combination of newline from main template and partial)
(defun exercism/generate-practice-exercise (exercise-slug)
  "Generate practice exercises for EXERCISE-SLUG from the data found in the problem-specifications."

  (with-temp-buffer
    (exercism//load-canonical-data exercise-slug)
    (goto-char 1)
    (let* ((json-object-type 'hash-table)
           (json-key-type 'string)
           (canonical-data (json-read))
           (functions (exercism//retrieve-functions canonical-data)))
      ;; TODO(FAP): adjust meta config - currently depends on jq
      (exercism//generate-solution-stubs
       exercise-slug canonical-data functions)
      ;; TODO(FAP): generate full test implementations, not just stubs?
      (exercism//generate-tests
       exercise-slug canonical-data functions)
      ;; TODO(FAP): add solution files to config.json
      ;; TODO(FAP): generate toml based on the exercises we actually implemented?
      )))


(defun exercism//load-canonical-data (exercise-slug)
  (url-insert-file-contents
   (concat
    "https://raw.githubusercontent.com/exercism/problem-specifications/main/exercises/"
    exercise-slug
    "/canonical-data.json")))

(defun exercism//generate-solution-stubs
    (exercise-slug canonical-data functions)
  (let* ((mustache-partial-paths (list "templates/partials"))
         (package-title (exercism//retrieve-title exercise-slug))
         (generated-stubs
          (mustache-render
           (exercism//file-to-string
            "templates/exercises/practice/solution.mustache")
           (ht
            ("filename" exercise-slug)
            ("package-title" package-title)
            ("functions" functions)))))
    (exercism//write-to-file
     (concat
      "../exercises/practice/" exercise-slug "/" exercise-slug ".el")
     generated-stubs)
    (exercism//write-to-file
     (concat
      "../exercises/practice/" exercise-slug "/.meta/example.el")
     generated-stubs)))

(defun exercism//retrieve-functions (canonical-data)
  (seq-uniq (flatten-tree
             (append
              (named-let retrieve ((cases canonical-data))
                (if (hash-table-p cases)
                    (retrieve (gethash "cases" cases))
                  (mapcar
                   (lambda (elem)
                     (if (gethash "cases" elem)
                         (retrieve (gethash "cases" elem))
                       (ht
                        ("function-name"
                         (string-inflection-kebab-case-function
                          (gethash "property" elem)))
                        ("function-parameters"
                         (string-join (hash-table-keys
                                       (gethash "input" elem))
                                      " ")))))
                   cases)))))
            (lambda (elem1 elem2)
              (equal
               (gethash "function-name" elem1)
               (gethash "function-name" elem2)))))

(defun exercism//retrieve-title (exercise-slug)
  (with-temp-buffer
    (url-insert-file-contents
     (concat
      "https://raw.githubusercontent.com/exercism/problem-specifications/main/exercises/"
      exercise-slug
      "/metadata.toml"))
    (beginning-of-buffer)
    (save-match-data
      (re-search-forward "^title *= *\"\\(.*\\)\"$")
      (match-string 1))))

(defun exercism//write-to-file (file string)
  "Writes STRING into FILE."
  (with-temp-file file
    (insert string)))

(defun exercism//file-to-string (file)
  "Convert FILE to string."
  (with-temp-buffer
    (insert-file-contents file)
    (buffer-string)))

(defun exercism//generate-tests
    (exercise-slug canonical-data functions)
  ;; check if we have a specific function / template for the exercise
  ;; use default if we don't
  (let* ((tests (exercism//retrieve-tests canonical-data))
         (package-title (exercism//retrieve-title exercise-slug))
         (mustache-partial-paths (list "templates/partials"))
         (generated-test-stubs
          (mustache-render
           (exercism//file-to-string
            "templates/exercises/practice/test.mustache")
           (ht
            ("solution-filename" exercise-slug)
            ("filename" (concat exercise-slug "-test"))
            ("package-title" package-title)
            ("functions" functions)
            ("tests" tests)))))
    (exercism//write-to-file
     (concat
      "../exercises/practice/"
      exercise-slug
      "/"
      exercise-slug
      "-test.el")
     generated-test-stubs)))

(defun exercism//retrieve-tests (canonical-data)
  (let*
      ((tests
        (flatten-tree
         (append
          (named-let retrieve ((cases canonical-data))
            (if (hash-table-p cases)
                (retrieve (gethash "cases" cases))
              (mapcar
               (lambda (elem)
                 (if (gethash "cases" elem)
                     (retrieve (gethash "cases" elem))
                   (ht
                    ("test-name"
                     ;; TODO(fap): maybe also call string-inflection-kebab-case?
                     ;; set_right-with-null -> set-right-with-null
                     (replace-regexp-in-string
                      " " "-"
                      (gethash "description" elem)))
                    ("uuid" (gethash "uuid" elem))
                    ("reimplements" (gethash "reimplements" elem)))))
               cases))))))
       (reimplemented-uuids
        (seq-map (lambda (hash) (gethash "reimplements" hash)) tests))
       (tests-without-reimplemented
        (seq-filter
         (lambda (elem)
           (not
            (seq-contains reimplemented-uuids (gethash "uuid" elem))))
         tests)))
    tests-without-reimplemented))

;; alternative entry point from shell if exercise should be updated
(defun exercism/update-practice-exercise-tests (exercise-slug))

(provide 'practice-exercise-generator)
;;; practice-exercise-generator.el ends here
