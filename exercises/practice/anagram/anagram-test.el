;;; anagram-test.el --- Tests for Anagram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "anagram.el")
(declare-function anagrams-for "anagram.el" (subject candidates))

(ert-deftest no-matches ()
  (should (equal '() (anagrams-for
                      "diaper"
                      '("hello" "world" "zombies" "pants")))))

(ert-deftest detect-simple-anagram ()
  (should (equal '("tan") (anagrams-for
                           "ant"
                           '("tan" "stand" "at")))))

(ert-deftest does-not-confuse-different-duplicates ()
  (should (equal '() (anagrams-for
                      "galea"
                      '("eagle")))))

(ert-deftest eliminate-anagram-subsets ()
  (should (equal '() (anagrams-for
                      "good"
                      '("dog" "goody")))))

(ert-deftest detect-anagram ()
  (should (equal '("inlets") (anagrams-for
                              "listen"
                              '("enlists" "google" "inlets" "banana")))))

(ert-deftest multiple-anagrams ()
  (should (equal '("gallery" "regally" "largely")
                 (anagrams-for
                  "allergy"
                  '("gallery" "ballerina" "regally" "clergy" "largely" "leading")))))

(ert-deftest case-insensitive-anagrams ()
    (should (equal '("Carthorse")
                   (anagrams-for
                    "Orchestra"
                    '("cashregister" "Carthorse" "radishes")))))

(ert-deftest word-is-not-own-anagram ()
  (should (equal '()
                 (anagrams-for
                  "BANANA"
                  '("BANANA")))))

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
                  '("Listen" "Silent" "LISTEN")))))

(provide 'anagram-test)
;;; anagram-test.el ends here
