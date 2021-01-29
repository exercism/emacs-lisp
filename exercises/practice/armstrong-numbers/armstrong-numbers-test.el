;;; armstrong-numbers-test.el --- Tests for armstrong-numbers (exercism)

;;; Commentary:

;;; Code:

(load-file "armstrong-numbers.el")

(ert-deftest armstrong-number-5 ()
  "Single digit numbers are Armstrong numbers"
  (should (armstrong-p 5)))

(ert-deftest not-armstrong-number-10 ()
  "There are no 2 digit Armstrong numbers"
  (should (not (armstrong-p 10))))

(ert-deftest armstrong-number-153 ()
  "Three digit number that should an Armstrong number"
  (should (armstrong-p 153)))

(ert-deftest not-armstrong-number-100 ()
  "Three digit number that should an Armstrong number"
  (should (not (armstrong-p 100))))

(ert-deftest armstrong-number-9474 ()
  "Four digit number that should an Armstrong number"
  (should (armstrong-p 9474)))

(ert-deftest not-armstrong-number-9475 ()
  "Four digit number that should not an Armstrong number"
  (should (not (armstrong-p 9476))))

(ert-deftest armstrong-number-9926315 ()
  "Seven digit number that should an Armstrong number"
  (should (armstrong-p 9926315)))

(ert-deftest not-armstrong-number-9926314 ()
  "Seven digit number that should not an Armstrong number"
  (should (not (armstrong-p 9926314))))

;;; armstrong-numbers-test.el ends here
