;;; rational-numbers-test.el --- Rational Numbers (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "rational-numbers.el")
(declare-function add "rational-numbers.el" (r1 r2))
(declare-function sub "rational-numbers.el" (r1 r2))
(declare-function mul "rational-numbers.el" (r1 r2))
(declare-function div "rational-numbers.el" (r1 r2))
(declare-function absrational "rational-numbers.el" (r))
(declare-function exprational "rational-numbers.el" (r n))
(declare-function expreal "rational-numbers.el" (x r))
(declare-function reduce "rational-numbers.el" (r))


(ert-deftest add-two-positive-rational-numbers ()
  (should (equal '(7 . 6) (add '(1 . 2) '(2 . 3)))))


(ert-deftest add-a-positive-rational-number-and-a-negative-rational-number ()
  (should (equal '(-1 . 6) (add '(1 . 2) '(-2 . 3)))))


(ert-deftest add-two-negative-rational-numbers ()
  (should (equal '(-7 . 6) (add '(-1 . 2) '(-2 . 3)))))


(ert-deftest add-a-rational-number-to-its-additive-inverse ()
  (should (equal '(0 . 1) (add '(1 . 2) '(-1 . 2)))))


(ert-deftest subtract-two-positive-rational-numbers ()
  (should (equal '(-1 . 6) (sub '(1 . 2) '(2 . 3)))))


(ert-deftest subtract-a-positive-rational-number-and-a-negative-rational-number ()
  (should (equal '(7 . 6) (sub '(1 . 2) '(-2 . 3)))))


(ert-deftest subtract-two-negative-rational-numbers ()
  (should (equal '(1 . 6) (sub '(-1 . 2) '(-2 . 3)))))


(ert-deftest subtract-a-rational-number-from-itself ()
  (should (equal '(0 . 1) (sub '(1 . 2) '(1 . 2)))))


(ert-deftest multiply-two-positive-rational-numbers ()
  (should (equal '(1 . 3) (mul '(1 . 2) '(2 . 3)))))


(ert-deftest multiply-a-negative-rational-number-by-a-positive-rational-number ()
  (should (equal '(-1 . 3) (mul '(-1 . 2) '(2 . 3)))))


(ert-deftest multiply-two-negative-rational-numbers ()
  (should (equal '(1 . 3) (mul '(-1 . 2) '(-2 . 3)))))


(ert-deftest multiply-a-rational-number-by-its-reciprocal ()
  (should (equal '(1 . 1) (mul '(1 . 2) '(2 . 1)))))


(ert-deftest multiply-a-rational-number-by-1 ()
  (should (equal '(1 . 2) (mul '(1 . 2) '(1 . 1)))))


(ert-deftest multiply-a-rational-number-by-0 ()
  (should (equal '(0 . 1) (mul '(1 . 2) '(0 . 1)))))


(ert-deftest divide-two-positive-rational-numbers ()
  (should (equal '(3 . 4) (div '(1 . 2) '(2 . 3)))))


(ert-deftest divide-a-positive-rational-number-by-a-negative-rational-number ()
  (should (equal '(-3 . 4) (div '(1 . 2) '(-2 . 3)))))


(ert-deftest divide-two-negative-rational-numbers ()
  (should (equal '(3 . 4) (div '(-1 . 2) '(-2 . 3)))))


(ert-deftest divide-a-rational-number-by-1 ()
  (should (equal '(1 . 2) (div '(1 . 2) '(1 . 1)))))


(ert-deftest absolute-value-of-a-positive-rational-number ()
  (should (equal '(1 . 2) (absrational '(1 . 2)))))


(ert-deftest absolute-value-of-a-positive-rational-number-with-negative-numerator-and-denominator ()
  (should (equal '(1 . 2) (absrational '(-1 . -2)))))


(ert-deftest absolute-value-of-a-negative-rational-number ()
  (should (equal '(1 . 2) (absrational '(-1 . 2)))))


(ert-deftest absolute-value-of-a-negative-rational-number-with-negative-denominator ()
  (should (equal '(1 . 2) (absrational '(1 . -2)))))


(ert-deftest absolute-value-of-zero ()
  (should (equal '(0 . 1) (absrational '(0 . 1)))))


(ert-deftest absolute-value-of-a-rational-number-is-reduced-to-lowest-terms ()
  (should (equal '(1 . 2) (absrational '(2 . 4)))))


(ert-deftest raise-a-positive-rational-number-to-a-positive-integer-power ()
  (should (equal '(1 . 8) (exprational '(1 . 2) 3))))


(ert-deftest raise-a-negative-rational-number-to-a-positive-integer-power ()
  (should (equal '(-1 . 8) (exprational '(-1 . 2) 3))))


(ert-deftest raise-a-positive-rational-number-to-a-negative-integer-power ()
  (should (equal '(25 . 9) (exprational '(3 . 5) -2))))


(ert-deftest raise-a-negative-rational-number-to-an-even-negative-integer-power ()
  (should (equal '(25 . 9) (exprational '(-3 . 5) -2))))


(ert-deftest raise-a-negative-rational-number-to-an-odd-negative-integer-power ()
  (should (equal '(-125 . 27) (exprational '(-3 . 5) -3))))


(ert-deftest raise-zero-to-an-integer-power ()
  (should (equal '(0 . 1) (exprational '(0 . 1) 5))))


(ert-deftest raise-one-to-an-integer-power ()
  (should (equal '(1 . 1) (exprational '(1 . 1) 4))))


(ert-deftest raise-a-positive-rational-number-to-the-power-of-zero ()
  (should (equal '(1 . 1) (exprational '(1 . 2) 0))))


(ert-deftest raise-a-negative-rational-number-to-the-power-of-zero ()
  (should (equal '(1 . 1) (exprational '(-1 . 2) 0))))


(ert-deftest raise-a-real-number-to-a-positive-rational-number ()
  (should (< (abs (- 16.0 (expreal 8 '(4 . 3)))) 1e-6)))


(ert-deftest raise-a-real-number-to-a-negative-rational-number ()
  (should (< (abs (- 0.3333333333333333 (expreal 9 '(-1 . 2)))) 1e-6)))


(ert-deftest raise-a-real-number-to-a-zero-rational-number ()
  (should (< (abs (- 1.0 (expreal 2 '(0 . 1)))) 1e-6)))


(ert-deftest reduce-a-positive-rational-number-to-lowest-terms ()
  (should (equal '(1 . 2) (reduce '(2 . 4)))))


(ert-deftest reduce-places-the-minus-sign-on-the-numerator ()
  (should (equal '(-3 . 4) (reduce '(3 . -4)))))


(ert-deftest reduce-a-negative-rational-number-to-lowest-terms ()
  (should (equal '(-2 . 3) (reduce '(-4 . 6)))))


(ert-deftest reduce-a-rational-number-with-a-negative-denominator-to-lowest-terms ()
  (should (equal '(-1 . 3) (reduce '(3 . -9)))))


(ert-deftest reduce-zero-to-lowest-terms ()
  (should (equal '(0 . 1) (reduce '(0 . 6)))))


(ert-deftest reduce-an-integer-to-lowest-terms ()
  (should (equal '(-2 . 1) (reduce '(-14 . 7)))))


(ert-deftest reduce-one-to-lowest-terms ()
  (should (equal '(1 . 1) (reduce '(13 . 13)))))


(provide 'rational-numbers-test)
;;; rational-numbers-test.el ends here
