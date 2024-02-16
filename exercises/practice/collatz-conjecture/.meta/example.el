;;; collatz-conjecture.el --- Collatz Conjecture (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun steps (number)
  "Count the steps to reach 1 using the Collatz conjecture."
  (unless (< 0 number) (error "Only positive integers are allowed"))
  (cl-labels
    ((recur (n count)
      (cond
        ((= 0 (mod n 2)) (funcall #'recur (/ n 2) (+ 1 count)))
        ((< 1 n) (funcall #'recur (+ 1 (* 3 n)) (+ 1 count)))
        (t count))))
    (funcall #'recur number 0)))

(provide 'collatz-conjecture)
;;; collatz-conjecture.el ends here
