;;; two-bucket-test.el --- Two Bucket (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "two-bucket.el")
(declare-function measure "two-bucket.el" (bucket-one bucket-two goal start-bucket))


(ert-deftest measure-using-bucket-one-of-size-3-and-bucket-two-of-size-5-start-with-bucket-one ()
  (should (equal (measure 3 5 1 'one) '(4 one 5))))


(ert-deftest measure-using-bucket-one-of-size-3-and-bucket-two-of-size-5-start-with-bucket-two ()
  (should (equal (measure 3 5 1 'two) '(8 two 3))))


(ert-deftest measure-using-bucket-one-of-size-7-and-bucket-two-of-size-11-start-with-bucket-one ()
  (should (equal (measure 7 11 2 'one) '(14 one 11))))


(ert-deftest measure-using-bucket-one-of-size-7-and-bucket-two-of-size-11-start-with-bucket-two ()
  (should (equal (measure 7 11 2 'two) '(18 two 7))))


(ert-deftest measure-one-step-using-bucket-one-of-size-1-and-bucket-two-of-size-3-start-with-bucket-two ()
  (should (equal (measure 1 3 3 'two) '(1 two 0))))


(ert-deftest measure-using-bucket-one-of-size-2-and-bucket-two-of-size-3-start-with-bucket-one-and-end-with-bucket-two ()
  (should (equal (measure 2 3 3 'one) '(2 two 2))))


(ert-deftest measure-using-bucket-one-much-bigger-than-bucket-two ()
  (should (equal (measure 5 1 2 'one) '(6 one 1))))


(ert-deftest measure-using-bucket-one-much-smaller-than-bucket-two ()
  (should (equal (measure 3 15 9 'one) '(6 two 0))))


(ert-deftest not-possible-to-reach-the-goal ()
  (should-error (measure 6 15 5 'one) :type 'goal-not-possible))


(ert-deftest with-the-same-buckets-but-a-different-goal-then-it-is-possible ()
  (should (equal (measure 6 15 9 'one) '(10 two 0))))


(ert-deftest goal-larger-than-both-buckets-is-impossible ()
  (should-error (measure 5 7 8 'one) :type 'goal-not-possible))


(provide 'two-bucket-test)
;;; two-bucket-test.el ends here
