;;; matching-brackets-test.el --- Matching Brackets (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "matching-brackets.el")
(declare-function is-paired "matching-brackets.el" (value))


(ert-deftest paired-square-brackets ()
  (should (is-paired "[]")))


(ert-deftest empty-string ()
  (should (is-paired "[]")))


(ert-deftest unpaired-brackets ()
  (should (not (is-paired "[["))))


(ert-deftest wrong-ordered-brackets ()
  (should (not (is-paired "}{"))))


(ert-deftest wrong-closing-bracket ()
  (should (not (is-paired "{]"))))


(ert-deftest paired-with-whitespace ()
  (should (is-paired "{ }")))


(ert-deftest partially-paired-brackets ()
  (should (not (is-paired "{[])"))))


(ert-deftest simple-nested-brackets ()
  (should (is-paired "{[]}")))


(ert-deftest several-paired-brackets ()
  (should (is-paired "{}[]")))


(ert-deftest paired-and-nested-brackets ()
  (should (is-paired "[{}({}[])]")))


(ert-deftest unopened-closing-brackets ()
  (should (not (is-paired "{[)][]}"))))


(ert-deftest unpaired-and-nested-brackets ()
  (should (not (is-paired "({])"))))


(ert-deftest paired-and-wrong-nested-brackets ()
  (should (not (is-paired "[({]})"))))


(ert-deftest
    paired-and-wrong-nested-brackets-but-innermost-are-correct
    ()
  (should (not (is-paired "[({}])"))))


(ert-deftest paired-and-incomplete-brackets ()
  (should (not (is-paired "{}["))))


(ert-deftest too-many-closing-brackets ()
  (should (not (is-paired "[]]"))))


(ert-deftest early-unexpected-brackets ()
  (should (not (is-paired ")()"))))


(ert-deftest early-mismatched-brackets ()
  (should (not (is-paired "{)()"))))


(ert-deftest math-expression ()
  (should (is-paired "(((185 + 223.85) * 15) - 543)/2")))


(ert-deftest complex-latex-expression ()
  (should
   (is-paired
    "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)")))


(provide 'matching-brackets-test)
;;; matching-brackets-test.el ends here
