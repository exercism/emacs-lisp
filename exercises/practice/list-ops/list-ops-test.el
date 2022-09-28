;;; list-ops-test.el --- Tests for List Ops (exercism)

;;; Commentary:

;;; Code:

(load-file "list-ops.el")


(ert-deftest append-empt-lists ()
  (should (equal '() (list-append '() '()))))


(ert-deftest append-first-list-empty ()
  (should (equal '(1 2 3 4) (list-append '() '(1 2 3 4)))))


(ert-deftest append-second-list-empty ()
  (should (equal '(1 2 3 4) (list-append '(1 2 3 4) '()))))


(ert-deftest append-non-empty-lists ()
  (should (equal '(1 2 2 3 4 5) (list-append '(1 2) '(2 3 4 5)))))


(ert-deftest concatenate-multiple-lists ()
  (should (equal '(1 2 3 4 5 6) (list-concatenate '(1 2) '(3) '() '(4 5 6)))))


(ert-deftest concatenate-nested-lists ()
  (should (equal '((1) (2) (3) () (4 5 6)) (list-concatenate '((1) (2)) '((3)) '(()) '((4 5 6))))))


(ert-deftest filter-empty-list ()
  (should (equal '() (list-filter '() (lambda (elem) (= 1 (% elem 2)))))))


(ert-deftest filter-matching-elements ()
  (should (equal '(1 3 5) (list-filter '(1 2 3 5) (lambda (elem) (= 1 (% elem 2)))))))


(ert-deftest length-empty-list ()
  (should (equal 0 (list-length '()))))


(ert-deftest length-with-elements ()
  (should (equal 4 (list-length '(1 2 3 4)))))


(ert-deftest map-increment-empty-list ()
  (should (equal '() (list-map '() '1+))))


(ert-deftest map-increment-elements ()
  (should (equal '(2 4 6 8) (list-map '(1 3 5 7) '1+))))


(ert-deftest foldl-empty-list ()
  (should (equal 2 (list-foldl '* '() 2))))


(ert-deftest foldl-sum-elements ()
  (should (equal 15 (list-foldl (lambda (accu elem) (+ elem accu)) '(1 2 3 4) 5))))


(ert-deftest foldl-floating-point-division ()
  (should (equal 64.0 (list-foldl (lambda (accu elem) (/ elem accu)) '(1 2 3 4) 24.0))))


(ert-deftest foldl-multiply-empty-list ()
  (should (equal 2 (list-foldl (lambda (accu elem) (* elem accu)) '() 2))))


(ert-deftest foldr-empty-list ()
  (should (equal 2 (list-foldr '* '() 2))))


(ert-deftest foldr-sum-elements ()
  (should (equal 15 (list-foldr (lambda (elem accu) (+ elem accu)) '(1 2 3 4) 5))))


(ert-deftest foldr-floating-point-division ()
  (should (equal 9.0 (list-foldr (lambda (elem accu) (/ elem accu)) '(1 2 3 4) 24.0))))


(ert-deftest foldl-multiply-empty-list ()
  (should (equal 2 (list-foldl (lambda (elem accu) (* elem accu)) '() 2))))


(ert-deftest foldr-multiply-empty-list ()
  (should (equal 2 (list-foldr (lambda (elem accu) (* elem accu)) '() 2))))


(ert-deftest reverse-empty-list ()
  (should (equal '() (list-reverse '()))))


(ert-deftest reverse-list-with-members ()
  (should (equal '(7 5 3 1) (list-reverse '(1 3 5 7)))))


(ert-deftest reverse-list-not-flattened ()
  (should (equal '((4 5 6) () (3) (2) (1)) (list-reverse '((1) (2) (3) () (4 5 6))))))


(provide 'list-ops-test)
;;; list-ops-test.el ends here
