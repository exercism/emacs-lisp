;;; zebra-puzzle-test.el --- Zebra Puzzle (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "zebra-puzzle.el")
(declare-function drinks-water "zebra-puzzle.el" ())
(declare-function owns-zebra "zebra-puzzle.el" ())


(ert-deftest resident-who-drinks-water ()
  ;; Function under test: drinks-water
  ;; Input: {}
  ;; Expected: "Norwegian"
  (should (string= (drinks-water) "Norwegian")))


(ert-deftest resident-who-owns-zebra ()
  ;; Function under test: owns-zebra
  ;; Input: {}
  ;; Expected: "Japanese"
  (should (string= (owns-zebra) "Japanese")))


(provide 'zebra-puzzle-test)
;;; zebra-puzzle-test.el ends here

