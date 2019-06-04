;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun anagram-equal (a b)
  "Check that words A and B are anagrams of each other, but not identical."
  (and (equal (cl-sort (split-string-and-unquote (downcase a) "") #'string<)
              (cl-sort (split-string-and-unquote (downcase b) "") #'string<))
       (not (string= a b))))

(defun anagrams-for (subject candidates)
  "Find anagrams for SUBJECT from list of CANDIDATES."
  (cl-remove-if-not (lambda (w) (anagram-equal w subject))
                    candidates))


(provide 'anagram)
;;; anagram.el ends here
