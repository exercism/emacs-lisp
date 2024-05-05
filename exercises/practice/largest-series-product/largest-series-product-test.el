;;; largest-series-product-test.el --- Tests for Largest Series Product (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "largest-series-product.el")
(declare-function largest-product "largest-series-product.el" (digits span))


(ert-deftest finds-the-largest-product-if-span-equals-length ()
  (should (equal 18 (largest-product "29" 2))))


(ert-deftest can-find-the-largest-product-of-2-with-numbers-in-order ()
  (should (equal 72 (largest-product "0123456789" 2))))


(ert-deftest can-find-the-largest-product-of-2 ()
  (should (equal 48 (largest-product "576802143" 2))))


(ert-deftest can-find-the-largest-product-of-3-with-numbers-in-order ()
  (should (equal 504 (largest-product "0123456789" 3))))


(ert-deftest can-find-the-largest-product-of-3 ()
  (should (equal 270 (largest-product "1027839564" 3))))


(ert-deftest can-find-the-largest-product-of-5-with-numbers-in-order ()
  (should (equal 15120 (largest-product "0123456789" 5))))


(ert-deftest can-get-the-largest-product-of-a-big-number ()
  (should (equal 23520 (largest-product "73167176531330624919225119674426574742355349194934" 6))))


(ert-deftest reports-zero-if-the-only-digits-are-zero ()
  (should (equal 0 (largest-product "0000" 2))))


(ert-deftest reports-zero-if-all-spans-include-zero ()
  (should (equal 0 (largest-product "99099" 3))))


(ert-deftest rejects-span-longer-than-string-length ()
  (should-error (largest-product "123" 4)))


(ert-deftest reports-1-for-empty-string-and-empty-product-zero-span ()
  (should (equal 1 (largest-product "" 0))))


(ert-deftest reports-1-for-nonempty-string-and-empty-product-zero-span ()
  (should (equal 1 (largest-product "123" 0))))


(ert-deftest rejects-empty-string-and-nonzero-span ()
  (should-error (largest-product "" 1)))


(ert-deftest rejects-invalid-character-in-digits ()
  (should-error (largest-product "1234a5" 2)))


(ert-deftest rejects-negative-span ()
  (should-error (largest-product "12345" -1)))


(provide 'largest-series-product-test)
;;; largest-series-product-test.el ends here
