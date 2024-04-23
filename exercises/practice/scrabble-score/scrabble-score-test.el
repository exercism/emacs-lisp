;;; scrabble-score-test.el --- Tests for Scrabble Score (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "scrabble-score.el")
(declare-function score "scrabble-score.el" (word))


(ert-deftest lowercase-letter ()
  (should (equal 1 (score "a"))))


(ert-deftest uppercase-letter ()
  (should (equal 1 (score "A"))))


(ert-deftest valuable-letter ()
  (should (equal 4 (score "f"))))


(ert-deftest short-word ()
  (should (equal 2 (score "at"))))


(ert-deftest short-valuable-word ()
  (should (equal 12 (score "zoo"))))


(ert-deftest medium-word ()
  (should (equal 6 (score "street"))))


(ert-deftest medium-valuable-word ()
  (should (equal 22 (score "quirky"))))


(ert-deftest long-mixed-case-word ()
  (should (equal 41 (score "OxyphenButazone"))))


(ert-deftest english-like-word ()
  (should (equal 8 (score "pinata"))))


(ert-deftest empty-input ()
  (should (equal 0 (score ""))))


(ert-deftest entire-alphabet-available ()
  (should (equal 87 (score "abcdefghijklmnopqrstuvwxyz"))))

(provide 'scrabble-score-test)
;;; scrabble-score-test.el ends here
