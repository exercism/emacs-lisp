;;; acronym-test.el --- Tests for Acronym (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code


(load-file "acronym.el")
(declare-function acronym "acronym.el" (phrase))


(ert-deftest basic ()
  (should (string= (acronym "Portable Network Graphics")
                   "PNG")))


(ert-deftest lowercase-words ()
  (should (string= (acronym "Ruby on Rails")
                   "ROR")))


(ert-deftest punctuation ()
  (should (string= (acronym "First In, First Out")
                   "FIFO")))


(ert-deftest all-caps-word ()
  (should (string= (acronym "GNU Image Manipulation Program")
                   "GIMP")))


(ert-deftest punctuation-without-white-space ()
  (should (string= (acronym "Complementary metal-oxide semiconductor")
                   "CMOS")))


(ert-deftest very-long-abbreviation ()
  (should (string= (acronym "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me")
                   "ROTFLSHTMDCOALM")))


(ert-deftest consecutive-delimiters ()
  (should (string= (acronym "Something - I made up from thin air")
                   "SIMUFTA")))


(ert-deftest apostrophes ()
  (should (string= (acronym "Halley's Comet") "HC")))


(ert-deftest underscore-emphasis ()
  (should (string= (acronym "The Road _Not_ Taken") "TRNT")))


(provide 'acronym-test)
;;; acronym-test.el ends here
