;;; spiral-matrix.el --- Spiral Matrix (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun spiral-matrix (size)
  (let* ((result (make-vector size nil))
         (value 1)
         (row 0)
         (column 0)
         (side (1- size)))
    (cl-loop for r below size
      do (aset result r (make-vector size (* size size))))
    (while (>= side 1)
      (cl-loop repeat side
        do (aset (aref result row) column value)
        do (setq value (1+ value))
        do (setq column (1+ column)))
      (cl-loop repeat side
        do (aset (aref result row) column value)
        do (setq value (1+ value))
        do (setq row (1+ row)))
      (cl-loop repeat side
        do (aset (aref result row) column value)
        do (setq value (1+ value))
        do (setq column (1- column)))
      (cl-loop repeat side
        do (aset (aref result row) column value)
        do (setq value (1+ value))
        do (setq row (1- row)))
      (setq row (1+ row))
      (setq column (1+ column))
      (setq side (- side 2)))
    result))

(provide 'spiral-matrix)
;;; spiral-matrix.el ends here

