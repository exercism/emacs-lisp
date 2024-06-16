;;; grade-school-test.el --- Grade School (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "grade-school.el")
(declare-function roster "grade-school.el" (students))
(declare-function add "grade-school.el" (students))
(declare-function grade "grade-school.el" (desired-grade students))


(ert-deftest roster-is-empty-when-no-student-is-added ()
  (let ((test-school (make-school)))
    (should (equal (roster test-school) '()))))


(ert-deftest add-a-student ()
  (let ((test-school (make-school)))
    (should (add test-school "Aimee" 2))))


(ert-deftest student-is-added-to-the-roster ()
  (let ((test-school (make-school)))
    (add test-school "Aimee" 2)
    (should (equal (roster test-school) '("Aimee")))))


(ert-deftest adding-multiple-students-in-the-same-grade-in-the-roster ()
  (let ((test-school (make-school)))
    (should (add test-school "Blair" 2))
    (should (add test-school "James" 2))
    (should (add test-school "Paul" 2))))


(ert-deftest multiple-students-in-the-same-grade-are-added-to-the-roster ()
  (let ((test-school (make-school)))
    (add test-school "Blair" 2)
    (add test-school "James" 2)
    (add test-school "Paul" 2)
    (should (equal (roster test-school) '("Blair" "James" "Paul")))))


(ert-deftest cannot-add-student-to-same-grade-in-the-roster-more-than-once ()
  (let ((test-school (make-school)))
    (should (add test-school "Blair" 2))
    (should (add test-school "James" 2))
    (should-not (add test-school "James" 2))
    (should (add test-school "Paul" 2))))


(ert-deftest student-not-added-to-same-grade-in-the-roster-more-than-once ()
  (let ((test-school (make-school)))
    (add test-school "Blair" 2)
    (add test-school "James" 2)
    (add test-school "James" 2)
    (add test-school "Paul" 2)
    (should (equal (roster test-school) '("Blair" "James" "Paul")))))


(ert-deftest adding-students-in-multiple-grades ()
  (let ((test-school (make-school)))
    (should (add test-school "Chelsea" 3))
    (should (add test-school "Loagan" 7))))


(ert-deftest students-in-multiple-grades-are-added-to-the-roster ()
  (let ((test-school (make-school)))
    (add test-school "Chelsea" 3)
    (add test-school "Logan" 7)
    (should (equal (roster test-school) '("Chelsea" "Logan")))))


(ert-deftest cannot-add-same-student-to-multiple-grades-in-the-roster ()
  (let ((test-school (make-school)))
    (should (add test-school "Blair" 2))
    (should (add test-school "James" 2))
    (should-not (add test-school "James" 3))
    (should (add test-school "Paul" 3))))


(ert-deftest student-not-added-to-multiple-grades-in-the-roster ()
  (let ((test-school (make-school)))
    (add test-school "Blair" 2)
    (add test-school "James" 2)
    (add test-school "James" 3)
    (add test-school "Paul" 3)
    (should (equal (roster test-school) '("Blair" "James" "Paul")))))


(ert-deftest students-are-sorted-by-grades-in-the-roster ()
  (let ((test-school (make-school)))
    (add test-school "Jim" 3)
    (add test-school "Peter" 2)
    (add test-school "Anna" 1)
    (should (equal (roster test-school) '("Anna" "Peter" "Jim")))))


(ert-deftest students-are-sorted-by-name-in-the-roster ()
  (let ((test-school (make-school)))
    (add test-school "Peter" 2)
    (add test-school "Zoe" 2)
    (add test-school "Alex" 2)
    (should (equal (roster test-school) '("Alex" "Peter" "Zoe")))))


(ert-deftest students-are-sorted-by-grades-and-then-by-name-in-the-roster ()
  (let ((test-school (make-school)))
    (add test-school "Peter" 2)
    (add test-school "Anna" 1)
    (add test-school "Barb" 1)
    (add test-school "Zoe" 2)
    (add test-school "Alex" 2)
    (add test-school "Jim" 3)
    (add test-school "Charlie" 1)
    (should (equal (roster test-school) '("Anna" "Barb" "Charlie" "Alex" "Peter" "Zoe" "Jim")))))


(ert-deftest grade-is-empty-if-no-students-in-the-roster ()
  (let ((test-school (make-school)))
    (should (equal (grade test-school 1) '()))))


(ert-deftest grade-is-empty-if-no-students-in-that-grade ()
  (let ((test-school (make-school)))
    (add test-school "Peter" 2)
    (add test-school "Zoe" 2)
    (add test-school "Alex" 2)
    (add test-school "Jim" 3)
    (should (equal (grade test-school 1) '()))))


(ert-deftest student-not-added-to-same-grade-more-than-once ()
  (let ((test-school (make-school)))
    (add test-school "Blair" 2)
    (add test-school "James" 2)
    (add test-school "James" 2)
    (add test-school "Paul" 2)
    (should (equal (grade test-school 2) '("Blair" "James" "Paul")))))


(ert-deftest student-not-added-to-multiple-grades ()
  (let ((test-school (make-school)))
    (add test-school "Blair" 2)
    (add test-school "James" 2)
    (add test-school "James" 3)
    (add test-school "Paul" 3)
    (should (equal (grade test-school 2) '("Blair" "James")))))


(ert-deftest student-not-added-to-other-grade-for-multiple-grades ()
  (let ((test-school (make-school)))
    (add test-school "Blair" 2)
    (add test-school "James" 2)
    (add test-school "James" 3)
    (add test-school "Paul" 3)
    (should (equal (grade test-school 3) '("Paul")))))


(ert-deftest students-are-sorted-by-name-in-a-grade ()
  (let ((test-school (make-school)))
    (add test-school "Franklin" 5)
    (add test-school "Bradley" 5)
    (add test-school "Jeff" 1)
    (should (equal (grade test-school 5) '("Bradley" "Franklin")))))


(provide 'grade-school-test)
;;; grade-school-test.el ends here
