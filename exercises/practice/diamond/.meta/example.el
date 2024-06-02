;;; diamond.el --- Diamond (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun rows (letter)
  (let* ((n (- letter ?A))
         (length (1+ (* 2 n)))
         (result (make-vector length nil)))
    (cl-labels
      ((row (index)
          (let ((str (make-string length 32)))
             (aset str (- n index) (+ ?A index))
             (aset str (+ n index) (+ ?A index))
             str)))
      (cl-loop for index to n
        do (aset result index (funcall #'row index)))
      (cl-loop for index below n
        do (aset result (- length 1 index) (funcall #'row index)))
      result)))

(provide 'diamond)
;;; diamond.el ends here

