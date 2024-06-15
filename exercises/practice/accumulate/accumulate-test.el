;;; accumulate-test.el --- Accumulate (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "accumulate.el")
(declare-function accumulate "accumulate.el" (lst op))


(ert-deftest accumulate-empty ()
  (let ((result (accumulate '() (lambda (x) (* x x)))))
    (should (equal result '()))))


(ert-deftest accumulate-square ()
  (let ((result (accumulate '(1 2 3 4) (lambda (x) (* x x)))))
    (should (equal result '(1 4 9 16)))))


(ert-deftest accumulate-upcases ()
  (let ((result (accumulate '("Hello" "world") 'upcase)))
    (should (equal result '("HELLO" "WORLD")))))


(ert-deftest accumulate-reversed-strings ()
  (let ((result (accumulate '("the" "quick" "brown" "fox" "etc") (lambda (x) (apply #'string (reverse (string-to-list x)))))))
    (should (equal result '("eht" "kciuq" "nworb" "xof" "cte")))))


(ert-deftest accumulate-recursively ()
  (let* ((inner-list '("1" "2" "3"))
         (result (accumulate '("a" "b" "c")
                             (lambda (x)
                               (mapcar (lambda (y) (concat x y)) inner-list)))))
    (should (equal result '(("a1" "a2" "a3")
                            ("b1" "b2" "b3")
                            ("c1" "c2" "c3"))))))


(provide 'accumulate-test)
;;; accumulate-test.el ends here
