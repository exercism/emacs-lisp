;;; sum-of-multiples-test.el --- Tests for Sum of Multiples (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "sum-of-multiples.el")
(declare-function sum "sum-of-multiples.el" (factors limit))


(ert-deftest no-multiples-within-limit ()
  (should (= 0 (sum '(3 5) 1))))


(ert-deftest one-factor-has-multiples-within-limit ()
  (should (= 3 (sum '(3 5) 4))))


(ert-deftest more-than-one-multiple-within-limit ()
  (should (= 9 (sum '(3) 7))))


(ert-deftest more-than-one-factor-with-multiples-within-limit ()
  (should (= 23 (sum '(3 5) 10))))


(ert-deftest each-multiple-is-only-counted-once ()
  (should (= 2318 (sum '(3 5) 100))))


(ert-deftest a-much-larger-limit ()
  (should (= 233168 (sum '(3 5) 1000))))


(ert-deftest three-factors ()
  (should (= 51 (sum '(7 13 17) 20))))


(ert-deftest factors-not-relatively-prime ()
  (should (= 30 (sum '(4 6) 15))))


(ert-deftest some-pairs-of-factors-relatively-prime-and-some-not ()
  (should (= 4419 (sum '(5 6 8) 150))))


(ert-deftest one-factor-is-a-multiple-of-another ()
  (should (= 275 (sum '(5 25) 51))))


(ert-deftest much-larger-factors ()
  (should (= 2203160 (sum '(43 47) 10000))))


(ert-deftest all-numbers-are-multiples-of-1 ()
  (should (= 4950 (sum '(1) 100))))


(ert-deftest no-factors-means-an-empty-sum ()
  (should (= 0 (sum '() 10000))))


(ert-deftest the-only-multiple-of-0-is-0 ()
  (should (= 0 (sum '(0) 1))))


(ert-deftest the-factor-0-does-not-affect-the-sum-of-multiples-of-other-factors ()
  (should (= 3 (sum '(3 0) 4))))


(ert-deftest solutions-using-include-exclude-must-extend-to-cardinality-greater-than-3 ()
  (should (= 39614537 (sum '(2 3 5 7 11) 10000))))


(provide 'sum-of-multiples-test)
;;; sum-of-multiples-test.el ends here
