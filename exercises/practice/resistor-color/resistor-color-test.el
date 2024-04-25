;;; resistor-color-test.el --- Resistor Color (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "resistor-color.el")
(declare-function color-code "resistor-color.el" (color))
(declare-function colors "resistor-color.el" ())


(ert-deftest black ()
  (should (= 0 (color-code "black"))))


(ert-deftest white ()
  (should (= 9 (color-code "white"))))


(ert-deftest orange ()
  (should (= 3 (color-code "orange"))))


(ert-deftest colors ()
  (should (equal '("black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white")
                  (colors))))


(provide 'resistor-color-test)
;;; resistor-color-test.el ends here

