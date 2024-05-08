;;; pythagorean-triplet.el --- Pythagorean Triplet (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

; For every Pythagorean triplet with total a + b + c = n,
;     a² + b² = c²
; <=> a² + b² = (n - a - b)², substituting c
; <=> 0 = n² - 2*n*a - 2*n*b + 2*a*b
; <=> (2*n - 2*a) b = (n² - 2*n*a)
; <=> b = (n² - 2*n*a) / (2*n - 2*a)

;;; Code:

(require 'cl-lib)

(defun triplets-with-sum (n)
  (cl-labels
    ((recur (start)
      (cl-loop for a from start
        for numerator = (* n (- n a a))
        for denominator = (* 2 (- n a))
        for b = (/ numerator denominator)
        always (< a b)
        until (= 0 (% numerator denominator))
        finally return (cons (list a b (- n a b)) (recur (1+ a))))))
    (unless (< n 2)
      (recur 1))))

(provide 'pythagorean-triplet)
;;; pythagorean-triplet.el ends here
