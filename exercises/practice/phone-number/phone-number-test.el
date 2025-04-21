;;; phone-number-test.el --- Phone Number (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "phone-number.el")
(declare-function numbers "phone-number.el" (num))
(declare-function area-code "phone-number.el" (num))
(declare-function pprint "phone-number.el" (num))

(ert-deftest cleans-the-number ()
  (should (string= (numbers "(223) 456-7890") "2234567890")))

(ert-deftest cleans-numbers-with-dots ()
  (should (string= (numbers "223.456.7890") "2234567890")))

(ert-deftest cleans-numbers-with-multiple-spaces ()
  (should (string= (numbers "223 456   7890   ") "2234567890")))

(ert-deftest invalid-when-9-digits ()
  (should (string= (cadr (should-error (numbers "123456789")))
                   "must not be fewer than 10 digits")))

(ert-deftest invalid-when-11-digits-does-not-start-with-a-1 ()
  (should (string= (cadr (should-error (numbers "22234567890")))
                   "11 digits must start with 1")))

(ert-deftest valid-when-11-digits-and-starting-with-1 ()
  (should (string= (numbers "12234567890") "2234567890")))

(ert-deftest valid-when-11-digits-and-starting-with-1-even-with-punctuation ()
  (should (string= (numbers "+1 (223) 456-7890") "2234567890")))

(ert-deftest invalid-when-more-than-11-digits ()
  (should (string= (cadr (should-error (numbers "321234567890")))
                   "must not be greater than 11 digits")))

(ert-deftest invalid-with-letters ()
  (should (string= (cadr (should-error (numbers "523-abc-7890")))
                   "letters not permitted")))

(ert-deftest invalid-with-punctuations ()
  (should (string= (cadr (should-error (numbers "523-@:!-7890")))
                   "punctuations not permitted")))

(ert-deftest invalid-if-area-code-starts-with-0 ()
  (should (string= (cadr (should-error (numbers "(023) 456-7890")))
                   "area code cannot start with zero")))

(ert-deftest invalid-if-area-code-starts-with-1 ()
  (should (string= (cadr (should-error (numbers "(123) 456-7890")))
                   "area code cannot start with one")))

(ert-deftest invalid-if-exchange-code-starts-with-0 ()
  (should (string= (cadr (should-error (numbers "(223) 056-7890")))
                   "exchange code cannot start with zero")))

(ert-deftest invalid-if-exchange-code-starts-with-1 ()
  (should (string= (cadr (should-error (numbers "(223) 156-7890")))
                   "exchange code cannot start with one")))

(ert-deftest invalid-if-area-code-starts-with-0-on-valid-11-digit-number ()
  (should (string= (cadr (should-error (numbers "1 (023) 456-7890")))
                   "area code cannot start with zero")))

(ert-deftest invalid-if-area-code-starts-with-1-on-valid-11-digit-number ()
  (should (string= (cadr (should-error (numbers "1 (123) 456-7890")))
                   "area code cannot start with one")))

(ert-deftest invalid-if-exchange-code-starts-with-0-on-valid-11-digit-number ()
  (should (string= (cadr (should-error (numbers "1 (223) 056-7890")))
                   "exchange code cannot start with zero")))

(ert-deftest invalid-if-exchange-code-starts-with-1-on-valid-11-digit-number ()
  (should (string= (cadr (should-error (numbers "1 (223) 156-7890")))
                   "exchange code cannot start with one")))

(ert-deftest area-code-test ()
  (should (equal (area-code "2234567890") "223")))


(ert-deftest pprint-test ()
  (should (equal (pprint "2234567890") "(223) 456-7890")))


(ert-deftest pprint-full-us-phone-number-test ()
  (should (equal (pprint "12234567890") "(223) 456-7890")))

(provide 'phone-number-test)
;;; phone-number-test.el ends here

