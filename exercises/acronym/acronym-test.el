;;; acronym-test.el --- Tests for Acronym (exercism)

;;; Commentary:

;;; Code

(load-file "acronym.el")

(ert-deftest basic ()
  (should (equal "PNG" (acronym "Portable Network Graphics"))))

(ert-deftest lowercase-words ()
  (should (equal "ROR" (acronym "Ruby on Rails"))))

(ert-deftest punctuation ()
  (should (equal "FIFO" (acronym "First In, First Out"))))

(ert-deftest all-caps-words ()
  (should (equal "PHP" (acronym "PHP: Hypertext Preprocessor"))))

(ert-deftest non-acronym-all-caps-word ()
  (should (equal "GIMP" (acronym "GNU Image Manipulation Program"))))

(ert-deftest hyphenated ()
  (should (equal "CMOS" (acronym "Complementary metal-oxide semiconductor"))))

(provide 'acronym-test)
;;; acronym-test.el ends here
