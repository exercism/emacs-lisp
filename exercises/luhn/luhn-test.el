;;; luhn-test.el --- Tests for luhn (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)
(load-file "luhn.el")

(ert-deftest an-empty-string ()
  (should-not (luhn-p "")))

(ert-deftest space-only ()
  (should-not (luhn-p "   ")))

(ert-deftest single-digit ()
  (should-not (luhn-p "0")))

(ert-deftest another-single-digit ()
  (should-not (luhn-p "9")))

(ert-deftest single-digit-with-space ()
  (should-not (luhn-p "0  ")))

(ert-deftest multiple-zeros ()
  (should (luhn-p "0000")))

(ert-deftest multiple-zeros-with-space ()
  (should (luhn-p "0 0 0")))

(ert-deftest a-valid-3-digit-input-that-can-be-reversed ()
  (should (luhn-p "059")))

(ert-deftest an-invalid-3-digit-input ()
  (should-not (luhn-p "095")))

(ert-deftest a-valid-luhn-number ()
  (should (luhn-p "49927398716")))

(ert-deftest an-invalid-11-digit-number ()
  (should-not (luhn-p "49927398717")))

(ert-deftest invalid-16-digit-luhn-number ()
  (should-not (luhn-p  "1234567812345678")))

(ert-deftest 16-digits-valid-luhn-number ()
  (should (luhn-p "1234567812345670")))

(ert-deftest input-string-containing-a-letter-in-the-middle ()
  (should-error (luhn-p "1234567a45670")))

(ert-deftest input-string-containing-a-punctuation-in-the-middle ()
  (should-error (luhn-p "12_45678!!@45670")))

(provide 'luhn-test)
;;; luhn-test.el ends here

