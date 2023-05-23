;;; binary-search-test.el --- Binary Search (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "binary-search.el")
(declare-function find-binary "binary-search.el" (array value))


(ert-deftest finds-a-value-in-an-array-with-one-element ()
  (should (= (find-binary [6] 6) 0)))


(ert-deftest finds-a-value-in-the-middle-of-an-array ()
  (should (= (find-binary [1 3 4 6 8 9 11] 6) 3)))


(ert-deftest finds-a-value-at-the-beginning-of-an-array ()
  (should (= (find-binary [1 3 4 6 8 9 11] 1) 0)))


(ert-deftest finds-a-value-at-the-end-of-an-array ()
  (should (= (find-binary [1 3 4 6 8 9 11] 11) 6)))


(ert-deftest finds-a-value-in-an-array-of-odd-length ()
  (should
   (= (find-binary [1 3 5 8 13 21 34 55 89 144 233 377 634] 144) 9)))


(ert-deftest finds-a-value-in-an-array-of-even-length ()
  (should
   (= (find-binary [1 3 5 8 13 21 34 55 89 144 233 377] 21) 5)))


(ert-deftest identifies-that-a-value-is-not-included-in-the-array ()
  (should (equal (find-binary [1 3 4 6 8 9 11] 7) nil)))


(ert-deftest a-value-smaller-than-the-array ()
  (should (equal (find-binary [1 3 4 6 8 9 11] 0) nil)))


(ert-deftest a-value-larger-than-the-array ()
  (should (equal (find-binary [1 3 4 6 8 9 11] 13) nil)))


(ert-deftest nothing-is-found-in-an-empty-array ()
  (should (equal (find-binary [] 1) nil)))


(ert-deftest nothing-is-found-when-the-left-and-right-bounds-cross ()
  (should (equal (find-binary [1 2] 0) nil)))


(provide 'binary-search-test)
;;; binary-search-test.el ends here
