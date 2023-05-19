;;; affine-cipher-test.el --- Affine Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "affine-cipher.el")
(declare-function encode "affine-cipher.el" (phrase key))
(declare-function decode "affine-cipher.el" (phrase key))


(ert-deftest encode-yes ()
  (should (equal "xbt" (encode "yes" '(("a" . 5) ("b" . 7))))))


(ert-deftest encode-no ()
  (should (equal "fu" (encode "no" '(("a" . 15) ("b" . 18))))))


(ert-deftest encode-omg ()
  (should (equal "lvz" (encode "OMG" '(("a" . 21) ("b" . 3))))))


(ert-deftest encode-o-m-g ()
  (should (equal "hjp" (encode "O M G" '(("a" . 25) ("b" . 47))))))


(ert-deftest encode-mindblowingly ()
  (should
   (equal
    "rzcwa gnxzc dgt"
    (encode "mindblowingly" '(("a" . 11) ("b" . 15))))))


(ert-deftest encode-numbers ()
  (should
   (equal
    "jqgjc rw123 jqgjc rw"
    (encode "Testing,1 2 3, testing." '(("a" . 3) ("b" . 4))))))


(ert-deftest encode-deep-thought ()
  (should
   (equal
    "iynia fdqfb ifje"
    (encode "Truth is fiction." '(("a" . 5) ("b" . 17))))))


(ert-deftest encode-all-the-letters ()
  (should
   (equal
    "swxtj npvyk lruol iejdc blaxk swxmh qzglf"
    (encode
     "The quick brown fox jumps over the lazy dog."
     '(("a" . 17) ("b" . 33))))))


(ert-deftest encode-with-a-not-coprime-to-m ()
  (let ((error-data
         (should-error
          (encode "This is a test." '(("a" . 6) ("b" . 17))))))
    (should
     (string=
      "a and m must be coprime." (error-message-string error-data)))))


(ert-deftest decode-exercism ()
  (should
   (equal "exercism" (decode "tytgn fjr" '(("a" . 3) ("b" . 7))))))


(ert-deftest decode-a-sentence ()
  (should
   (equal
    "anobstacleisoftenasteppingstone"
    (decode
     "qdwju nqcro muwhn odqun oppmd aunwd o"
     '(("a" . 19) ("b" . 16))))))


(ert-deftest decode-numbers ()
  (should
   (equal
    "testing123testing"
    (decode "odpoz ub123 odpoz ub" '(("a" . 25) ("b" . 7))))))


(ert-deftest decode-all-the-letters ()
  (should
   (equal
    "thequickbrownfoxjumpsoverthelazydog"
    (decode
     "swxtj npvyk lruol iejdc blaxk swxmh qzglf"
     '(("a" . 17) ("b" . 33))))))


(ert-deftest decode-with-no-spaces-in-input ()
  (should
   (equal
    "thequickbrownfoxjumpsoverthelazydog"
    (decode
     "swxtjnpvyklruoliejdcblaxkswxmhqzglf"
     '(("a" . 17) ("b" . 33))))))


(ert-deftest decode-with-too-many-spaces ()
  (should
   (equal
    "jollygreengiant"
    (decode "vszzm    cly   yd cg    qdp" '(("a" . 15) ("b" . 16))))))


(ert-deftest decode-with-a-not-coprime-to-m ()
  (let ((error-data
         (should-error (decode "Test" '(("a" . 13) ("b" . 5))))))
    (should
     (string=
      "a and m must be coprime." (error-message-string error-data)))))


(provide 'affine-cipher-test)
;;; affine-cipher-test.el ends here
