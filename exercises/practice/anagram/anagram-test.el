;;; anagram-test.el --- Tests for Anagram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "anagram.el")
(declare-function anagrams-for "anagram.el" (subject candidates))


(ert-deftest no-matches ()
  (should (equal (anagrams-for "diaper" '("hello" "world" "zombies" "pants"))
                 '())))


(ert-deftest detects-two-anagrams ()
  (should (equal (anagrams-for "solemn" '("lemons" "cherry" "melons"))
                 '("lemons" "melons"))))


(ert-deftest does-not-detect-anagram-subsets ()
  (should (equal (anagrams-for "good" '("dog" "goody"))
                 '())))


(ert-deftest detect-anagram ()
  (should (equal (anagrams-for "listen" '("enlists" "google" "inlets" "banana"))
                 '("inlets"))))


(ert-deftest detects-three-anagrams ()
  (should (equal (anagrams-for "allergy"
                               '("gallery" "ballerina" "regally" "clergy" "largely" "leading"))
                 '("gallery" "regally" "largely"))))


(ert-deftest detects-multiple-anagrams-with-different-case ()
  (should (equal (anagrams-for "nose" '("Eons" "ONES"))
                 '("Eons" "ONES"))))


(ert-deftest does-not-detect-non-anagram-with-identical-checksum ()
  (should (equal (anagrams-for "mass" '("last"))
          '())))


(ert-deftest detects-anagrams-case-insensitively ()
  (should (equal (anagrams-for "Orchestra" '("cashregister" "Carthorse" "radishes"))
                 '("Carthorse"))))


(ert-deftest detects-anagrams-using-case-insensitive-subject ()
  (should (equal (anagrams-for "Orchestra" '("cashregister" "carthorse" "radishes"))
                 '("carthorse"))))


(ert-deftest detects-anagrams-using-case-insensitive-possible-matches ()
  (should (equal (anagrams-for "orchestra" '("cashregister" "Carthorse" "radishes"))
                 '("Carthorse"))))


(ert-deftest does-not-detect-anagram-if-original-word-is-repeated ()
  (should (equal (anagrams-for "go" '("goGoGO"))
                 '())))


(ert-deftest anagrams-must-use-all-letters-exactly-once ()
  (should (equal (anagrams-for "tapper" '("patter"))
                 '())))


(ert-deftest word-is-not-own-anagram ()
  (should (equal (anagrams-for "BANANA" '("BANANA"))
                 '())))


(ert-deftest word-is-not-own-anagram-if-letter-case-is-partially-different ()
  (should (equal (anagrams-for "BANANA" '("Banana"))
                 '())))


(ert-deftest word-is-not-own-anagram-if-letter-case-is-completely-different ()
  (should (equal (anagrams-for "BANANA" '("banana"))
                 '())))


(ert-deftest words-other-than-themselves-can-be-anagrams ()
  (should (equal (anagrams-for "LISTEN" '("LISTEN" "Silent"))
                 '("Silent"))))


(ert-deftest test-handles-case-of-greek-letters ()
  (should (equal (anagrams-for "ΑΒΓ" '("ΒΓΑ" "ΒΓΔ" "γβα" "αβγ"))
                 '("ΒΓΑ" "γβα"))))

(ert-deftest different-characters-may-have-the-same-bytes ()
  (should (equal (anagrams-for "a⬂" '("€a"))
                 '())))

(provide 'anagram-test)
;;; anagram-test.el ends here
