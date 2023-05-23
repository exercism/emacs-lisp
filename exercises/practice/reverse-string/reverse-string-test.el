;;; reverse-string-test.el --- Reverse String (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "reverse-string.el")
(declare-function reverse-string "reverse-string.el" (value))


(ert-deftest an-empty-string ()
  (should (string= (reverse-string "") "")))


(ert-deftest a-word ()
  (should (string= (reverse-string "robot") "tobor")))


(ert-deftest a-capitalized-word ()
  (should (string= (reverse-string "Ramen") "nemaR")))


(ert-deftest a-sentence-with-punctuation ()
  (should (string= (reverse-string "I'm hungry!") "!yrgnuh m'I")))


(ert-deftest a-palindrome ()
  (should (string= (reverse-string "racecar") "racecar")))


(ert-deftest an-even-sized-word ()
  (should (string= (reverse-string "drawer") "reward")))


(provide 'reverse-string-test)
;;; reverse-string-test.el ends here
