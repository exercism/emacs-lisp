;;; rational-numbers.el --- Rational Numbers (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun reduce (r)
  (cl-labels ((rat-gcd (a b)
                (if (= b 0) (abs a)
                  (rat-gcd b (% a b)))))
    (let* ((a (car r))
           (b (cdr r))
           (g (rat-gcd a b))
           (c (if (< b 0) (- g) g)))
      (cons (/ a c) (/ b c)))))

(defun add (r1 r2)
  (reduce (cons (+ (* (car r1) (cdr r2)) (* (car r2) (cdr r1)))
                (* (cdr r1) (cdr r2)))))

(defun sub (r1 r2)
  (add r1 (cons (- (car r2)) (cdr r2))))

(defun mul (r1 r2)
  (reduce (cons (* (car r1) (car r2))
                (* (cdr r1) (cdr r2)))))

(defun div (r1 r2)
  (mul r1 (cons (cdr r2) (car r2))))

(defun absrational (r)
  (reduce (cons (abs (car r)) (abs (cdr r)))))

(defun exprational (r n)
  (let ((r (reduce r)))
    (if (< n 0)
        (exprational (cons (cdr r) (car r)) (- n))
      (cons (expt (car r) n) (expt (cdr r) n)))))

(defun expreal (x r)
  (exp (* (car r) (/ (log x) (cdr r)))))


(provide 'rational-numbers)
;;; rational-numbers.el ends here
