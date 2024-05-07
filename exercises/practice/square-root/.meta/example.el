;;; square-root.el --- Square Root (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun square-root (radicand)
  (cl-loop for num from 0
    until (<= radicand (* num num))
    finally return num))

(provide 'square-root)
;;; square-root.el ends here
