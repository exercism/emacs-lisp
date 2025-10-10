;;; line-up-test.el --- Line Up (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "line-up.el")
(declare-function ticket "line-up.el" (name number))


(ert-deftest format-smallest-non-exceptional-ordinal-numeral-4 ()
  (should (string= "Gianna, you are the 4th customer we serve today. Thank you!"
                   (ticket "Gianna" 4))))


(ert-deftest format-greatest-single-digit-non-exceptional-ordinal-numeral-9 ()
  (should (string= "Maarten, you are the 9th customer we serve today. Thank you!"
                   (ticket "Maarten" 9))))


(ert-deftest format-non-exceptional-ordinal-numeral-5 ()
  (should (string= "Petronila, you are the 5th customer we serve today. Thank you!"
                   (ticket "Petronila" 5))))


(ert-deftest format-non-exceptional-ordinal-numeral-6 ()
  (should (string= "Attakullakulla, you are the 6th customer we serve today. Thank you!"
                   (ticket "Attakullakulla" 6))))


(ert-deftest format-non-exceptional-ordinal-numeral-7 ()
  (should (string= "Kate, you are the 7th customer we serve today. Thank you!"
                   (ticket "Kate" 7))))


(ert-deftest format-non-exceptional-ordinal-numeral-8 ()
  (should (string= "Maximiliano, you are the 8th customer we serve today. Thank you!"
                   (ticket "Maximiliano" 8))))


(ert-deftest format-exceptional-ordinal-numeral-1 ()
  (should (string= "Mary, you are the 1st customer we serve today. Thank you!"
                   (ticket "Mary" 1))))


(ert-deftest format-exceptional-ordinal-numeral-2 ()
  (should (string= "Haruto, you are the 2nd customer we serve today. Thank you!"
                   (ticket "Haruto" 2))))


(ert-deftest format-exceptional-ordinal-numeral-3 ()
  (should (string= "Henriette, you are the 3rd customer we serve today. Thank you!"
                   (ticket "Henriette" 3))))


(ert-deftest format-smallest-two-digit-non-exceptional-ordinal-numeral-10 ()
  (should (string= "Alvarez, you are the 10th customer we serve today. Thank you!"
                   (ticket "Alvarez" 10))))


(ert-deftest format-non-exceptional-ordinal-numeral-11 ()
  (should (string= "Jacqueline, you are the 11th customer we serve today. Thank you!"
                   (ticket "Jacqueline" 11))))


(ert-deftest format-non-exceptional-ordinal-numeral-12 ()
  (should (string= "Juan, you are the 12th customer we serve today. Thank you!"
                   (ticket "Juan" 12))))


(ert-deftest format-non-exceptional-ordinal-numeral-13 ()
  (should (string= "Patricia, you are the 13th customer we serve today. Thank you!"
                   (ticket "Patricia" 13))))


(ert-deftest format-exceptional-ordinal-numeral-21 ()
  (should (string= "Washi, you are the 21st customer we serve today. Thank you!"
                   (ticket "Washi" 21))))


(ert-deftest format-exceptional-ordinal-numeral-62 ()
  (should (string= "Nayra, you are the 62nd customer we serve today. Thank you!"
                   (ticket "Nayra" 62))))


(ert-deftest format-exceptional-ordinal-numeral-100 ()
  (should (string= "John, you are the 100th customer we serve today. Thank you!"
                   (ticket "John" 100))))


(ert-deftest format-exceptional-ordinal-numeral-101 ()
  (should (string= "Zeinab, you are the 101st customer we serve today. Thank you!"
                   (ticket "Zeinab" 101))))


(ert-deftest format-non-exceptional-ordinal-numeral-112 ()
  (should (string= "Knud, you are the 112th customer we serve today. Thank you!"
                   (ticket "Knud" 112))))


(ert-deftest format-exceptional-ordinal-numeral-123 ()
  (should (string= "Yma, you are the 123rd customer we serve today. Thank you!"
                   (ticket "Yma" 123))))


(provide 'line-up-test)
;;; line-up-test.el ends here
