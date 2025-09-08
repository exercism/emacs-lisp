;;; wordy-test.el --- Tests for Wordy (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;; For this exercise we don't require specific error strings,
;; to avoid constraining solution approaches.

;;; Code:


(load-file "wordy.el")
(declare-function answer "wordy.el" (question))


(ert-deftest just-a-number ()
  (should (= 5 (answer "What is 5?"))))


(ert-deftest just-a-zero ()
  (should (= 0 (answer "What is 0?"))))


(ert-deftest just-a-negative-number ()
  (should (= -123 (answer "What is -123?"))))


(ert-deftest addition ()
  (should (= 2 (answer "What is 1 plus 1?"))))


(ert-deftest addition-with-a-left-hand-zero ()
  (should (= 2 (answer "What is 0 plus 2?"))))


(ert-deftest addition-with-a-right-hand-zero ()
  (should (= 3 (answer "What is 3 plus 0?"))))


(ert-deftest more-addition ()
  (should (= 55 (answer "What is 53 plus 2?"))))


(ert-deftest addition-with-negative-numbers ()
  (should (= -11 (answer "What is -1 plus -10?"))))


(ert-deftest large-addition ()
  (should (= 45801 (answer "What is 123 plus 45678?"))))


(ert-deftest subtraction ()
  (should (= 16 (answer "What is 4 minus -12?"))))


(ert-deftest multiplication ()
  (should (= -75 (answer "What is -3 multiplied by 25?"))))


(ert-deftest division ()
  (should (= -11 (answer "What is 33 divided by -3?"))))


(ert-deftest multiple-additions ()
  (should (= 3 (answer "What is 1 plus 1 plus 1?"))))


(ert-deftest addition-and-subtraction ()
  (should (= 8 (answer "What is 1 plus 5 minus -2?"))))


(ert-deftest multiple-subtraction ()
  (should (= 3 (answer "What is 20 minus 4 minus 13?"))))


(ert-deftest subtraction-then-addition ()
  (should (= 14 (answer "What is 17 minus 6 plus 3?"))))


(ert-deftest multiple-multiplication ()
  (should (= -12 (answer "What is 2 multiplied by -2 multiplied by 3?"))))


(ert-deftest addition-and-multiplication ()
  (should (= -8 (answer "What is -3 plus 7 multiplied by -2?"))))


(ert-deftest multiple-division ()
  (should (= 2 (answer "What is -12 divided by 2 divided by -3?"))))


(ert-deftest unknown-operation ()
  (should-error (answer "What is 52 cubed?") :type 'parse-error))


(ert-deftest non-math-question ()
  (should-error (answer "Who is the President of the United States?") :type 'parse-error))


(ert-deftest reject-problem-missing-an-operand ()
  (should-error (answer "What is 1 plus?") :type 'parse-error))


(ert-deftest reject-problem-with-no-operands-or-operators ()
  (should-error (answer "What is?") :type 'parse-error))


(ert-deftest reject-two-operations-in-a-row ()
  (should-error (answer "What is 1 plus plus 2?") :type 'parse-error))


(ert-deftest reject-two-numbers-in-a-row ()
  (should-error (answer "What is 1 plus 2 1?") :type 'parse-error))


(ert-deftest reject-postfix-notation ()
  (should-error (answer "What is 1 2 plus?") :type 'parse-error))


(ert-deftest reject-prefix-notation ()
  (should-error (answer "What is plus 1 2?") :type 'parse-error))


(provide 'wordy-test)
;;; wordy-test.el ends here
