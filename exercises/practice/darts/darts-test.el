;;; darts-test.el --- Darts (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "darts.el")
(declare-function score "darts.el" (x y))


(ert-deftest missed-target ()
  ;; Function under test: score
  ;; Input: {"x":-9,"y":9}
  ;; Expected: 0
  (should (equal 0 (score -9 9))))


(ert-deftest on-the-outer-circle ()
  ;; Function under test: score
  ;; Input: {"x":0,"y":10}
  ;; Expected: 1
  (should (equal 1 (score 0 10))))


(ert-deftest on-the-middle-circle ()
  ;; Function under test: score
  ;; Input: {"x":-5,"y":0}
  ;; Expected: 5
  (should (equal 5 (score -5 0))))


(ert-deftest on-the-inner-circle ()
  ;; Function under test: score
  ;; Input: {"x":0,"y":-1}
  ;; Expected: 10
  (should (equal 10 (score 0 -1))))


(ert-deftest exactly-on-center ()
  ;; Function under test: score
  ;; Input: {"x":0,"y":0}
  ;; Expected: 10
  (should (equal 10 (score 0 0))))


(ert-deftest near-the-center ()
  ;; Function under test: score
  ;; Input: {"x":-0.1,"y":-0.1}
  ;; Expected: 10
  (should (equal 10 (score -0.1 -0.1))))


(ert-deftest just-within-the-inner-circle ()
  ;; Function under test: score
  ;; Input: {"x":0.7,"y":0.7}
  ;; Expected: 10
  (should (equal 10 (score 0.7 0.7))))


(ert-deftest just-outside-the-inner-circle ()
  ;; Function under test: score
  ;; Input: {"x":0.8,"y":-0.8}
  ;; Expected: 5
  (should (equal 5 (score 0.8 0.8))))


(ert-deftest just-within-the-middle-circle ()
  ;; Function under test: score
  ;; Input: {"x":-3.5,"y":3.5}
  ;; Expected: 5
  (should (equal 5 (score -3.5 3.5))))


(ert-deftest just-outside-the-middle-circle ()
  ;; Function under test: score
  ;; Input: {"x":-3.6,"y":-3.6}
  ;; Expected: 1
  (should (equal 1 (score -3.6 -3.6))))


(ert-deftest just-within-the-outer-circle ()
  ;; Function under test: score
  ;; Input: {"x":-7.0,"y":7.0}
  ;; Expected: 1
  (should (equal 1 (score -7.0 7.0))))


(ert-deftest just-outside-the-outer-circle ()
  ;; Function under test: score
  ;; Input: {"x":7.1,"y":-7.1}
  ;; Expected: 0
  (should (equal 0 (score 7.1 -7.1))))


(ert-deftest asymmetric-position-between-the-inner-and-middle-circles
    ()
  ;; Function under test: score
  ;; Input: {"x":0.5,"y":-4}
  ;; Expected: 5
  (should (equal 5 (score 0.5 -4))))


(provide 'darts-test)
;;; darts-test.el ends here
