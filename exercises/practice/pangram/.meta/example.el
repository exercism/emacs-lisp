;;; pangram.el --- Pangram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(require 'cl-lib)

(defun pangramp (phrase)
  "Determine if a given phrase is a pangram."
  (let ((alphabet "abcdefghijklmnopqrstuvwxyz"))
        (cl-every
         (lambda (c) (string-match-p (char-to-string c) phrase))
         alphabet)))


(provide 'pangram)
;;; pangram.el ends here
