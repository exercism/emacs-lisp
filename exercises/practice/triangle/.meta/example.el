;;; triangle.el --- Triangle (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun validp (sides)
  "Return non-nil if sides are positive and triangle inequality is satisfied"
  (let ((a (car sides))
        (b (cadr sides))
        (c (caddr sides)))
    (and
      (< 0 a)
      (< 0 b)
      (< 0 c)
      (<= a (+ b c))
      (<= b (+ a c))
      (<= c (+ a b)))))

(defun equilateralp (sides)
  "Return non-nil if sides represent a valid equilateral triangle"
  (let ((a (car sides))
        (b (cadr sides))
        (c (caddr sides)))
    (and
      (validp sides)
      (= a b)
      (= a c))))

(defun isoscelesp (sides)
  "Return non-nil if sides represent a valid isosceles triangle"
  (let ((a (car sides))
        (b (cadr sides))
        (c (caddr sides)))
    (and
      (validp sides)
      (or
        (= a b)
        (= a c)
        (= b c)))))

(defun scalenep (sides)
  "Return non-nil if sides represent a valid scalene triangle"
  (and
    (validp sides)
    (not (isoscelesp sides))))

(provide 'triangle)
;;; triangle.el ends here
