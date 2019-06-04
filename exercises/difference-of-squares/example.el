;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:
(require 'cl-lib)

(defun sum-of-squares (n)
  "Square of sum of N."
  (cl-reduce #'+ (mapcar (lambda (i) (expt i 2)) (number-sequence 1 n))))

(defun square-of-sum (n)
  "Sum of squares of N."
  (expt (cl-reduce #'+ (number-sequence 1 n)) 2))

(defun difference (n)
  "Difference of squares pertaining to N."
  (- (square-of-sum n)
     (sum-of-squares n)))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
