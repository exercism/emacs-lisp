;;; saddle-points-test.el --- Tests for Saddle Points (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "saddle-points.el")
(declare-function saddle-points "saddle-points.el" (matrix))


(ert-deftest can-identify-single-saddle-point ()
  (should (equal '((2 . 1))
                 (saddle-points '((9 8 7)
                                  (5 3 2)
                                  (6 6 7))))))


(ert-deftest can-identify-that-empty-matrix-has-no-saddle-points ()
  (should (equal '()
                 (saddle-points '(())))))


(ert-deftest can-identify-lack-of-saddle-points-when-there-are-none ()
  (should (equal '()
                 (saddle-points '((1 2 3)
                                  (3 1 2)
                                  (2 3 1))))))


(ert-deftest can-identify-multiple-saddle-points-in-a-column ()
  (should (equal '((1 . 2) (2 . 2) (3 . 2))
                 (saddle-points '((4 5 4)
                                  (3 5 5)
                                  (1 5 4))))))


(ert-deftest can-identify-multiple-saddle-points-in-a-row ()
  (should (equal '((2 . 1) (2 . 2) (2 . 3))
                 (saddle-points '((6 7 8)
                                  (5 5 5)
                                  (7 5 6))))))


(ert-deftest can-identify-saddle-point-in-bottom-right-corner ()
  (should (equal '((3 . 3))
                 (saddle-points '((8 7 9)
                                  (6 7 6)
                                  (3 2 5))))))


(ert-deftest can-identify-saddle-points-in-a-non-square-matrix ()
  (should (equal '((1 . 1) (1 . 3))
                 (saddle-points '((3 1 3)
                                  (3 2 4))))))


(ert-deftest
    can-identify-that-saddle-points-in-a-single-column-matrix-are-those-with-the-minimum-value
    ()
  (should (equal '((2 . 1) (4 . 1))
                 (saddle-points '((2)
                                  (1)
                                  (4)
                                  (1))))))


(ert-deftest
    can-identify-that-saddle-points-in-a-single-row-matrix-are-those-with-the-maximum-value
    ()
  (should (equal '((1 . 2) (1 . 4))
                 (saddle-points '((2 5 3 5))))))


(provide 'saddle-points-test)
;;; saddle-points-test.el ends here
