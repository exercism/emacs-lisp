;;; pascals-triangle.el --- Pascal&#39;s Triangle (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun rows (count)
  (let ((result (make-vector count nil))
        (current nil)
        (previous nil))
    (cl-loop for r below count
      do (setq current (make-vector (1+ r) 1))
      do (cl-loop for c from 1 below r
           do (aset current c (+ (aref previous (1- c)) (aref previous c))))
      do (aset result r current)
      do (setq previous current))
    result))

(provide 'pascals-triangle)
;;; pascals-triangle.el ends here

