;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)

;;; Commentary:

;;; Code:
(require 'cl-lib)

;; Algorithm from https://www.geeksforgeeks.org/sum-of-all-proper-divisors-of-a-natural-number/
(defun classify (number)
  (unless (> number 0) (error "Classification is only possible for natural numbers"))
  (let ((sum 1))
    (cl-loop for i from 2 to (sqrt number)
             when (zerop (% number i))
             sum (+ i
                    (if (= i (/ number i))
                        (cl-incf sum i)
                      (cl-incf sum (+ i (/ number i))))))
    (cond ((= 1 number) 'deficient)
          ((< sum number) 'deficient)
          ((= sum number) 'perfect)
          ((> sum number) 'abundant))))

(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
