;;; sublist-test.el --- Tests for Sublist (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "sublist.el")
(declare-function list-classify "sublist.el" (list1 list2))


(ert-deftest empty-lists ()
  (should (equal :equal (list-classify '() '()))))


(ert-deftest empty-list-within-non-empty-list ()
  (should (equal :sublist (list-classify '() '(1 2 3)))))


(ert-deftest non-empty-list-contains-empty-list ()
  (should (equal :superlist (list-classify '(1 2 3) '()))))


(ert-deftest list-equals-itself ()
  (should (equal :equal (list-classify '(1 2 3) '(1 2 3)))))


(ert-deftest different-lists ()
  (should (equal :unequal (list-classify '(1 2 3) '(2 3 4)))))


(ert-deftest false-start ()
  (should (equal :sublist (list-classify '(1 2 5) '(0 1 2 3 1 2 5 6)))))


(ert-deftest consecutive ()
  (should (equal :sublist (list-classify '(1 1 2) '(0 1 1 1 2 1 2)))))


(ert-deftest sublist-at-start ()
  (should (equal :sublist (list-classify '(0 1 2) '(0 1 2 3 4 5)))))


(ert-deftest sublist-in-middle ()
  (should (equal :sublist (list-classify '(2 3 4) '(0 1 2 3 4 5)))))


(ert-deftest sublist-at-end ()
  (should (equal :sublist (list-classify '(3 4 5) '(0 1 2 3 4 5)))))


(ert-deftest at-start-of-superlist ()
  (should (equal :superlist (list-classify '(0 1 2 3 4 5) '(0 1 2)))))


(ert-deftest in-middle-of-superlist ()
  (should (equal :superlist (list-classify '(0 1 2 3 4 5) '(2 3)))))


(ert-deftest at-end-of-superlist ()
  (should (equal :superlist (list-classify '(0 1 2 3 4 5) '(3 4 5)))))


(ert-deftest first-list-missing-element-from-second-list ()
  (should (equal :unequal (list-classify '(1 3) '(1 2 3)))))


(ert-deftest second-list-missing-element-from-first-list ()
  (should (equal :unequal (list-classify '(1 2 3) '(1 3)))))


(ert-deftest first-list-missing-additional-digits-from-second-list ()
  (should (equal :unequal (list-classify '(1 2) '(1 22)))))


(ert-deftest order-matters-to-a-list ()
  (should (equal :unequal (list-classify '(1 2 3) '(3 2 1)))))


(ert-deftest same-digits-but-different-numbers ()
  (should (equal :unequal (list-classify '(1 0 1) '(10 1)))))


(provide 'sublist-test)
;;; sublist-test.el ends here
