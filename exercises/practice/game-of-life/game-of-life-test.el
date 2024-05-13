;;; game-of-life-test.el --- Tests for Conway&#39;s Game of Life (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "game-of-life.el")
(declare-function tick "game-of-life.el" (matrix))


(ert-deftest empty-matrix ()
  (should (equal '()

           (tick '()))))


(ert-deftest live-cells-with-zero-live-neighbors-die ()
  (should (equal '((0 0 0)
                   (0 0 0)
                   (0 0 0))

           (tick '((0 0 0)
                   (0 1 0)
                   (0 0 0))))))


(ert-deftest live-cells-with-only-one-live-neighbor-die ()
  (should (equal '((0 0 0)
                   (0 0 0)
                   (0 0 0))

           (tick '((0 0 0)
                   (0 1 0)
                   (0 1 0))))))


(ert-deftest live-cells-with-two-live-neighbors-stay-alive ()
  (should (equal '((0 0 0)
                   (1 0 1)
                   (0 0 0))

           (tick '((1 0 1)
                   (1 0 1)
                   (1 0 1))))))


(ert-deftest live-cells-with-three-live-neighbors-stay-alive ()
  (should (equal '((0 0 0)
                   (1 0 0)
                   (1 1 0))

           (tick '((0 1 0)
                   (1 0 0)
                   (1 1 0))))))


(ert-deftest dead-cells-with-three-live-neighbors-become-alive ()
  (should (equal '((0 0 0)
                   (1 1 0)
                   (0 0 0))

           (tick '((1 1 0)
                   (0 0 0)
                   (1 0 0))))))


(ert-deftest live-cells-with-four-or-more-neighbors-die ()
  (should (equal '((1 0 1)
                   (0 0 0)
                   (1 0 1))

           (tick '((1 1 1)
                   (1 1 1)
                   (1 1 1))))))


(ert-deftest bigger-matrix ()
  (should (equal '((1 1 0 1 1 0 0 0)
                   (0 0 0 0 0 1 1 0)
                   (1 0 1 1 1 1 0 1)
                   (1 0 0 0 0 0 0 1)
                   (1 1 0 0 1 0 0 1)
                   (1 1 0 1 0 0 0 1)
                   (1 0 0 0 0 0 0 0)
                   (0 0 0 0 0 0 1 1))

           (tick '((1 1 0 1 1 0 0 0)
                   (1 0 1 1 0 0 0 0)
                   (1 1 1 0 0 1 1 1)
                   (0 0 0 0 0 1 1 0)
                   (1 0 0 0 1 1 0 0)
                   (1 1 0 0 0 1 1 1)
                   (0 0 1 0 1 0 0 1)
                   (1 0 0 0 0 0 1 1))))))


(provide 'game-of-life-test)
;;; game-of-life-test.el ends here
