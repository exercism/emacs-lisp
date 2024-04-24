;;; resistor-color-duo-test.el --- Resistor Color Duo (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "resistor-color-duo.el")
(declare-function value "resistor-color-duo.el" (colors))


(ert-deftest brown-and-black ()
  (should (equal (value '("brown" "black")) 10)))


(ert-deftest blue-and-grey ()
  (should (equal (value '("blue" "grey")) 68)))


(ert-deftest yellow-and-violet ()
  (should (equal (value '("yellow" "violet")) 47)))


(ert-deftest white-and-red ()
  (should (equal (value '("white" "red")) 92)))


(ert-deftest orange-and-orange ()
  (should (equal (value '("orange" "orange")) 33)))


(ert-deftest ignore-additional-colors ()
  (should (equal (value '("green" "brown" "orange")) 51)))


(ert-deftest black-and-brown-one-digit ()
  (should (equal (value '("black" "brown")) 1)))


(provide 'resistor-color-duo-test)
;;; resistor-color-duo-test.el ends here
