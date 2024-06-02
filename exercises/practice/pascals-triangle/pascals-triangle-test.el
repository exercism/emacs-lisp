;;; pascals-triangle-test.el --- Tests for Pascal's Triangle (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "pascals-triangle.el")
(declare-function rows "pascals-triangle.el" (count))


(ert-deftest zero-rows ()
  (should (equal [] (rows 0))))


(ert-deftest single-row ()
  (should (equal [[1]] (rows 1))))


(ert-deftest two-rows ()
  (should (equal [[1]
                  [1 1]] (rows 2))))


(ert-deftest three-rows ()
  (should (equal [[1]
                  [1 1]
                  [1 2 1]] (rows 3))))


(ert-deftest four-rows ()
  (should (equal [[1]
                  [1 1]
                  [1 2 1]
                  [1 3 3 1]] (rows 4))))


(ert-deftest five-rows ()
  (should (equal [[1]
                  [1 1]
                  [1 2 1]
                  [1 3 3 1]
                  [1 4 6 4 1]] (rows 5))))


(ert-deftest six-rows ()
  (should (equal [[1]
                  [1 1]
                  [1 2 1]
                  [1 3 3 1]
                  [1 4 6 4 1]
                  [1 5 10 10 5 1]] (rows 6))))


(ert-deftest ten-rows ()
  (should (equal [[1]
                  [1 1]
                  [1 2 1]
                  [1 3 3 1]
                  [1 4 6 4 1]
                  [1 5 10 10 5 1]
                  [1 6 15 20 15 6 1]
                  [1 7 21 35 35 21 7 1]
                  [1 8 28 56 70 56 28 8 1]
                  [1 9 36 84 126 126 84 36 9 1]] (rows 10))))


(provide 'pascals-triangle-test)
;;; pascals-triangle-test.el ends here
