;;; atbash-cipher-test.el --- Tests for Atbash Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(load-file "atbash-cipher.el")

(declare-function encode "atbash-cipher.el" (plaintext))
(declare-function decode "atbash-cipher.el" (plaintext))

(ert-deftest encode-no ()
  (should (string= "ml" (encode "no"))))

(ert-deftest encode-yes ()
  (should (string= "bvh" (encode "yes"))))

(ert-deftest encode-OMG ()
  (should (string= "lnt" (encode "OMG"))))

(ert-deftest encode-O-M-G ()
  (should (string= "lnt" (encode "O M G"))))

(ert-deftest encode-long-word ()
  (should (string= "nrmwy oldrm tob"
                 (encode "mindblowingly"))))

(ert-deftest encode-numbers ()
  (should (string= "gvhgr mt123 gvhgr mt"
                 (encode "Testing, 1 2 3, testing."))))

(ert-deftest encode-sentence ()
  (should (string= "gifgs rhurx grlm"
                 (encode "Truth is fiction."))))

(ert-deftest encode-all-the-things ()
  (let ((plaintext "The quick brown fox jumps over the lazy dog.")
        (ciphertext "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"))
    (should (string= ciphertext
                   (encode plaintext)))))

(ert-deftest decode-exercism ()
  (should (string= "exercism" (decode "vcvix rhn"))))

(ert-deftest decode-a-sentence ()
  (should (string= "anobstacleisoftenasteppingstone" (decode "zmlyh gzxov rhlug vmzhg vkkrm thglm v"))))

(ert-deftest decode-numbers ()
  (should (string= "testing123testing" (decode "gvhgr mt123 gvhgr mt"))))

(ert-deftest decode-all-the-letters ()
  (should (string= "thequickbrownfoxjumpsoverthelazydog" (decode "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"))))

(ert-deftest decode-with-two-many-spaces ()
  (should (string= "exercism" (decode "vc vix    r hn"))))

(ert-deftest decode-with-no-spaces ()
  (should (string= "anobstacleisoftenasteppingstone" (decode "zmlyhgzxovrhlugvmzhgvkkrmthglmv"))))

(provide 'atbash-cipher-test)
;;; atbash-cipher-test.el ends here
