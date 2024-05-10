;;; knapsack-test.el --- Tests for Knapsack (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "knapsack.el")
(declare-function maximum-value "knapsack.el" (maximum-weight items))


(ert-deftest no-items ()
  (should (= 0 (maximum-value 100 '()))))


(ert-deftest one-item-too-heavy ()
  (should (= 0 (maximum-value 10 '(((:weight . 100) (:value . 1)))))))


(ert-deftest five-items-cannot-be-greedy-by-weight ()
  (should (= 21 (maximum-value 10 '(((:weight . 2) (:value . 5))
                                    ((:weight . 2) (:value . 5))
                                    ((:weight . 2) (:value . 5))
                                    ((:weight . 2) (:value . 5))
                                    ((:weight . 10) (:value . 21)))))))


(ert-deftest five-items-cannot-be-greedy-by-value ()
  (should (= 80 (maximum-value 10 '(((:weight . 2) (:value . 20))
                                    ((:weight . 2) (:value . 20))
                                    ((:weight . 2) (:value . 20))
                                    ((:weight . 2) (:value . 20))
                                    ((:weight . 10) (:value . 50)))))))


(ert-deftest example-knapsack ()
  (should (= 90 (maximum-value 10 '(((:weight . 5) (:value . 10))
                                    ((:weight . 4) (:value . 40))
                                    ((:weight . 6) (:value . 30))
                                    ((:weight . 4) (:value . 50)))))))


(ert-deftest 8-items ()
  (should (= 900 (maximum-value 104 '(((:weight . 25) (:value . 350))
                                      ((:weight . 35) (:value . 400))
                                      ((:weight . 45) (:value . 450))
                                      ((:weight . 5) (:value . 20))
                                      ((:weight . 25) (:value . 70))
                                      ((:weight . 3) (:value . 8))
                                      ((:weight . 2) (:value . 5))
                                      ((:weight . 2) (:value . 5)))))))


(ert-deftest 15-items ()
  (should (= 1458 (maximum-value 750 '(((:weight . 70) (:value . 135))
                                       ((:weight . 73) (:value . 139))
                                       ((:weight . 77) (:value . 149))
                                       ((:weight . 80) (:value . 150))
                                       ((:weight . 82) (:value . 156))
                                       ((:weight . 87) (:value . 163))
                                       ((:weight . 90) (:value . 173))
                                       ((:weight . 94) (:value . 184))
                                       ((:weight . 98) (:value . 192))
                                       ((:weight . 106) (:value . 201))
                                       ((:weight . 110) (:value . 210))
                                       ((:weight . 113) (:value . 214))
                                       ((:weight . 115) (:value . 221))
                                       ((:weight . 118) (:value . 229))
                                       ((:weight . 120) (:value . 240)))))))


(provide 'knapsack-test)
;;; knapsack-test.el ends here
