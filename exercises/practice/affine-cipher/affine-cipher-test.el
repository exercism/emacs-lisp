;;; affine-cipher-test.el --- Affine Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "affine-cipher.el")
(declare-function encode "affine-cipher.el" (phrase key))
(declare-function decode "affine-cipher.el" (phrase key))


(ert-deftest encode-yes ()
  ;; Function under test: encode
  ;; Input: {"phrase":"yes","key":{"a":5,"b":7}}
  ;; Expected: "xbt"
  (should (equal "xbt" (encode "yes" '(("a" . 5) ("b" . 7))))))


(ert-deftest encode-no ()
  ;; Function under test: encode
  ;; Input: {"phrase":"no","key":{"a":15,"b":18}}
  ;; Expected: "fu"
  (should (equal "fu" (encode "no" '(("a" . 15) ("b" . 18))))))


(ert-deftest encode-omg ()
  ;; Function under test: encode
  ;; Input: {"phrase":"OMG","key":{"a":21,"b":3}}
  ;; Expected: "lvz"
  (should (equal "lvz" (encode "OMG" '(("a" . 21) ("b" . 3))))))


(ert-deftest encode-o-m-g ()
  ;; Function under test: encode
  ;; Input: {"phrase":"O M G","key":{"a":25,"b":47}}
  ;; Expected: "hjp"
  (should (equal "hjp" (encode "O M G" '(("a" . 25) ("b" . 47))))))


(ert-deftest encode-mindblowingly ()
  ;; Function under test: encode
  ;; Input: {"phrase":"mindblowingly","key":{"a":11,"b":15}}
  ;; Expected: "rzcwa gnxzc dgt"
  (should
   (equal
    "rzcwa gnxzc dgt"
    (encode "mindblowingly" '(("a" . 11) ("b" . 15))))))


(ert-deftest encode-numbers ()
  ;; Function under test: encode
  ;; Input: {"phrase":"Testing,1 2 3, testing.","key":{"a":3,"b":4}}
  ;; Expected: "jqgjc rw123 jqgjc rw"
  (should
   (equal
    "jqgjc rw123 jqgjc rw"
    (encode "Testing,1 2 3, testing." '(("a" . 3) ("b" . 4))))))


(ert-deftest encode-deep-thought ()
  ;; Function under test: encode
  ;; Input: {"phrase":"Truth is fiction.","key":{"a":5,"b":17}}
  ;; Expected: "iynia fdqfb ifje"
  (should
   (equal
    "iynia fdqfb ifje"
    (encode "Truth is fiction." '(("a" . 5) ("b" . 17))))))


(ert-deftest encode-all-the-letters ()
  ;; Function under test: encode
  ;; Input: {"phrase":"The quick brown fox jumps over the lazy dog.","key":{"a":17,"b":33}}
  ;; Expected: "swxtj npvyk lruol iejdc blaxk swxmh qzglf"
  (should
   (equal
    "swxtj npvyk lruol iejdc blaxk swxmh qzglf"
    (encode
     "The quick brown fox jumps over the lazy dog."
     '(("a" . 17) ("b" . 33))))))


(ert-deftest encode-with-a-not-coprime-to-m ()
  ;; Function under test: encode
  ;; Input: {"phrase":"This is a test.","key":{"a":6,"b":17}}
  ;; Expected: {"error":"a and m must be coprime."}
  (let ((error-data
         (should-error
          (encode "This is a test." '(("a" . 6) ("b" . 17))))))
    (should
     (string=
      "a and m must be coprime." (error-message-string error-data)))))


(ert-deftest decode-exercism ()
  ;; Function under test: decode
  ;; Input: {"phrase":"tytgn fjr","key":{"a":3,"b":7}}
  ;; Expected: "exercism"
  (should
   (equal "exercism" (decode "tytgn fjr" '(("a" . 3) ("b" . 7))))))


(ert-deftest decode-a-sentence ()
  ;; Function under test: decode
  ;; Input: {"phrase":"qdwju nqcro muwhn odqun oppmd aunwd o","key":{"a":19,"b":16}}
  ;; Expected: "anobstacleisoftenasteppingstone"
  (should
   (equal
    "anobstacleisoftenasteppingstone"
    (decode
     "qdwju nqcro muwhn odqun oppmd aunwd o"
     '(("a" . 19) ("b" . 16))))))


(ert-deftest decode-numbers ()
  ;; Function under test: decode
  ;; Input: {"phrase":"odpoz ub123 odpoz ub","key":{"a":25,"b":7}}
  ;; Expected: "testing123testing"
  (should
   (equal
    "testing123testing"
    (decode "odpoz ub123 odpoz ub" '(("a" . 25) ("b" . 7))))))


(ert-deftest decode-all-the-letters ()
  ;; Function under test: decode
  ;; Input: {"phrase":"swxtj npvyk lruol iejdc blaxk swxmh qzglf","key":{"a":17,"b":33}}
  ;; Expected: "thequickbrownfoxjumpsoverthelazydog"
  (should
   (equal
    "thequickbrownfoxjumpsoverthelazydog"
    (decode
     "swxtj npvyk lruol iejdc blaxk swxmh qzglf"
     '(("a" . 17) ("b" . 33))))))


(ert-deftest decode-with-no-spaces-in-input ()
  ;; Function under test: decode
  ;; Input: {"phrase":"swxtjnpvyklruoliejdcblaxkswxmhqzglf","key":{"a":17,"b":33}}
  ;; Expected: "thequickbrownfoxjumpsoverthelazydog"
  (should
   (equal
    "thequickbrownfoxjumpsoverthelazydog"
    (decode
     "swxtjnpvyklruoliejdcblaxkswxmhqzglf"
     '(("a" . 17) ("b" . 33))))))


(ert-deftest decode-with-too-many-spaces ()
  ;; Function under test: decode
  ;; Input: {"phrase":"vszzm    cly   yd cg    qdp","key":{"a":15,"b":16}}
  ;; Expected: "jollygreengiant"
  (should
   (equal
    "jollygreengiant"
    (decode "vszzm    cly   yd cg    qdp" '(("a" . 15) ("b" . 16))))))


(ert-deftest decode-with-a-not-coprime-to-m ()
  ;; Function under test: decode
  ;; Input: {"phrase":"Test","key":{"a":13,"b":5}}
  ;; Expected: {"error":"a and m must be coprime."}
  (let ((error-data
         (should-error (decode "Test" '(("a" . 13) ("b" . 5))))))
    (should
     (string=
      "a and m must be coprime." (error-message-string error-data)))))


(provide 'affine-cipher-test)
;;; affine-cipher-test.el ends here
