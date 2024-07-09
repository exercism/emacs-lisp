;;; resistor-color-trio-test.el --- Resistor Color Trio (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "resistor-color-trio.el")
(declare-function label "resistor-color-trio.el" (colors))


(ert-deftest orange-and-orange-and-black ()
  (should (string= (label '("orange" "orange" "black"))
                   "33 ohms")))

(ert-deftest blue-and-grey-and-brown ()
  (should (string= (label '("blue" "grey" "brown"))
                   "680 ohms")))

(ert-deftest red-and-black-and-red ()
  (should (string= (label '("red" "black" "red"))
                   "2 kiloohms")))

(ert-deftest green-and-brown-and-orange ()
  (should (string= (label '("green" "brown" "orange"))
                   "51 kiloohms")))

(ert-deftest yellow-and-violet-and-yellow ()
  (should (string= (label '("yellow" "violet" "yellow"))
                   "470 kiloohms")))

(ert-deftest blue-and-violet-and-blue ()
  (should (string= (label '("blue" "violet" "blue"))
                   "67 megaohms")))

(ert-deftest minimum-possible-value ()
  (should (string= (label '("black" "black" "black"))
                   "0 ohms")))

(ert-deftest maximum-possible-value ()
  (should (string= (label '("white" "white" "white"))
                   "99 gigaohms")))

(ert-deftest first-two-colors-make-an-invalid-octal-number ()
  (should (string= (label '("black" "grey" "black"))
                   "8 ohms")))

(ert-deftest ignore-extra-colors ()
  (should (string= (label '("blue" "green" "yellow" "orange"))
                   "650 kiloohms")))

(provide 'resistor-color-trio-test)
;;; resistor-color-trio-test.el ends here
