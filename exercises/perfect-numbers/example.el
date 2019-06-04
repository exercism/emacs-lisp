;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)


(defun divisors (n)
  (cl-loop for i from 1 to (truncate (sqrt n))
           if (= (% n i) 0) collect i
           and if (not (= i (/ n i))) collect (/ n i)))


(defun sum-divisors (n)
  ;; Remove n from the list and add'em up.
  (apply #'+ (cdr (sort (divisors n) '>))))


(defun perfect-numbers (n)
  (cl-loop for i from 2 to n by 2
           when (= i (sum-divisors i))
           collect i))


(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
