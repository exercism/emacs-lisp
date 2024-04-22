;;; roman-numerals-test.el --- Tests for roman-numerals (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "roman-numerals.el")
(declare-function to-roman "roman-numerals.el" (value))


(ert-deftest 1-is-I ()
  (should (string= "I" (to-roman 1))))


(ert-deftest 2-is-II ()
  (should (string= "II" (to-roman 2))))


(ert-deftest 3-is-III ()
  (should (string= "III" (to-roman 3))))


(ert-deftest 4-is-IV ()
  (should (string= "IV" (to-roman 4))))


(ert-deftest 5-is-V ()
  (should (string= "V" (to-roman 5))))


(ert-deftest 6-is-VI ()
  (should (string= "VI" (to-roman 6))))


(ert-deftest 9-is-IX ()
  (should (string= "IX" (to-roman 9))))


(ert-deftest 16-is-XVI ()
  (should (string= "XVI" (to-roman 16))))


(ert-deftest 27-is-XXVII ()
  (should (string= "XXVII" (to-roman 27))))


(ert-deftest 48-is-XLVIII ()
  (should (string= "XLVIII" (to-roman 48))))


(ert-deftest 49-is-XLIX ()
  (should (string= "XLIX" (to-roman 49))))


(ert-deftest 59-is-LIX ()
  (should (string= "LIX" (to-roman 59))))


(ert-deftest 66-is-LXVI ()
  (should (string= "LXVI" (to-roman 66))))


(ert-deftest 93-is-XCIII ()
  (should (string= "XCIII" (to-roman 93))))


(ert-deftest 141-is-CXLI ()
  (should (string= "CXLI" (to-roman 141))))


(ert-deftest 163-is-CLXIII ()
  (should (string= "CLXIII" (to-roman 163))))


(ert-deftest 166-is-CLXVI ()
  (should (string= (to-roman 166) "CLXVI")))


(ert-deftest 402-is-CDII ()
  (should (string= "CDII" (to-roman 402))))


(ert-deftest 575-is-DLXXV ()
  (should (string= "DLXXV" (to-roman 575))))


(ert-deftest 666-is-DCLXVI ()
  (should (string= "DCLXVI" (to-roman 666))))


(ert-deftest 911-is-CMXI ()
  (should (string= "CMXI" (to-roman 911))))


(ert-deftest 1024-is-MXXIV ()
  (should (string= "MXXIV" (to-roman 1024))))


(ert-deftest 1666-is-MDCLXVI ()
  (should (string= "MDCLXVI" (to-roman 1666))))


(ert-deftest 3000-is-MMM ()
  (should (string= "MMM" (to-roman 3000))))


(ert-deftest 3001-is-MMMI ()
  (should (string= "MMMI" (to-roman 3001))))


(ert-deftest 3888-is-MMMDCCCLXXXVIII ()
  (should (string= "MMMDCCCLXXXVIII" (to-roman 3888))))


(ert-deftest 3999-is-MMMCMXCIX ()
  (should (string= "MMMCMXCIX" (to-roman 3999 ))))


(provide 'roman-numerals-test)
;;; roman-numerals-test.el ends here
