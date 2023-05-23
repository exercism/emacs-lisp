;;; flatten-array-test.el --- Flatten Array (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "flatten-array.el")
(declare-function list-flatten "flatten-array.el" (array))


(ert-deftest empty ()
  (should (equal (list-flatten '()) '())))


(ert-deftest no-nesting ()
  (should (equal (list-flatten '(0 1 2)) '(0 1 2))))


(ert-deftest flattens-a-nested-array ()
  (should (equal (list-flatten '((()))) '())))


(ert-deftest flattens-array-with-just-integers-present ()
  (should
   (equal (list-flatten '(1 (2 3 4 5 6 7) 8)) '(1 2 3 4 5 6 7 8))))


(ert-deftest 5-level-nesting ()
  (should
   (equal
    (list-flatten '(0 2 ((2 3) 8 100 4 (((50)))) -2))
    '(0 2 2 3 8 100 4 50 -2))))


(ert-deftest 6-level-nesting ()
  (should
   (equal
    (list-flatten '(1 (2 ((3)) (4 ((5))) 6 7) 8))
    '(1 2 3 4 5 6 7 8))))


(ert-deftest null-values-are-omitted-from-the-final-result ()
  (should (equal (list-flatten '(1 2 nil)) '(1 2))))


(ert-deftest
    consecutive-null-values-at-the-front-of-the-list-are-omitted-from-the-final-result
    ()
  (should (equal (list-flatten '(nil nil 3)) '(3))))


(ert-deftest
    consecutive-null-values-in-the-middle-of-the-list-are-omitted-from-the-final-result
    ()
  (should (equal (list-flatten '(1 nil nil 4)) '(1 4))))


(ert-deftest 6-level-nest-list-with-null-values ()
  (should
   (equal
    (list-flatten
     '(0 2 ((2 3) 8 ((100)) nil ((nil))) -2))
    '(0 2 2 3 8 100 -2))))


(ert-deftest all-values-in-nested-list-are-null ()
  (should
   (equal
    (list-flatten '(nil (((nil))) nil nil ((nil nil) nil) nil)) '())))


(provide 'flatten-array-test)
;;; flatten-array-test.el ends here
