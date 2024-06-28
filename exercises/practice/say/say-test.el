;;; say-test.el --- Say (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "say.el")
(declare-function say "say.el" (number))


(ert-deftest zero ()
  (should (string= (say 0) "zero")))


(ert-deftest one ()
  (should (string= (say 1) "one")))


(ert-deftest fourteen ()
  (should (string= (say 14) "fourteen")))


(ert-deftest twenty ()
  (should (string= (say 20) "twenty")))


(ert-deftest twenty-two ()
  (should (string= (say 22) "twenty-two")))


(ert-deftest thirty ()
  (should (string= (say 30) "thirty")))


(ert-deftest ninety-nine ()
  (should (string= (say 99) "ninety-nine")))


(ert-deftest one-hundred ()
  (should (string= (say 100) "one hundred")))


(ert-deftest one-hundred-twenty-three ()
  (should (string= (say 123) "one hundred twenty-three")))


(ert-deftest two-hundred ()
  (should (string= (say 200) "two hundred")))


(ert-deftest nine-hundred-ninety-nine ()
  (should (string= (say 999) "nine hundred ninety-nine")))


(ert-deftest one-thousand ()
  (should (string= (say 1000) "one thousand")))


(ert-deftest one-thousand-two-hundred-thirty-four ()
  (should (string= (say 1234) "one thousand two hundred thirty-four")))


(ert-deftest one-million ()
  (should (string= (say 1000000) "one million")))


(ert-deftest one-million-two-thousand-three-hundred-forty-five ()
  (should (string= (say 1002345) "one million two thousand three hundred forty-five")))


(ert-deftest one-billion ()
  (should (string= (say 1000000000) "one billion")))


(ert-deftest a-big-number ()
  (should (string= (say 987654321123) "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three")))


(ert-deftest numbers-below-zero-are-out-of-range ()
  (should-error (say -1) :type 'out-of-range))


(ert-deftest numbers-above-999999999999-are-out-of-range ()
  (should-error (say 1000000000000) :type 'out-of-range))


(provide 'say-test)
;;; say-test.el ends here
