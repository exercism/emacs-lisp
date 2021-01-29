;;; leap-test.el --- Tests for Leap exercise (exercism)

;;; Commentary:

;;; Code:
(load-file "leap.el")

(ert-deftest vanilla-leap-year ()
  (should (leap-year-p 1996)))

(ert-deftest any-old-year ()
  (should-not (leap-year-p 1997)))

(ert-deftest non-leap-even-year ()
  (should-not (leap-year-p 1997)))

(ert-deftest century ()
  (should-not (leap-year-p 1900)))

(ert-deftest exceptional-century ()
  (should (leap-year-p 2000)))

(provide 'leap-test)
;;; leap-test.el ends here
