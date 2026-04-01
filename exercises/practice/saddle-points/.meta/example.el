;;; saddle-points.el --- Saddle Points (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun column-minimums (matrix)
  (let ((table (vconcat matrix)))
    (cl-loop while (aref table 0)
             collect (cl-loop for index from 0 below (length table)
                              for row = (aref table index)
                              do (aset table index (cdr row))
                              minimize (car row) into best
                              finally return best))))

(defun saddle-points (matrix)
  (when (and matrix (car matrix))
    (let ((column-mins (column-minimums matrix))
          (result nil))
      (cl-loop for row in matrix
               for r from 1
               do (let ((row-max (apply #'max row)))
                    (cl-loop for val in row
                             for col-min in column-mins
                             for c from 1
                             when (and (= val row-max) (= val col-min))
                             do (push (cons r c) result))))
      (reverse result))))

(provide 'saddle-points)
;;; saddle-points.el ends here
