;;; high-scores-test.el --- Tests for High Scores (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "high-scores.el")
(declare-function latest "high-scores.el" (scores))
(declare-function personal-best "high-scores.el" (scores))
(declare-function personal-top-three "high-scores.el" (scores))


(ert-deftest latest-score ()
  (should (= 30 (latest '(100 0 90 30)))))


(ert-deftest personal-best ()
  (should (= 100 (personal-best '(40 100 70)))))


(ert-deftest top-3-scores-personal-top-three-from-a-list-of-scores ()
  (should (equal '(100 90 70) (personal-top-three '(10 30 90 30 100 20 10 0 30 40 40 70 70)))))


(ert-deftest top-3-scores-personal-top-highest-to-lowest ()
  (should (equal '(30 20 10) (personal-top-three '(20 10 30)))))


(ert-deftest top-3-scores-personal-top-when-there-is-a-tie ()
  (should (equal '(40 40 30) (personal-top-three '(40 20 40 30)))))


(ert-deftest top-3-scores-personal-top-when-there-are-less-than-3 ()
  (should (equal '(70 30) (personal-top-three '(30 70)))))


(ert-deftest top-3-scores-personal-top-when-there-is-only-one ()
  (should (equal '(40) (personal-top-three '(40)))))


(provide 'high-scores-test)
;;; high-scores-test.el ends here
