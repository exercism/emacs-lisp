;;; practice-exercise-generator.el --- Practice Exercise Generator (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Used to generate solution and test stub files for practice exercises.
;;; Intended to be called by /bin/generate_practice_exercise.

;;; Known issues:
;;; Generates two newlines at the end of the solution and test file.

;;; Code:

(exercism//install-required-packages)

(require 'mustache)
(require 'ht)
(require 'string-inflection)
(require 'json)
(require 'subr-x)
(require 'seq)

(defun exercism/generate-practice-exercise (exercise-slug)
  "Generate scaffolding for practice exercise EXERCISE-SLUG from the canonical data found in the problem-specifications."
  (with-temp-buffer
    (url-insert-file-contents
     (concat
      "https://raw.githubusercontent.com/exercism/problem-specifications/main/exercises/"
      exercise-slug
      "/canonical-data.json"))
    (goto-char 1)

    (let* ((json-object-type 'hash-table)
           (json-key-type 'string)
           (canonical-data (json-read))
           (functions (exercism//retrieve-functions canonical-data)))
      (exercism//generate-solution-stubs
       exercise-slug canonical-data functions)
      (exercism//generate-test-stubs
       exercise-slug canonical-data functions))))

(defun exercism//generate-solution-stubs
    (exercise-slug canonical-data functions)
  "Generate solution file with function stubs.
File location is exercises/practice/EXERCISE-SLUG/EXERCISE-SLUG.el."
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
  "For each function to implement, retrieve function-name and function-paramater from CANONICAL-DATA.

Returns a list of hash-tables.
Each hash-table has the keys:
  function-name: The name of the function in kebab-case
  function-parameters: The parameters of the function in kebab-case, separated by spaces"
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
                        ("function-parameters" (string-join
                          (seq-map
                           'string-inflection-kebab-case-function
                           (hash-table-keys (gethash "input" elem)))
                          " ")))))
                   cases)))))
            (lambda (elem1 elem2)
              (equal
               (gethash "function-name" elem1)
               (gethash "function-name" elem2)))))

(defun exercism//retrieve-title (exercise-slug)
  "Retrieve canonical title of exercise EXERCISE-SLUG from metadata.toml."
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

(defun exercism//generate-test-stubs
    (exercise-slug canonical-data functions)
  "Generate test file with test function stubs.
File location is exercises/practice/EXERCISE-SLUG/EXERCISE-SLUG-test.el.

Includes the expected input and output as a comment, so contributors
don't have to look up that information separately."
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
  "Retrieve test data from CANONICAL-DATA.
Deprecated tests (tests that get reimplemented) are discarded.

Returns a list of hash-tables.
Each hash-table has the keys:
  test-name: name of test function in kebab-case
  uuid: uuid that identifies the test
  reimplements: either nil or uuid of test that gets reimplemented by that test
  function-under-test: name of the function under test in kebab-case
  input: text representation of the input to the function under test
  expected: text representation of the expected result of the function under test"
  (let* ((tests
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
                       (string-inflection-kebab-case-function
                        (replace-regexp-in-string
                         "[ |_]" "-" (gethash "description" elem))))
                      ("uuid" (gethash "uuid" elem))
                      ("reimplements" (gethash "reimplements" elem))
                      ("function-under-test"
                       (string-inflection-kebab-case-function
                        (gethash "property" elem)))
                      ("input" (json-encode (gethash "input" elem)))
                      ("expected"
                       (json-encode (gethash "expected" elem))))))
                 cases))))))
         (reimplemented-uuids
          (seq-map
           (lambda (hash) (gethash "reimplements" hash)) tests))
         (tests-without-reimplemented
          (seq-filter
           (lambda (elem)
             (not
              (seq-contains
               reimplemented-uuids (gethash "uuid" elem))))
           tests)))
    tests-without-reimplemented))

(provide 'practice-exercise-generator)
;;; practice-exercise-generator.el ends here
