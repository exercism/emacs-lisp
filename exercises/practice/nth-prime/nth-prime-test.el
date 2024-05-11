;;; nth-prime-test.el --- Tests for Nth Prime (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "nth-prime.el")
(declare-function prime "nth-prime.el" (number))


(ert-deftest first-prime ()
  (should (= 2 (prime 1))))


(ert-deftest second-prime ()
  (should (= 3 (prime 2))))


(ert-deftest sixth-prime ()
  (should (= 13 (prime 6))))


(ert-deftest big-prime ()
  (should (= 104743 (prime 10001))))


(ert-deftest there-is-no-zeroth-prime ()
  (should-error (prime 0)))


(provide 'nth-prime-test)
;;; nth-prime-test.el ends here
