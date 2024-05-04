;;; triangle-test.el --- Tests for Triangle (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "triangle.el")
(declare-function equilateralp "triangle.el" (sides))
(declare-function isoscelesp "triangle.el" (sides))
(declare-function scalenep "triangle.el" (sides))


(ert-deftest all-sides-are-equal ()
  (should (equilateralp '(2 2 2))))


(ert-deftest any-side-is-unequal ()
  (should-not (equilateralp '(2 3 2))))


(ert-deftest no-sides-are-equal ()
  (should-not (equilateralp '(5 4 6))))


(ert-deftest all-zero-sides-is-not-a-triangle ()
  (should-not (equilateralp '(0 0 0))))


(ert-deftest sides-may-be-floats ()
  (should (equilateralp '(0.5 0.5 0.5))))


(ert-deftest last-two-sides-are-equal ()
  (should (isoscelesp '(3 4 4))))


(ert-deftest first-two-sides-are-equal ()
  (should (isoscelesp '(4 4 3))))


(ert-deftest first-and-last-sides-are-equal ()
  (should (isoscelesp '(4 3 4))))


(ert-deftest equilateral-triangles-are-also-isosceles ()
  (should (isoscelesp '(4 4 4))))


(ert-deftest no-sides-are-equal ()
  (should-not (isoscelesp '(2 3 4))))


(ert-deftest first-triangle-inequality-violation ()
  (should-not (isoscelesp '(1 1 3))))


(ert-deftest second-triangle-inequality-violation ()
  (should-not (isoscelesp '(1 3 1))))


(ert-deftest third-triangle-inequality-violation ()
  (should-not (isoscelesp '(3 1 1))))


(ert-deftest sides-may-be-floats ()
  (should (isoscelesp '(0.5 0.4 0.5))))


(ert-deftest no-sides-are-equal ()
  (should (scalenep '(5 4 6))))


(ert-deftest all-sides-are-equal ()
  (should-not (scalenep '(4 4 4))))


(ert-deftest first-and-second-sides-are-equal ()
  (should-not (scalenep '(4 4 3))))


(ert-deftest first-and-third-sides-are-equal ()
  (should-not (scalenep '(3 4 3))))


(ert-deftest second-and-third-sides-are-equal ()
  (should-not (scalenep '(4 3 3))))


(ert-deftest may-not-violate-triangle-inequality ()
  (should-not (scalenep '(7 3 2))))


(ert-deftest sides-may-be-floats ()
  (should (scalenep '(0.5 0.4 0.6))))

(provide 'triangle-test)
;;; triangle-test.el ends here
