;;; acronym.el --- Acronym (exercism)

;;; Commentary:

;;; Code:

(require 'cl)

(defun acronym (input)
  (let ((words (split-string input "\\W+")))
    (mapconcat (lambda (word) (upcase (substring word 0 1))) words "")))

(provide 'acronym)
;;; acronym.el ends here
