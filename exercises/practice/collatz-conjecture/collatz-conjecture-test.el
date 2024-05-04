;;; collatz-conjecture-test.el --- Tests for Collatz Conjecture (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "collatz-conjecture.el")
(declare-function steps "collatz-conjecture.el" (number))


(ert-deftest zero-steps-for-one ()
  (should (equal 0 (steps 1))))


(ert-deftest divide-if-even ()
  (should (equal 4 (steps 16))))


(ert-deftest even-and-odd-steps ()
  (should (equal 9 (steps 12))))


(ert-deftest large-number-of-even-and-odd-steps ()
  (should (equal 152 (steps 1000000))))


(ert-deftest zero-is-an-error ()
  (should-error (steps 0)))


(ert-deftest negative-value-is-an-error ()
  (should-error (steps -15)))

(provide 'collatz-conjecture-test)
;;; collatz-conjecture-test.el ends here
