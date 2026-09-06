;;; transpose.el --- Transpose (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun column (col reversed height)
  (cond ((null reversed) "")
        ((<= (length (car reversed)) col) (column col (cdr reversed) (1- height)))
        (t (let ((word (make-string height ?\s)))
             (cl-loop
               for row from (1- height) downto 0
               for line = (car reversed)

               when (< col (length line))
               do (aset word row (aref line col))

               do (setq reversed (cdr reversed)))
             word))))

(defun transpose (lines)
  (when lines
    (let ((height (length lines))
          (width (apply #'max (mapcar #'length lines)))
          (reversed (reverse lines)))
      (cl-loop for col from 0 below width
        collect (column col reversed height)))))

(provide 'transpose)
;;; transpose.el ends here

