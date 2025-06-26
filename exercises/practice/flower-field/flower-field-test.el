;;; flower-field-test.el --- Tests for Flower Field (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "flower-field.el")
(declare-function annotate "flower-field.el" (garden))


(ert-deftest no-rows ()
  (should (equal '()

       (annotate '()))))


(ert-deftest no-columns ()
  (should (equal '("")

       (annotate '("")))))


(ert-deftest no-flowers ()
  (should (equal '("   "
                   "   "
                   "   ")

       (annotate '("   "
                   "   "
                   "   ")))))


(ert-deftest garden-full-of-flowers ()
  (should (equal '("***"
                   "***"
                   "***")

       (annotate '("***"
                   "***"
                   "***")))))


(ert-deftest flower-surrounded-by-spaces ()
  (should (equal '("111"
                   "1*1"
                   "111")

       (annotate '("   "
                   " * "
                   "   ")))))


(ert-deftest space-surrounded-by-flowers ()
  (should (equal '("***"
                   "*8*"
                   "***")

       (annotate '("***"
                   "* *"
                   "***")))))


(ert-deftest horizontal-line ()
  (should (equal '("1*2*1")

       (annotate '(" * * ")))))


(ert-deftest horizontal-line-flowers-at-edges ()
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


(ert-deftest vertical-line-flowers-at-edges ()
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


(ert-deftest large-garden ()
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


(provide 'flower-field-test)
;;; flower-field-test.el ends here
