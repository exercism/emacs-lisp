;;; pangram.el --- Pangram (exercism)

;;; Commentary:

;;; Code:
(require 'cl-lib)

(defun is-pangram (phrase)
  "Determine if a given phrase is a pangram."
  (let ((alphabet "abcdefghijklmnopqrstuvwxyz"))
        (cl-every
         (lambda (c) (string-match-p (char-to-string c) phrase))
         alphabet)))


(provide 'pangram)
;;; pangram.el ends here
