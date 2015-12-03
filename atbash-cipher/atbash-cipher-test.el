;;; atbash-cipher-test.el --- Tests for Atbash Cipher (exercism)

;;; Commentary:

;;; Code:

(require 'cl)

(load-file "atbash-cipher.el")

(ert-deftest encode-no ()
  (should (equal "ml" (encode "no"))))

(ert-deftest encode-yes ()
  (should (equal "bvh" (encode "yes"))))

(ert-deftest encode-OMG ()
  (should (equal "lnt" (encode "OMG"))))

(ert-deftest encode-O-M-G ()
  (should (equal "lnt" (encode "O M G"))))

(ert-deftest encode-long-word ()
  (should (equal "nrmwy oldrm tob"
                 (encode "mindblowingly"))))

(ert-deftest encode-numbers ()
  (should (equal "gvhgr mt123 gvhgr mt"
                 (encode "Testing, 1 2 3, testing."))))

(ert-deftest encode-sentence ()
  (should (equal "gifgs rhurx grlm"
                 (encode "Truth is fiction."))))

(ert-deftest encode-all-the-things ()
  (let ((plaintext "The quick brown fox jumps over the lazy dog.")
        (ciphertext "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"))
    (should (equal ciphertext
                   (encode plaintext)))))

(provide 'atbash-cipher-test)
;;; atbash-cipher-test.el ends here
