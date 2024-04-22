;;; acronym-test.el --- Tests for Acronym (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code

(load-file "acronym.el")
(declare-function acronym "acronym.el" (phrase))

(ert-deftest basic ()
  (should (equal "PNG" (acronym "Portable Network Graphics"))))

(ert-deftest lowercase-words ()
  (should (equal "ROR" (acronym "Ruby on Rails"))))

(ert-deftest punctuation ()
  (should (equal "FIFO" (acronym "First In, First Out"))))

(ert-deftest all-caps-word ()
  (should (equal "GIMP" (acronym "GNU Image Manipulation Program"))))

(ert-deftest punctuation-without-white-space ()
  (should (equal "CMOS" (acronym "Complementary metal-oxide semiconductor"))))

(ert-deftest very-long-abbreviation ()
  (should (equal "ROTFLSHTMDCOALM"
                 (acronym "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"))))

(ert-deftest consecutive-delimiters ()
  (should (equal "SIMUFTA" (acronym "Something - I made up from thin air"))))

(ert-deftest apostrophes ()
  (should (equal "HC" (acronym "Halley's Comet"))))

(ert-deftest underscore-emphasis ()
  (should (equal "TRNT" (acronym "The Road _Not_ Taken"))))

(provide 'acronym-test)
;;; acronym-test.el ends here
