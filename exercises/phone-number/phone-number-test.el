;;; phone-number-test.el --- Tests for phone-number (exercism)

;;; Commentary:

;;; Code:

(load-file "phone-number.el")


(ert-deftest cleans-number-test ()
  (should (equal (numbers "(123) 456-7890") "1234567890")))


(ert-deftest cleans-numbers-with-dots-test ()
  (should (equal (numbers "123.456.7890") "1234567890")))


(ert-deftest valid-when-11-digits-and-first-is-1-test ()
  (should (equal (numbers "11234567890") "1234567890")))


(ert-deftest invalid-when-11-digits-test ()
  (should (equal (numbers "21234567890") "0000000000")))


(ert-deftest invalid-when-9-digits-test ()
  (should (equal (numbers "123456789") "0000000000")))


(ert-deftest area-code-test ()
  (should (equal (area-code "1234567890") "123")))


(ert-deftest pprint-test ()
  (should (equal (pprint "1234567890") "(123) 456-7890")))


(ert-deftest pprint-full-us-phone-number-test ()
  (should (equal (pprint "11234567890") "(123) 456-7890")))


(provide 'phone-number)
;;; phone-number-test.el ends here
