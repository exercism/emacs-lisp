;;; word-count-test.el --- Tests for word-count (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "word-count.el")
(declare-function word-count "word-count.el" (sentence))

(defun equal-assoc (a b)
  (let ((strcmp (lambda (a b) (not (string< (car a) (car b))))))
    (equal (sort (copy-sequence a) strcmp)
           (sort (copy-sequence b) strcmp))))


(ert-deftest no-words-test ()
  (should (equal-assoc (word-count "")
                       nil)))


(ert-deftest count-one-word-test ()
  (should (equal-assoc (word-count "word")
                       '(("word" . 1)))))


(ert-deftest count-one-of-each-word-test ()
  (should (equal-assoc (word-count "one of each")
                       '(("each" . 1)
                         ("of" . 1)
                         ("one" . 1)))))


(ert-deftest multiple-occurrences-of-a-word-test ()
  (should (equal-assoc (word-count "one fish two fish red fish blue fish")
                       '(("blue" . 1)
                         ("red" . 1)
                         ("two" . 1)
                         ("fish" . 4)
                         ("one" . 1)))))


(ert-deftest ignore-punctuation-test ()
  (should (equal-assoc (word-count "car : carpet as java : javascript!!&@$%^&")
                       '(("javascript" . 1)
                         ("java" . 1)
                         ("as" . 1)
                         ("carpet" . 1)
                         ("car" . 1)))))


(ert-deftest include-numbers-test ()
  (should (equal-assoc (word-count "testing, 1, 2 testing")
                       '(("2" . 1)
                         ("1" . 1)
                         ("testing" . 2)))))


(ert-deftest normalize-case-test ()
  (should (equal-assoc (word-count "go Go GO Stop stop")
                       '(("stop" . 2)
                         ("go" . 3)))))

(ert-deftest with-apostrophes-test ()
  (should (equal-assoc (word-count "First: don't laugh. Then: don't cry. You're getting it.")
                       '(("first" . 1)
                         ("don't" . 2)
                         ("laugh" . 1)
                         ("then" . 1)
                         ("cry" . 1)
                         ("you're" . 1)
                         ("getting" . 1)
                         ("it" . 1)))))

(ert-deftest quotation-for-word-with-apostrophe-test ()
  (should (equal-assoc (word-count "can, can't, 'can't''")
                       '(("can" . 1)
                         ("can't" . 2)))))

(provide 'word-count)
;;; word-count-test.el ends here
