;;; all-your-base.el --- All Your Base (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'seq)
(require 'subr-x)

(defun to-decimal (list-of-digits base)
  (apply '+
         (cl-loop for digit in (reverse list-of-digits)
                  for index from 1
                  with power = 1
                  do (unless (< -1 digit base) (error "All digits must satisfy 0 <= d < input base"))
                  collect (* digit power)
                  do (setq power (* power base)))))

(defun drop-leading-zeros (sequence)
  (seq-drop-while (lambda (elem) (= elem 0)) sequence))

(cl-defun rebase (list-of-digits in-base out-base)
  (unless (>= in-base 2)
    (error "Input base must be >= 2"))
  (unless (>= out-base 2)
    (error "Output base must be >= 2"))
  (setq list-of-digits (drop-leading-zeros list-of-digits))
  (when (null list-of-digits)
    (cl-return-from rebase '(0)))
  (named-let recur
      ((quotient (to-decimal list-of-digits in-base))
       (result '()))
    (if (= quotient 0)
        (progn
          result)
      (recur (/ quotient out-base) (push (mod quotient out-base) result)))))

(provide 'all-your-base)
;;; all-your-base.el ends here
