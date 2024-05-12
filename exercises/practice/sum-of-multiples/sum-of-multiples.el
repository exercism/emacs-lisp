;;; sum-of-multiples.el --- Sum of Multiples (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun sum (factors limit)
  (let* ((set (make-hash-table))
         (total 0))
    (dolist (factor factors)
      (cl-loop for multiple from factor below limit by factor
        do (puthash multiple t set)))
    (maphash (lambda (key value) (setq total (+ total key)))
      set)
    total))

(provide 'sum-of-multiples)
;;; sum-of-multiples.el ends here

