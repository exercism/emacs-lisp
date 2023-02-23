;;; pagram-test.el --- Tests for Pangram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:
;; Common test data version: 1.3.0 d79e13e

;;; Code:

(load-file "pangram.el")
(declare-function pangramp "pangram.el" (phrase))

(ert-deftest sentence-empty ()
  (should (equal nil (pangramp ""))))

(ert-deftest recognizes-a-perfect-lower-case-pangram ()
  (should (equal t (pangramp "abcdefghijklmnopqrstuvwxyz"))))

(ert-deftest  pangram-with-only-lower-case ()
  (should (equal t (pangramp "the quick brown fox jumps over the lazy dog"))))

(ert-deftest missing-character-x ()
  (should (equal nil (pangramp "a quick movement of the enemy will jeopardize five gunboats"))))

(ert-deftest missing-another-character-eg-h ()
  (should (equal nil (pangramp "five boxing wizards jump quickly at it"))))

(ert-deftest  pangram-with-underscores ()
  (should (equal t (pangramp "the_quick_brown_fox_jumps_over_the_lazy_dog"))))

(ert-deftest  pangram-with-numbers ()
  (should (equal t (pangramp "the 1 quick brown fox jumps over the 2 lazy dogs"))))

(ert-deftest  missing-letters-replaced-by-numbers ()
  (should (equal nil (pangramp "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"))))

(ert-deftest  pangram-with-mixed-case-and-punctuation ()
  (should (equal t (pangramp "\"Five quacking Zephyrs jolt my wax bed.\""))))

(ert-deftest  a-m-and-A-M-are-26-different-characters-but-not-a-pangram ()
  (should (equal nil (pangramp "abcdefghijklm ABCDEFGHIJKLM"))))

(provide 'pangram-test)
;;; pagram-test.el ends here
