;;; armstrong-numbers-test.el --- Tests for armstrong-numbers (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "armstrong-numbers.el")
(declare-function armstrong-p "armstrong-numbers.el" (n))

(ert-deftest armstrong-number-0 ()
  "Zero is an Armstrong number"
  (should (armstrong-p 0)))

(ert-deftest armstrong-number-5 ()
  "Single-digit numbers are Armstrong numbers"
  (should (armstrong-p 5)))


(ert-deftest not-armstrong-number-10 ()
  "There are no two-digit Armstrong numbers"
  (should-not (armstrong-p 10)))


(ert-deftest armstrong-number-153 ()
  "Three-digit number that is an Armstrong number"
  (should (armstrong-p 153)))


(ert-deftest not-armstrong-number-100 ()
  "Three-digit number that is not an Armstrong number"
  (should-not (armstrong-p 100)))


(ert-deftest armstrong-number-9474 ()
  "Four-digit number that is an Armstrong number"
  (should (armstrong-p 9474)))


(ert-deftest not-armstrong-number-9475 ()
  "Four-digit number that is not an Armstrong number"
  (should-not (armstrong-p 9476)))


(ert-deftest armstrong-number-9926315 ()
  "Seven-digit number that is an Armstrong number"
  (should (armstrong-p 9926315)))


(ert-deftest not-armstrong-number-9926314 ()
  "Seven-digit number that is not an Armstrong number"
  (should-not (armstrong-p 9926314)))


(ert-deftest armstrong-number-186709961001538790100634132976990 ()
  "Armstrong number containing seven zeroes that should be an Armstrong number"
  (should (armstrong-p 186709961001538790100634132976990)))


(ert-deftest armstrong-number-115132219018763992565095597973971522401 ()
  "The largest and last Armstrong number should be an Armstrong number"
  (should (armstrong-p 115132219018763992565095597973971522401)))

(provide 'armstrong-numbers-test)
;;; armstrong-numbers-test.el ends here
