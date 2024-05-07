;;; prime-factors-test.el --- Tests for Prime Factors (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "prime-factors.el")
(declare-function factors "prime-factors.el" (value))


(ert-deftest no-factors ()
  (should (equal '() (factors 1))))


(ert-deftest prime-number ()
  (should (equal '(2) (factors 2))))


(ert-deftest another-prime-number ()
  (should (equal '(3) (factors 3))))


(ert-deftest square-of-a-prime ()
  (should (equal '(3 3) (factors 9))))


(ert-deftest product-of-first-prime ()
  (should (equal '(2 2) (factors 4))))


(ert-deftest cube-of-a-prime ()
  (should (equal '(2 2 2) (factors 8))))


(ert-deftest product-of-second-prime ()
  (should (equal '(3 3 3) (factors 27))))


(ert-deftest product-of-third-prime ()
  (should (equal '(5 5 5 5) (factors 625))))


(ert-deftest product-of-first-and-second-prime ()
  (should (equal '(2 3) (factors 6))))


(ert-deftest product-of-primes-and-non-primes ()
  (should (equal '(2 2 3) (factors 12))))


(ert-deftest product-of-primes ()
  (should (equal '(5 17 23 461) (factors 901255))))


(ert-deftest factors-include-a-large-prime ()
  (should (equal '(11 9539 894119) (factors 93819012551))))


(provide 'prime-factors-test)
;;; prime-factors-test.el ends here
