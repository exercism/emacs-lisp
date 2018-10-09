;;; crypto-square-test.el --- Tests for Crypto Square (exercism)

;;; Commentary:

;;; Code:

(load-file "crypto-square.el")

(ert-deftest empty-plaintext-results-in-an-empty-ciphertext ()
  (should (equal "" (encipher ""))))

(ert-deftest lowercase ()
  (should (equal "a" (encipher"A"))))

(ert-deftest remove-spaces ()
  (should (equal "b" (encipher "  b "))))

(ert-deftest remove-punctuation ()
  (should (equal "1" (encipher "@1,%!"))))

(ert-deftest 9-character-plaintext-results-in-3-chunks-of-3-characters ()
  (should (equal "tsf hiu isn" (encipher "This is fun!"))))

(ert-deftest 8-character-plaintext-results-in-3-chunks-the-last-one-with-a-trailing-space ()
  (should (equal "clu hlt io " (encipher "Chill out."))))

(ert-deftest 54-character-plaintext-results-in-7-chunks-the-last-two-with-trailing-spaces ()
  (should (equal "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau "
                 (encipher "If man was meant to stay on the ground, god would have given us roots."))))

(provide 'crypto-square-test)
;;; crypto-square-test.el ends here
