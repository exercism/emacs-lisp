;;; two-fer.el --- Two-fer Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun two-fer (&optional name)
  (let ((player (or name "you")))
    (concat "One for " player ", one for me.")))

(provide 'two-fer)

;;; two-fer.el ends here
