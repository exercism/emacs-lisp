;;; palindrome-products-test.el --- Tests for Palindrome Products (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "palindrome-products.el")
(declare-function smallest "palindrome-products.el" (min-factor max-factor))
(declare-function largest "palindrome-products.el" (min-factor max-factor))


(ert-deftest find-the-smallest-palindrome-from-single-digit-factors ()
  (should (equal '(:value 1
                   :factors ((1 1)))
                 (smallest 1 9))))


(ert-deftest find-the-largest-palindrome-from-single-digit-factors ()
  (should (equal '(:value 9
                   :factors ((1 9) (3 3)))
                 (largest 1 9))))


(ert-deftest find-the-smallest-palindrome-from-double-digit-factors ()
  (should (equal '(:value 121
                   :factors ((11 11)))
                 (smallest 10 99))))


(ert-deftest find-the-largest-palindrome-from-double-digit-factors ()
  (should (equal '(:value 9009
                   :factors ((91 99)))
                 (largest 10 99))))


(ert-deftest find-the-smallest-palindrome-from-triple-digit-factors ()
  (should (equal '(:value 10201
                   :factors ((101 101)))
                 (smallest 100 999))))


(ert-deftest find-the-largest-palindrome-from-triple-digit-factors ()
  (should (equal '(:value 906609
                   :factors ((913 993)))
                 (largest 100 999))))


(ert-deftest find-the-smallest-palindrome-from-four-digit-factors ()
  (should (equal '(:value 1002001
                   :factors ((1001 1001)))
                 (smallest 1000 9999))))


(ert-deftest find-the-largest-palindrome-from-four-digit-factors ()
  (should (equal '(:value 99000099
                   :factors ((9901 9999)))
                 (largest 1000 9999))))


(ert-deftest empty-result-for-smallest-if-no-palindrome-in-the-range ()
  (should (equal '(:value nil
                   :factors ())
                 (smallest 1002 1003))))


(ert-deftest empty-result-for-largest-if-no-palindrome-in-the-range ()
  (should (equal '(:value nil
                   :factors ())
                 (largest 15 15))))


(ert-deftest error-result-for-smallest-if-min-is-more-than-max ()
  (should-error (smallest 10000 1)))


(ert-deftest error-result-for-largest-if-min-is-more-than-max ()
  (should-error (largest 2 1)))


(ert-deftest smallest-product-does-not-use-the-smallest-factor ()
  (should (equal '(:value 10988901
                   :factors ((3297 3333)))
                 (smallest 3215 4000))))

(ert-deftest find-the-smallest-palindrome-from-six-digit-factors ()
  (should (equal '(:value 50067176005
                   :factors ((223619 223895)))
                 (smallest 223617 244818))))

(ert-deftest find-the-largest-palindrome-from-six-digit-factors ()
  (should (equal '(:value 59842824895
                   :factors ((244445 244811)))
                 (largest 223617 244818))))

(provide 'palindrome-products-test)
;;; palindrome-products-test.el ends here
