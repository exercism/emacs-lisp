;;; acronym-test.el --- Tests for Acronym (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code


(load-file "acronym.el")
(declare-function acronym "acronym.el" (phrase))


(ert-deftest basic ()
  (should (string= "PNG" (acronym "Portable Network Graphics"))))


(ert-deftest lowercase-words ()
  (should (string= "ROR" (acronym "Ruby on Rails"))))


(ert-deftest punctuation ()
  (should (string= "FIFO" (acronym "First In, First Out"))))


(ert-deftest all-caps-word ()
  (should (string= "GIMP" (acronym "GNU Image Manipulation Program"))))


(ert-deftest punctuation-without-white-space ()
  (should (string= "CMOS" (acronym "Complementary metal-oxide semiconductor"))))


(ert-deftest very-long-abbreviation ()
  (should (string= "ROTFLSHTMDCOALM"
                 (acronym "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"))))


(ert-deftest consecutive-delimiters ()
  (should (string= "SIMUFTA" (acronym "Something - I made up from thin air"))))


(ert-deftest apostrophes ()
  (should (string= "HC" (acronym "Halley's Comet"))))


(ert-deftest underscore-emphasis ()
  (should (string= "TRNT" (acronym "The Road _Not_ Taken"))))


(provide 'acronym-test)
;;; acronym-test.el ends here
