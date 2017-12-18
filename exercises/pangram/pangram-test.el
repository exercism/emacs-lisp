;;; pagram-test.el --- Tests for Pangram (exercism)

;;; Commentary:
;; Common test data version: 1.3.0 d79e13e

;;; Code:

(load-file "pangram.el")

(ert-deftest sentence-empty ()
  (should (equal nil (is-pangram ""))))

(ert-deftest recognizes-a-perfect-lower-case-pangram ()
  (should (equal t (is-pangram "abcdefghijklmnopqrstuvwxyz"))))

(ert-deftest  pangram-with-only-lower-case ()
  (should (equal t (is-pangram "the quick brown fox jumps over the lazy dog"))))

(ert-deftest missing-character-x ()
  (should (equal nil (is-pangram "a quick movement of the enemy will jeopardize five gunboats"))))

(ert-deftest missing-another-character-eg-h ()
  (should (equal nil (is-pangram "five boxing wizards jump quickly at it"))))

(ert-deftest  pangram-with-underscores ()
  (should (equal t (is-pangram "the_quick_brown_fox_jumps_over_the_lazy_dog"))))

(ert-deftest  pangram-with-numbers ()
  (should (equal t (is-pangram "the 1 quick brown fox jumps over the 2 lazy dogs"))))

(ert-deftest  missing-letters-replaced-by-numbers ()
  (should (equal nil (is-pangram "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"))))

(ert-deftest  pangram-with-mixed-case-and-punctuation ()
  (should (equal t (is-pangram "\"Five quacking Zephyrs jolt my wax bed.\""))))

(ert-deftest  upper-and-lower-case-versions-of-the-same-character-should-not-be-counted-separately ()
  (should (equal nil (is-pangram "the quick brown fox jumps over with lazy FX"))))

(provide 'pangram-test)
;;; pagram-test.el ends here
