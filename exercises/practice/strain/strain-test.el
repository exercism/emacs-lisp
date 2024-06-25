;;; strain-test.el --- Strain (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "strain.el")
(declare-function keep "strain.el" (predicate list))
(declare-function discard "strain.el" (predicate list))


(defun starts-with (string prefix)
  (string-prefix-p prefix string))


(defun contains (list element)
  (member element list))


(ert-deftest keep-on-empty-list-returns-empty-list ()
  (should (equal (keep (lambda (x) t) '()) '())))


(ert-deftest keeps-everything ()
  (should (equal (keep (lambda (x) t) '(1 3 5)) '(1 3 5))))


(ert-deftest keeps-nothing ()
  (should (equal (keep (lambda (x) nil) '(1 3 5)) '())))


(ert-deftest keeps-first-and-last ()
  (should (equal (keep (lambda (x) (= 1 (% x 2))) '(1 2 3)) '(1 3))))


(ert-deftest keeps-neither-first-nor-last ()
  (should (equal (keep (lambda (x) (= 0 (% x 2))) '(1 2 3)) '(2))))


(ert-deftest keeps-strings ()
  (should (equal (keep (lambda (x) (starts-with x "z"))
                       '("apple" "zebra" "banana" "zombies" "cherimoya" "zealot"))
                 '("zebra" "zombies" "zealot"))))


(ert-deftest keeps-lists ()
  (should (equal (keep (lambda (x) (contains x 5))
                       '((1 2 3) (5 5 5) (5 1 2) (2 1 2) (1 5 2) (2 2 1) (1 2 5)))
                 '((5 5 5) (5 1 2) (1 5 2) (1 2 5)))))


(ert-deftest discard-on-empty-list-returns-empty-list ()
  (should (equal (discard (lambda (x) t) '()) '())))


(ert-deftest discards-everything ()
  (should (equal (discard (lambda (x) t) '(1 3 5)) '())))


(ert-deftest discards-nothing ()
  (should (equal (discard (lambda (x) nil) '(1 3 5)) '(1 3 5))))


(ert-deftest discards-first-and-last ()
  (should (equal (discard (lambda (x) (= (mod x 2) 1)) '(1 2 3)) '(2))))


(ert-deftest discards-neither-first-nor-last ()
  (should (equal (discard (lambda (x) (= (mod x 2) 0)) '(1 2 3)) '(1 3))))


(ert-deftest discards-strings ()
  (should (equal (discard (lambda (x) (starts-with x "z"))
                          '("apple" "zebra" "banana" "zombies" "cherimoya" "zealot"))
                 '("apple" "banana" "cherimoya"))))


(ert-deftest discards-lists ()
  (should (equal (discard (lambda (x) (contains x 5))
                          '((1 2 3) (5 5 5) (5 1 2) (2 1 2) (1 5 2) (2 2 1) (1 2 5)))
                 '((1 2 3) (2 1 2) (2 2 1)))))


(provide 'strain-test)
;;; strain-test.el ends here
