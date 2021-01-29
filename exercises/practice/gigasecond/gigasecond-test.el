;;; gigasecond-test.el --- ERT tests for gigasecond (exercism)

;;; Commentary:
;;
;; Tests ported from Common Lisp gigasecond:
;; https://github.com/exercism/xlisp/blob/master/gigasecond/gigasecond-test.lisp
;;
;; To run tests individually: M-x eval-buffer RET, M-x ert RET test-name.
;; If you're using helm or something similar, you should get a menu of test names.
;;
;; To run tests in batch mode, from the command line run:
;; emacs -batch -l ert -l gigasecond-test.el -f ert-run-tests-batch-and-exit

;;; Code:

(load-file "gigasecond.el")

(ert-deftest from-lisp-epoch ()
  (should
   (equal '(40 46 1 10 9 1931) (from 0 0 0 1 1 1900))))

(ert-deftest from-unix-epoch ()
  (should
   (equal '(40 46 1 9 9 2001) (from 0 0 0 1 1 1970))))

(ert-deftest from-20110425T120000Z ()
  (should
   (equal '(40 46 13 1 1 2043) (from 0 0 12 25 4 2011))))

(ert-deftest from-19770613T235959Z ()
  (should
   (equal '(39 46 1 20 2 2009) (from 59 59 23 13 6 1977))))

(ert-deftest from-19590719T123030Z ()
  (should
   (equal '(10 17 14 27 3 1991) (from 30 30 12 19 7 1959))))

; customize this test to test your birthday and find your gigasecond date:
; (ert-deftest your-birthday ()
;   (should
;     (equal '(0 0 0 day2 month2 year2) (from 0 0 0 day1 month1 year1))))



(provide 'gigasecond-test)
;;; gigasecond-test.el ends here
