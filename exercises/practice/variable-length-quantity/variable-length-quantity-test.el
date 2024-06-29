;;; variable-length-quantity-test.el --- Variable Length Quantity (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "variable-length-quantity.el")
(declare-function encode "variable-length-quantity.el" (integers))
(declare-function decode "variable-length-quantity.el" (integers))


(ert-deftest zero ()
  (should (equal (encode '(0)) '(0))))


(ert-deftest arbitrary-single-byte ()
  (should (equal (encode '(64)) '(64))))


(ert-deftest largest-single-byte ()
  (should (equal (encode '(127)) '(127))))


(ert-deftest smallest-double-byte ()
  (should (equal (encode '(128)) '(129 0))))


(ert-deftest arbitrary-double-byte ()
  (should (equal (encode '(8192)) '(192 0))))


(ert-deftest largest-double-byte ()
  (should (equal (encode '(16383)) '(255 127))))


(ert-deftest smallest-triple-byte ()
  (should (equal (encode '(16384)) '(129 128 0))))


(ert-deftest arbitrary-triple-byte ()
  (should (equal (encode '(1048576)) '(192 128 0))))


(ert-deftest largest-triple-byte ()
  (should (equal (encode '(2097151)) '(255 255 127))))


(ert-deftest smallest-quadruple-byte ()
  (should (equal (encode '(2097152)) '(129 128 128 0))))


(ert-deftest arbitrary-quadruple-byte ()
  (should (equal (encode '(134217728)) '(192 128 128 0))))


(ert-deftest largest-quadruple-byte ()
  (should (equal (encode '(268435455)) '(255 255 255 127))))


(ert-deftest smallest-quintuple-byte ()
  (should (equal (encode '(268435456)) '(129 128 128 128 0))))


(ert-deftest arbitrary-quintuple-byte ()
  (should (equal (encode '(4278190080)) '(143 248 128 128 0))))


(ert-deftest maximum-32-bit-integer-input ()
  (should (equal (encode '(4294967295)) '(143 255 255 255 127))))


(ert-deftest two-single-byte-values ()
  (should (equal (encode '(64 127)) '(64 127))))


(ert-deftest two-multi-byte-values ()
  (should (equal (encode '(16384 1193046)) '(129 128 0 200 232 86))))


(ert-deftest many-multi-byte-values ()
  (should (equal (encode '(8192 1193046 268435455 0 16383 16384)) '(192 0 200 232 86 255 255 255 127 0 255 127 129 128 0))))


(ert-deftest one-byte ()
  (should (equal (decode '(127)) '(127))))


(ert-deftest two-bytes ()
  (should (equal (decode '(192 0)) '(8192))))


(ert-deftest three-bytes ()
  (should (equal (decode '(255 255 127)) '(2097151))))


(ert-deftest four-bytes ()
  (should (equal (decode '(129 128 128 0)) '(2097152))))


(ert-deftest maximum-32-bit-integer ()
  (should (equal (decode '(143 255 255 255 127)) '(4294967295))))


(ert-deftest incomplete-sequence-causes-error ()
  (should-error (decode '(255)) :type 'incomplete))


(ert-deftest incomplete-sequence-causes-error-even-if-value-is-zero ()
  (should-error (decode '(128)) :type 'incomplete))


(ert-deftest multiple-values ()
  (should (equal (decode '(192 0 200 232 86 255 255 255 127 0 255 127 129 128 0)) '(8192 1193046 268435455 0 16383 16384))))


(provide 'variable-length-quantity-test)
;;; variable-length-quantity-test.el ends here
