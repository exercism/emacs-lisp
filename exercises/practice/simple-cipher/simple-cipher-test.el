;;; simple-cipher-test.el --- Simple Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "simple-cipher.el")
(declare-function encode "simple-cipher.el" (plaintext key))
(declare-function decode "simple-cipher.el" (ciphertext key))
(declare-function generate-key "simple-cipher.el" ())


(ert-deftest can-encode-random-key ()
  (let ((key (generate-key)))
    (should
     (string=
      (substring key 0 (length "aaaaaaaaaa"))
      (encode "aaaaaaaaaa" key)))))


(ert-deftest can-decode-random-key ()
  (let ((key (generate-key)))
    (should
     (string=
      "aaaaaaaaaa"
      (decode (substring key 0 (length "aaaaaaaaaa")) key)))))


(ert-deftest is-reversible-random-key ()
  (let* ((key (generate-key))
         (encoded (encode "abcdefghij" key)))
    (should (string= "abcdefghij" (decode encoded key)))))


(ert-deftest key-is-made-only-of-lowercase-letters ()
  (should (string-match "^[a-z]+$" (generate-key))))


(ert-deftest can-encode ()
  (should (string= "abcdefghij" (encode "aaaaaaaaaa" "abcdefghij"))))


(ert-deftest can-decode ()
  (should (string= "aaaaaaaaaa" (decode "abcdefghij" "abcdefghij"))))


(ert-deftest is-reversible ()
  (let ((encoded (encode "abcdefghij" "abcdefghij")))
    (should (string= "abcdefghij" (decode encoded "abcdefghij")))))


(ert-deftest can-double-shift-encode ()
  (should
   (string=
    "qayaeaagaciai" (encode "iamapandabear" "iamapandabear"))))


(ert-deftest can-wrap-on-encode ()
  (should (string= "zabcdefghi" (encode "zzzzzzzzzz" "abcdefghij"))))


(ert-deftest can-wrap-on-decode ()
  (should (string= "zzzzzzzzzz" (decode "zabcdefghi" "abcdefghij"))))


(ert-deftest can-encode-messages-longer-than-the-key ()
  (should (string= "iboaqcnecbfcr" (encode "iamapandabear" "abc"))))


(ert-deftest can-decode-messages-longer-than-the-key ()
  (should (string= "iamapandabear" (decode "iboaqcnecbfcr" "abc"))))


(provide 'simple-cipher-test)
;;; simple-cipher-test.el ends here
