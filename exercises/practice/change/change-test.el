;;; change-test.el --- Tests for Change (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "change.el")
(declare-function find-fewest-coins "change.el" (target coins))


(ert-deftest change-for-1-cent ()
  (should (equal '(1)
                 (find-fewest-coins 1 '(1 5 10 25)))))


(ert-deftest single-coin-change ()
  (should (equal '(25)
                 (find-fewest-coins 25 '(1 5 10 25 100)))))


(ert-deftest multiple-coin-change ()
  (should (equal '(5 10)
                 (find-fewest-coins 15 '(1 5 10 25 100)))))


(ert-deftest change-with-lilliputian-coins ()
  (should (equal '(4 4 15)
                 (find-fewest-coins 23 '(1 4 15 20 50)))))


(ert-deftest change-with-lower-elbonia-coins ()
  (should (equal '(21 21 21)
                 (find-fewest-coins 63 '(1 5 10 21 25)))))


(ert-deftest large-target-values ()
  (should (equal '(2 2 5 20 20 50 100 100 100 100 100 100 100 100 100)
                 (find-fewest-coins 999 '(1 2 5 10 20 50 100)))))


(ert-deftest possible-change-without-unit-coins-available ()
  (should (equal '(2 2 2 5 10)
                 (find-fewest-coins 21 '(2 5 10 20 50)))))


(ert-deftest another-possible-change-without-unit-coins-available ()
  (should (equal '(4 4 4 5 5 5)
                 (find-fewest-coins 27 '(4 5)))))


(ert-deftest a-greedy-approach-is-not-optimal ()
  (should (equal '(10 10)
                 (find-fewest-coins 20 '(1 10 11)))))


(ert-deftest no-coins-make-0-change ()
  (should (equal '()
                 (find-fewest-coins 0 '(1 5 10 21 25)))))


(ert-deftest error-testing-for-change-smaller-than-the-smallest-of-coins ()
  (should-error (find-fewest-coins 3 '(5 10))))


(ert-deftest error-if-no-combination-can-add-up-to-target ()
  (should-error (find-fewest-coins 94 '(5 10))))


(ert-deftest cannot-find-negative-change-values ()
  (should-error (find-fewest-coins -5 '(1 2 5))))


(provide 'change-test)
;;; change-test.el ends here
