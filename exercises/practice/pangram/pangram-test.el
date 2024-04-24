;;; pangram-test.el --- Tests for Pangram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "pangram.el")
(declare-function pangramp "pangram.el" (phrase))


(ert-deftest empty-sentence ()
  (should-not (pangramp "")))


(ert-deftest perfect-lower-case ()
  (should (pangramp "abcdefghijklmnopqrstuvwxyz")))


(ert-deftest only-lower-case ()
  (should (pangramp "the quick brown fox jumps over the lazy dog")))


(ert-deftest missing-the-letter-x ()
  (should-not (pangramp "a quick movement of the enemy will jeopardize five gunboats")))


(ert-deftest missing-the-letter-h ()
  (should-not (pangramp "five boxing wizards jump quickly at it")))


(ert-deftest with-underscores ()
  (should (pangramp "the_quick_brown_fox_jumps_over_the_lazy_dog")))


(ert-deftest with-numbers ()
  (should (pangramp "the 1 quick brown fox jumps over the 2 lazy dogs")))


(ert-deftest missing-letters-replaced-by-numbers ()
  (should-not (pangramp "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog")))


(ert-deftest mixed-case-and-punctuation ()
  (should (pangramp "\"Five quacking Zephyrs jolt my wax bed.\"")))


(ert-deftest a-m-and-A-M-are-26-different-characters-but-not-a-pangram ()
  (should-not (pangramp "abcdefghijklm ABCDEFGHIJKLM")))


(provide 'pangram-test)
;;; pangram-test.el ends here
