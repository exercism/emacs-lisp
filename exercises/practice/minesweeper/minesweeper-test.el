;;; minesweeper-test.el --- Tests for Minesweeper (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "minesweeper.el")
(declare-function annotate "minesweeper.el" (minefield))


(ert-deftest no-rows ()
  (should (equal '()

       (annotate '()))))


(ert-deftest no-columns ()
  (should (equal '("")

       (annotate '("")))))


(ert-deftest no-mines ()
  (should (equal '("   "
                   "   "
                   "   ")

       (annotate '("   "
                   "   "
                   "   ")))))


(ert-deftest minefield-with-only-mines ()
  (should (equal '("***"
                   "***"
                   "***")

       (annotate '("***"
                   "***"
                   "***")))))


(ert-deftest mine-surrounded-by-spaces ()
  (should (equal '("111"
                   "1*1"
                   "111")

       (annotate '("   "
                   " * "
                   "   ")))))


(ert-deftest space-surrounded-by-mines ()
  (should (equal '("***"
                   "*8*"
                   "***")

       (annotate '("***"
                   "* *"
                   "***")))))


(ert-deftest horizontal-line ()
  (should (equal '("1*2*1")

       (annotate '(" * * ")))))


(ert-deftest horizontal-line-mines-at-edges ()
  (should (equal '("*1 1*")

       (annotate '("*   *")))))


(ert-deftest vertical-line ()
  (should (equal '("1"
                   "*"
                   "2"
                   "*"
                   "1")

       (annotate '(" "
                   "*"
                   " "
                   "*"
                   " ")))))


(ert-deftest vertical-line-mines-at-edges ()
  (should (equal '("*"
                   "1"
                   " "
                   "1"
                   "*")

       (annotate '("*"
                   " "
                   " "
                   " "
                   "*")))))


(ert-deftest cross ()
  (should (equal '(" 2*2 "
                   "25*52"
                   "*****"
                   "25*52"
                   " 2*2 ")

       (annotate '("  *  "
                   "  *  "
                   "*****"
                   "  *  "
                   "  *  ")))))


(ert-deftest large-minefield ()
  (should (equal '("1*22*1"
                   "12*322"
                   " 123*2"
                   "112*4*"
                   "1*22*2"
                   "111111")

       (annotate '(" *  * "
                   "  *   "
                   "    * "
                   "   * *"
                   " *  * "
                   "      ")))))


(provide 'minesweeper-test)
;;; minesweeper-test.el ends here
