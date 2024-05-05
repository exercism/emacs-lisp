;;; isogram-test.el --- Tests for Isogram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "isogram.el")
(declare-function isogramp "isogram.el" (phrase))


(ert-deftest empty-string ()
  (should (isogramp "")))


(ert-deftest isogram-with-only-lower-case-characters ()
  (should (isogramp "isogram")))


(ert-deftest word-with-one-duplicated-character ()
  (should-not (isogramp "eleven")))


(ert-deftest word-with-one-duplicated-character-from-the-end-of-the-alphabet ()
  (should-not (isogramp "zzyzx")))


(ert-deftest longest-reported-english-isogram ()
  (should (isogramp "subdermatoglyphic")))


(ert-deftest word-with-duplicated-character-in-mixed-case ()
  (should-not (isogramp "Alphabet")))


(ert-deftest word-with-duplicated-character-in-mixed-case-lowercase-first ()
  (should-not (isogramp "alphAbet")))


(ert-deftest hypothetical-isogrammic-word-with-hyphen ()
  (should (isogramp "thumbscrew-japingly")))


(ert-deftest hypothetical-word-with-duplicated-character-following-hyphen ()
  (should-not (isogramp "thumbscrew-jappingly")))


(ert-deftest isogram-with-duplicated-hyphen ()
  (should (isogramp "six-year-old")))


(ert-deftest made-up-name-that-is-an-isogram ()
  (should (isogramp "Emily Jung Schwartzkopf")))


(ert-deftest duplicated-character-in-the-middle ()
  (should-not (isogramp "accentor")))


(ert-deftest same-first-and-last-characters ()
  (should-not (isogramp "angola")))


(ert-deftest word-with-duplicated-character-and-with-two-hyphens ()
  (should-not (isogramp "up-to-date")))


(provide 'isogram-test)
;;; isogram-test.el ends here
