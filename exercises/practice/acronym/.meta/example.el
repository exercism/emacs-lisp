;;; acronym.el --- Acronym (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun acronym (input)
  (let ((words (split-string (string-replace "'" "" input) "\\W+")))
    (mapconcat (lambda (word) (upcase (substring word 0 1))) words "")))

(provide 'acronym)
;;; acronym.el ends here
