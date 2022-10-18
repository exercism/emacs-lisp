;;; leap-test.el --- Tests for Leap exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "leap.el")
(declare-function leap-year-p "leap.el" (year))

(ert-deftest year-not-divisible-by-4-in-common-year ()
  (should-not (leap-year-p 2015)))

(ert-deftest year-divisible-by-2-not-divisible-by-4-in-common-year ()
  (should-not (leap-year-p 1970)))

(ert-deftest year-divisible-by-4-not-divisible-by-100-in-leap-year ()
  (should (leap-year-p 1996)))

(ert-deftest year-divisible-by-4-and-5-is-still-a-leap-year ()
  (should (leap-year-p 1960)))

(ert-deftest year-divisible-by-100-not-divisible-by-400-in-common-year ()
  (should-not (leap-year-p 2100)))

(ert-deftest year-divisible-by-100-but-not-by-3-is-still-not-a-leap-year ()
  (should-not (leap-year-p 1900)))

(ert-deftest year-divisible-by-400-is-leap-year ()
  (should (leap-year-p 2000)))

(ert-deftest year-divisible-by-400-but-not-by-125-is-still-leap-year ()
  (should (leap-year-p 2400)))

(ert-deftest year-divisible-by-200-not-divisible-by-400-in-common-year ()
  (should-not (leap-year-p 1800)))

(provide 'leap-test)
;;; leap-test.el ends here
