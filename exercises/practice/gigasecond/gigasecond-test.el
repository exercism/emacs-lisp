;;; gigasecond-test.el --- Gigasecond (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "gigasecond.el")
(declare-function add "gigasecond.el" (moment))


(ert-deftest date-only-specification-of-time ()
  (should (equal '(40 46 1 1 1 2043) (add 0 0 0 25 4 2011))))


(ert-deftest second-test-for-date-only-specification-of-time ()
  (should (equal '(40 46 1 19 2 2009) (add 0 0 0 13 6 1977))))


(ert-deftest third-test-for-date-only-specification-of-time ()
  (should (equal '(40 46 1 27 3 1991) (add 0 0 0 19 7 1959))))


(ert-deftest full-time-specified ()
  (should (equal '(40 46 23 2 10 2046) (add 0 0 22 24 1 2015))))


(ert-deftest full-time-with-day-roll-over ()
  (should (equal '(39 46 1 3 10 2046) (add 59 59 23 24 1 2015))))


(provide 'gigasecond-test)
;;; gigasecond-test.el ends here

