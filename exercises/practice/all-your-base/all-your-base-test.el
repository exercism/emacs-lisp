;;; all-your-base-test.el --- Tests for All Your Base (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "all-your-base.el")
(declare-function rebase "all-your-base.el" (list-of-digits in-base out-base))


(ert-deftest single-bit-to-one-decimal ()
  (should (equal '(1) (rebase '(1) 2 10))))


(ert-deftest binary-to-single-decimal ()
  (should (equal '(5) (rebase '(1 0 1) 2 10))))


(ert-deftest single-decimal-to-binary ()
  (should (equal '(1 0 1) (rebase '(5) 10 2))))


(ert-deftest binary-to-multiple-decimal ()
  (should (equal '(4 2) (rebase '(1 0 1 0 1 0) 2 10))))


(ert-deftest decimal-to-binary ()
  (should (equal '(1 0 1 0 1 0) (rebase '(4 2) 10 2))))


(ert-deftest trinary-to-hexadecimal ()
  (should (equal '(2 10) (rebase '(1 1 2 0) 3 16))))


(ert-deftest hexadecimal-to-trinary ()
  (should (equal '(1 1 2 0) (rebase '(2 10) 16 3))))


(ert-deftest 15-bit-integer ()
  (should (equal '(6 10 45) (rebase '(3 46 60) 97 73))))


(ert-deftest empty-list ()
  (should (equal '(0) (rebase '() 2 10))))


(ert-deftest single-zero ()
  (should (equal '(0) (rebase '(0) 10 2))))


(ert-deftest multiple-zeros ()
  (should (equal '(0) (rebase '(0 0 0) 10 2))))


(ert-deftest leading-zeros ()
  (should (equal '(4 2) (rebase '(0 6 0) 7 10))))


(ert-deftest input-base-is-one ()
  (should-error (rebase '(0) 1 10)))


(ert-deftest input-base-is-zero ()
  (should-error (rebase '() 0 10)))


(ert-deftest input-base-is-negative ()
  (should-error (rebase '(1) -2 10)))


(ert-deftest negative-digit ()
  (should-error (rebase '(1 -1 1 0 1 0) 2 10)))


(ert-deftest invalid-positive-digit ()
  (should-error (rebase '(1 2 1 0 1 0) 2 10)))


(ert-deftest output-base-is-one ()
  (should-error (rebase '(1 0 1 0 1 0) 2 1)))


(ert-deftest output-base-is-zero ()
  (should-error (rebase '(7) 10 0)))


(ert-deftest output-base-is-negative ()
  (should-error (rebase '(1) 2 -7)))


(ert-deftest both-bases-are-negative ()
  (should-error (rebase '(1) -2 -7)))


(provide 'all-your-base-test)
;;; all-your-base-test.el ends here
