;;; roman-numerals-test.el --- Tests for roman-numerals (exercism)

;;; Commentary:

;;; Code:

(load-file "roman-numerals.el")

(ert-deftest to-roman-1 ()
  (should (equal (to-roman 1) "I")))

(ert-deftest to-roman-2 ()
  (should (equal (to-roman 2) "II")))

(ert-deftest to-roman-3 ()
  (should (equal (to-roman 3) "III")))

(ert-deftest to-roman-4 ()
  (should (equal (to-roman 4) "IV")))

(ert-deftest to-roman-5 ()
  (should (equal (to-roman 5) "V")))

(ert-deftest to-roman-6 ()
  (should (equal (to-roman 6) "VI")))

(ert-deftest to-roman-9 ()
  (should (equal (to-roman 9) "IX")))

(ert-deftest to-roman-27 ()
  (should (equal (to-roman 27) "XXVII")))

(ert-deftest to-roman-48 ()
  (should (equal (to-roman 48) "XLVIII")))

(ert-deftest to-roman-59 ()
  (should (equal (to-roman 59) "LIX")))

(ert-deftest to-roman-93 ()
  (should (equal (to-roman 93) "XCIII")))

(ert-deftest to-roman-141 ()
  (should (equal (to-roman 141) "CXLI")))

(ert-deftest to-roman-163 ()
  (should (equal (to-roman 163) "CLXIII")))

(ert-deftest to-roman-402 ()
  (should (equal (to-roman 402) "CDII")))

(ert-deftest to-roman-575 ()
  (should (equal (to-roman 575) "DLXXV")))

(ert-deftest to-roman-911 ()
  (should (equal (to-roman 911) "CMXI")))

(ert-deftest to-roman-1024 ()
  (should (equal (to-roman 1024) "MXXIV")))

(ert-deftest to-roman-3000 ()
  (should (equal (to-roman 3000) "MMM")))

(provide 'roman-numerals)
;;; roman-numerals-test.el ends here
