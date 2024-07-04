;;; variable-length-quantity-test.el --- Variable Length Quantity (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "variable-length-quantity.el")
(declare-function encode "variable-length-quantity.el" (integers))
(declare-function decode "variable-length-quantity.el" (integers))


(ert-deftest zero ()
  (should (equal (encode '(#x0)) '(#x0))))


(ert-deftest arbitrary-single-byte ()
  (should (equal (encode '(#x40)) '(#x40))))


(ert-deftest largest-single-byte ()
  (should (equal (encode '(#x7F)) '(#x7F))))


(ert-deftest smallest-double-byte ()
  (should (equal (encode '(#x80)) '(#x81 #x0))))


(ert-deftest arbitrary-double-byte ()
  (should (equal (encode '(#x2000)) '(#xC0 #x0))))


(ert-deftest largest-double-byte ()
  (should (equal (encode '(#x3FFF)) '(#xFF #x7F))))


(ert-deftest smallest-triple-byte ()
  (should (equal (encode '(#x4000)) '(#x81 #x80 #x0))))


(ert-deftest arbitrary-triple-byte ()
  (should (equal (encode '(#x100000)) '(#xC0 #x80 #x0))))


(ert-deftest largest-triple-byte ()
  (should (equal (encode '(#x1FFFFF)) '(#xFF #xFF #x7F))))


(ert-deftest smallest-quadruple-byte ()
  (should (equal (encode '(#x200000)) '(#x81 #x80 #x80 #x0))))


(ert-deftest arbitrary-quadruple-byte ()
  (should (equal (encode '(#x8000000)) '(#xC0 #x80 #x80 #x0))))


(ert-deftest largest-quadruple-byte ()
  (should (equal (encode '(#xFFFFFFF)) '(#xFF #xFF #xFF #x7F))))


(ert-deftest smallest-quintuple-byte ()
  (should (equal (encode '(#x10000000)) '(#x81 #x80 #x80 #x80 #x0))))


(ert-deftest arbitrary-quintuple-byte ()
  (should (equal (encode '(#xFF000000)) '(#x8F #xF8 #x80 #x80 #x0))))


(ert-deftest maximum-32-bit-integer-input ()
  (should (equal (encode '(#xFFFFFFFF)) '(#x8F #xFF #xFF #xFF #x7F))))


(ert-deftest two-single-byte-values ()
  (should (equal (encode '(#x40 #x7F)) '(#x40 #x7F))))


(ert-deftest two-multi-byte-values ()
  (should (equal (encode '(#x4000 #x123456)) '(#x81 #x80 #x0 #xC8 #xE8 #x56))))


(ert-deftest many-multi-byte-values ()
  (should (equal (encode '(#x2000 #x123456 #xFFFFFFF #x0 #x3FFF #x4000)) '(#xC0 #x0 #xC8 #xE8 #x56 #xFF #xFF #xFF #x7F #x0 #xFF #x7F #x81 #x80 #x0))))


(ert-deftest one-byte ()
  (should (equal (decode '(#x7F)) '(#x7F))))


(ert-deftest two-bytes ()
  (should (equal (decode '(#xC0 #x0)) '(#x2000))))


(ert-deftest three-bytes ()
  (should (equal (decode '(#xFF #xFF #x7F)) '(#x1FFFFF))))


(ert-deftest four-bytes ()
  (should (equal (decode '(#x81 #x80 #x80 #x0)) '(#x200000))))


(ert-deftest maximum-32-bit-integer ()
  (should (equal (decode '(#x8F #xFF #xFF #xFF #x7F)) '(#xFFFFFFFF))))


(ert-deftest incomplete-sequence-causes-error ()
  (should-error (decode '(#xFF))))


(ert-deftest incomplete-sequence-causes-error-even-if-value-is-zero ()
  (should-error (decode '(#x80))))


(ert-deftest multiple-values ()
  (should (equal (decode '(#xC0 #x0 #xC8 #xE8 #x56 #xFF #xFF #xFF #x7F #x0 #xFF #x7F #x81 #x80 #x0)) '(#x2000 #x123456 #xFFFFFFF #x0 #x3FFF #x4000))))


(provide 'variable-length-quantity-test)
;;; variable-length-quantity-test.el ends here
