;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)

;;; Commentary:

;;; Code:
(require 'seq)

(defun classify (number)
  "Classify NUMBER as perfect, abundant, or deficient."
  (when (< number 1)
    (error "%s" "Classification is only possible for natural numbers"))
  (let ((aliquot-sum (calculate-aliquot-sum number)))
    (cond ((> aliquot-sum number) 'abundant)
          ((= aliquot-sum number) 'perfect)
          ((< aliquot-sum number) 'deficient))))

(defun calculate-aliquot-sum (number)
  "The aliquot sum of NUMBER is the sum of its factors."
  (let ((factors (seq-filter
                  (lambda (x) (divides-p x number))
                  (number-sequence 1 (/ number 2)))))
    (seq-reduce #'+ factors 0)))

(defun divides-p (factor multiple)
  "True if FACTOR divides MULTIPLE."
  (zerop (mod multiple factor)))

(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
