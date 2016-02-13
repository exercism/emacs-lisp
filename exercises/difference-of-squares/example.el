;;; difference-of-squares.el --- Difference of Squares (exercism)

;;; Commentary:

;;; Code:
(eval-when-compile (require 'cl))

(defun sum-of-squares (n)
  "Square of sums of N."
  (reduce #'+ (mapcar #'(lambda (i) (expt i 2)) (number-sequence 1 n))))

(defun square-of-sums (n)
  "Sum of squares of N."
  (expt (reduce #'+ (number-sequence 1 n)) 2))

(defun difference (n)
  "Difference of squares pertaining to N."
  (- (square-of-sums n)
     (sum-of-squares n)))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
