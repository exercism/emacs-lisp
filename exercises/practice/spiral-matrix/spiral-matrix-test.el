;;; spiral-matrix-test.el --- Tests for Spiral Matrix (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "spiral-matrix.el")
(declare-function spiral-matrix "spiral-matrix.el" (size))


(ert-deftest empty-spiral ()
  (should (equal [] (spiral-matrix 0))))


(ert-deftest trivial-spiral ()
  (should (equal [[1]] (spiral-matrix 1))))


(ert-deftest spiral-of-size-2 ()
  (should (equal [[1 2]
                  [4 3]] (spiral-matrix 2))))


(ert-deftest spiral-of-size-3 ()
  (should (equal [[1 2 3]
                  [8 9 4]
                  [7 6 5]] (spiral-matrix 3))))


(ert-deftest spiral-of-size-4 ()
  (should (equal [[1 2 3 4]
                  [12 13 14 5]
                  [11 16 15 6]
                  [10 9 8 7]] (spiral-matrix 4))))


(ert-deftest spiral-of-size-5 ()
  (should (equal [[1 2 3 4 5]
                  [16 17 18 19 6]
                  [15 24 25 20 7]
                  [14 23 22 21 8]
                  [13 12 11 10 9]] (spiral-matrix 5))))


(provide 'spiral-matrix-test)
;;; spiral-matrix-test.el ends here
