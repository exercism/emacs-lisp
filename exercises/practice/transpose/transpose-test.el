;;; transpose-test.el --- Tests for Transpose (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "transpose.el")
(declare-function transpose "transpose.el" (lines))


(ert-deftest empty-string ()
  (let ((expected '()))
    (should (equal (transpose '()) expected))))


(ert-deftest two-characters-in-a-row ()
  (let ((expected '("A"
                    "1")))
    (should (equal (transpose '("A1")) expected))))


(ert-deftest two-characters-in-a-column ()
  (let ((expected '("A1")))
    (should (equal (transpose '("A"
                                "1")) expected))))


(ert-deftest simple ()
  (let ((expected '("A1"
                    "B2"
                    "C3")))
    (should (equal (transpose '("ABC"
                                "123")) expected))))


(ert-deftest single-line ()
  (let ((expected '("S"
                    "i"
                    "n"
                    "g"
                    "l"
                    "e"
                    " "
                    "l"
                    "i"
                    "n"
                    "e"
                    ".")))
    (should (equal (transpose '("Single line.")) expected))))


(ert-deftest first-line-longer-than-second-line ()
  (let ((expected '("TT"
                    "hh"
                    "ee"
                    "  "
                    "ff"
                    "oi"
                    "uf"
                    "rt"
                    "th"
                    "h "
                    " l"
                    "li"
                    "in"
                    "ne"
                    "e."
                    ".")))
    (should (equal (transpose '("The fourth line."
                                "The fifth line.")) expected))))


(ert-deftest second-line-longer-than-first-line ()
  (let ((expected '("TT"
                    "hh"
                    "ee"
                    "  "
                    "fs"
                    "ie"
                    "rc"
                    "so"
                    "tn"
                    " d"
                    "l "
                    "il"
                    "ni"
                    "en"
                    ".e"
                    " .")))
    (should (equal (transpose '("The first line."
                                "The second line.")) expected))))


(ert-deftest mixed-line-length ()
  (let ((expected '("TAAA"
                    "h   "
                    "elll"
                    " ooi"
                    "lnnn"
                    "ogge"
                    "n e."
                    "glr"
                    "ei "
                    "snl"
                    "tei"
                    " .n"
                    "l e"
                    "i ."
                    "n"
                    "e"
                    ".")))
    (should (equal (transpose '("The longest line."
                                "A long line."
                                "A longer line."
                                "A line.")) expected))))


(ert-deftest square ()
  (let ((expected '("HEART"
                    "EMBER"
                    "ABUSE"
                    "RESIN"
                    "TREND")))
    (should (equal (transpose '("HEART"
                                "EMBER"
                                "ABUSE"
                                "RESIN"
                                "TREND")) expected))))


(ert-deftest rectangle ()
  (let ((expected '("FOBS"
                    "RULE"
                    "ATOP"
                    "CLOT"
                    "TIME"
                    "UNIT"
                    "RENT"
                    "EDGE")))
    (should (equal (transpose '("FRACTURE"
                                "OUTLINED"
                                "BLOOMING"
                                "SEPTETTE")) expected))))


(ert-deftest triangle ()
  (let ((expected '("TEASER"
                    " EASER"
                    "  ASER"
                    "   SER"
                    "    ER"
                    "     R")))
    (should (equal (transpose '("T"
                                "EE"
                                "AAA"
                                "SSSS"
                                "EEEEE"
                                "RRRRRR")) expected))))


(ert-deftest jagged-triangle ()
  (let ((expected '("123456"
                    "1 3456"
                    "  3456"
                    "  3 56"
                    "    56"
                    "    5")))
    (should (equal (transpose '("11"
                                "2"
                                "3333"
                                "444"
                                "555555"
                                "66666")) expected))))


(provide 'transpose-test)
;;; transpose-test.el ends here
