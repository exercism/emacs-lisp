;;; anagram-test.el --- Tests for Anagram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "anagram.el")
(declare-function anagrams-for "anagram.el" (subject candidates))

(ert-deftest no-matches ()
  (should (equal '() (anagrams-for 
                      "diaper"
                      '("hello" "world" "zombies" "pants")))))


(ert-deftest detects-two-anagrams ()
  (should (equal '("lemons" "melons")
                 (anagrams-for
                  "solemn"
                  '("lemons" "cherry" "melons")))))


(ert-deftest does-not-detect-anagram-subsets ()
  (should (equal '() (anagrams-for "good" '("dog" "goody")))))


(ert-deftest detect-anagram ()
  (should (equal '("inlets")
                 (anagrams-for
                  "listen"
                  '("enlists" "google" "inlets" "banana")))))


(ert-deftest detects-three-anagrams ()
  (should (equal '("gallery" "regally" "largely")
                 (anagrams-for 
                  "allergy"
                  '("gallery" "ballerina" "regally" "clergy" "largely" "leading")))))


(ert-deftest detects-multiple-anagrams-with-different-case ()
  (should (equal '("Eons" "ONES")
                  (anagrams-for
                    "nose"
                    '("Eons" "ONES")))))


(ert-deftest does-not-detect-non-anagram-with-identical-checksum ()
  (should (equal '() (anagrams-for "mass" '("last")))))


(ert-deftest detects-anagrams-case-insensitively ()
  (should (equal '("Carthorse")
                  (anagrams-for
                   "Orchestra"
                   '("cashregister" "Carthorse" "radishes")))))


(ert-deftest detects-anagrams-using-case-insensitive-subject ()
  (should (equal '("carthorse")
                  (anagrams-for
                   "Orchestra"
                   '("cashregister" "carthorse" "radishes")))))


(ert-deftest detects-anagrams-using-case-insensitive-possible-matches ()
  (should (equal '("Carthorse")
                  (anagrams-for
                   "orchestra"
                   '("cashregister" "Carthorse" "radishes")))))


(ert-deftest does-not-detect-anagram-if-original-word-is-repeated ()
  (should (equal '() (anagrams-for "go" '("goGoGO")))))


(ert-deftest anagrams-must-use-all-letters-exactly-once ()
  (should (equal '() (anagrams-for "tapper" '("patter")))))


(ert-deftest word-is-not-own-anagram ()
  (should (equal '() (anagrams-for "BANANA" '("BANANA")))))


(ert-deftest word-is-not-own-anagram-if-letter-case-is-partially-different ()
  (should (equal '()
                 (anagrams-for
                  "BANANA"
                  '("Banana")))))

(ert-deftest word-is-not-own-anagram-if-letter-case-is-completely-different ()
  (should (equal '()
                 (anagrams-for
                  "BANANA"
                  '("banana")))))

(ert-deftest words-other-than-themselves-can-be-anagrams ()
  (should (equal '("Silent")
                 (anagrams-for
                  "LISTEN"
                  '("LISTEN" "Silent")))))

(provide 'anagram-test)
;;; anagram-test.el ends here
