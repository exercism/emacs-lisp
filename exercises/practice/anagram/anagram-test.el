;;; anagram-test.el --- Tests for Anagram (exercism)

;;; Commentary:

;;; Code:

(load-file "anagram.el")

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
                  "banana"
                  '("banana")))))


(provide 'anagram-test)
;;; anagram-test.el ends here
