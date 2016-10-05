;;; roman-numerals-test.el --- Tests for roman-numerals (exercism)

;;; Commentary:

;;; Code:

(load-file "roman-numerals.el")

(ert-deftest roman-numerals-test ()
  (should (equal (to-roman 1) "I"))
  (should (equal (to-roman 2) "II"))
  (should (equal (to-roman 3) "III"))
  (should (equal (to-roman 4) "IV"))
  (should (equal (to-roman 5) "V"))
  (should (equal (to-roman 6) "VI"))
  (should (equal (to-roman 9) "IX"))
  (should (equal (to-roman 27) "XXVII"))
  (should (equal (to-roman 48) "XLVIII"))
  (should (equal (to-roman 59) "LIX"))
  (should (equal (to-roman 93) "XCIII"))
  (should (equal (to-roman 141) "CXLI"))
  (should (equal (to-roman 163) "CLXIII"))
  (should (equal (to-roman 402) "CDII"))
  (should (equal (to-roman 575) "DLXXV"))
  (should (equal (to-roman 911) "CMXI"))
  (should (equal (to-roman 1024) "MXXIV"))
  (should (equal (to-roman 3000) "MMM")))

(provide 'roman-numerals)
;;; roman-numerals-test.el ends here
