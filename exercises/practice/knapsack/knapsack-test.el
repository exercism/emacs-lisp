;;; knapsack-test.el --- Tests for Knapsack (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "knapsack.el")
(declare-function knapsack "knapsack.el" (capacity weights values))


(ert-deftest no-items ()
  (should (= 0 (knapsack 100 '() '()))))


(ert-deftest one-item-too-heavy ()
  (should (= 0 (knapsack 10 '(100) '(1)))))


(ert-deftest five-items-cannot-be-greedy-by-weight ()
  (should (= 21 (knapsack 10 '(2 2 2 2 10) '(5 5 5 5 21)))))


(ert-deftest five-items-cannot-be-greedy-by-value ()
  (should (= 80 (knapsack 10 '(2 2 2 2 10) '(20 20 20 20 50)))))


(ert-deftest example-knapsack ()
  (should (= 90 (knapsack 10 '(5 4 6 4) '(10 40 30 50)))))


(ert-deftest 8-items ()
  (should (= 900 (knapsack 104
                           '(25 35 45 5 25 3 2 2)
                           '(350 400 450 20 70 8 5 5)))))


(ert-deftest 15-items ()
  (should (= 1458 (knapsack 750
                            '(70 73 77 80 82 87 90 94 98 106 110 113 115 118 120)
                            '(135 139 149 150 156 163 173 184 192 201 210 214 221 229 240)))))


(provide 'knapsack-test)
;;; knapsack-test.el ends here
