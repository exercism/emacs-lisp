;;; prime-factors.el --- Prime Factors (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun factors-from (start value)
  (unless (= value 1)
    (cl-loop for p from start
      until (= 0 (% value p))
      finally return (cons p (factors-from p (/ value p))))))

(defun factors (value)
  (factors-from 2 value))

(provide 'prime-factors)
;;; prime-factors.el ends here
