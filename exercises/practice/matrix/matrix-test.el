;;; matrix-test.el --- Tests for Matrix (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "matrix.el")
(declare-function row "matrix.el" (string index))
(declare-function column "matrix.el" (string index))


(ert-deftest extract-row-from-one-number-matrix ()
  (should (equal [1] (row "1" 1))))


(ert-deftest can-extract-row ()
  (should (equal [3 4] (row "1 2\n3 4" 2))))


(ert-deftest extract-row-where-numbers-have-different-widths ()
  (should (equal [10 20] (row "1 2\n10 20" 2))))


(ert-deftest can-extract-row-from-non-square-matrix-with-no-corresponding-column ()
  (should (equal [8 7 6] (row "1 2 3\n4 5 6\n7 8 9\n8 7 6" 4))))


(ert-deftest extract-column-from-one-number-matrix ()
  (should (equal [1] (column "1" 1))))


(ert-deftest can-extract-column ()
  (should (equal [3 6 9] (column "1 2 3\n4 5 6\n7 8 9" 3))))


(ert-deftest can-extract-column-from-non-square-matrix-with-no-corresponding-row ()
  (should (equal [4 8 6] (column "1 2 3 4\n5 6 7 8\n9 8 7 6" 4))))


(ert-deftest extract-column-where-numbers-have-different-widths ()
  (should (equal [1903 3 4] (column "89 1903 3\n18 3 1\n9 4 800" 2))))


(provide 'matrix-test)
;;; matrix-test.el ends here
