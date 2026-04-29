;;; rectangles.el --- Rectangles (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun bottom (row left right)
  (cl-loop for col from left to right
           always (memq (aref row col) '(?+ ?-))))

(defun sides (rows left right)
  (cl-loop for rows on rows
           for row = (car rows)
           while (and (memq (aref row left) '(?+ ?|))
                      (memq (aref row right) '(?+ ?|)))
           when (and (= ?+ (aref row left))
                     (= ?+ (aref row right)))
           count (bottom row left right)))

(defun top (first rest)
  (cl-loop for right from 1 below (length first)
           when (= ?+ (aref first right))
           sum (cl-loop for left from (1- right) downto 0
                        while (memq (aref first left) '(?+ ?-))
                        when (= ?+ (aref first left))
                        sum (sides rest left right))))

(defun rectangles (strings)
  (cl-loop for strings on strings
           sum (top (car strings) (cdr strings))))


(provide 'rectangles)
;;; rectangles.el ends here
