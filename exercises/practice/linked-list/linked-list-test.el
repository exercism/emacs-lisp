;;; linked-list-test.el --- Linked List (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "linked-list.el")
(declare-function dll-create "linked-list.el" ())
(declare-function dll-push "linked-list.el" (list value))
(declare-function dll-pop "linked-list.el" (list))
(declare-function dll-unshift "linked-list.el" (list value))
(declare-function dll-shift "linked-list.el" (list))
(declare-function dll-count "linked-list.el" (list))
(declare-function dll-delete "linked-list.el" (list value))


(ert-deftest pop-gets-element-from-the-list ()
  (let ((test-list (dll-create)))
    (dll-push test-list 7)
    (should (= (dll-pop test-list) 7))))


(ert-deftest push/pop-respectively-add/remove-at-the-end-of-the-list ()
  (let ((test-list (dll-create)))
    (dll-push test-list 11)
    (dll-push test-list 13)
    (should (= (dll-pop test-list) 13))
    (should (= (dll-pop test-list) 11))))


(ert-deftest shift-gets-an-element-from-the-list ()
  (let ((test-list (dll-create)))
    (dll-push test-list 17)
    (should (= (dll-shift test-list) 17))))


(ert-deftest shift-gets-first-element-from-the-list ()
  (let ((test-list (dll-create)))
    (dll-push test-list 23)
    (dll-push test-list 5)
    (should (= (dll-shift test-list) 23))
    (should (= (dll-shift test-list) 5))))


(ert-deftest unshift-adds-element-at-start-of-the-list ()
  (let ((test-list (dll-create)))
    (dll-unshift test-list 23)
    (dll-unshift test-list 5)
    (should (= (dll-shift test-list) 5))
    (should (= (dll-shift test-list) 23))))


(ert-deftest pop-push-shift-and-unshift-can-be-used-in-any-order ()
  (let ((test-list (dll-create)))
    (dll-push test-list 1)
    (dll-push test-list 2)
    (should (= (dll-pop test-list) 2))
    (dll-push test-list 3)
    (should (= (dll-shift test-list) 1))
    (dll-unshift test-list 4)
    (dll-push test-list 5)
    (should (= (dll-shift test-list) 4))
    (should (= (dll-pop test-list) 5))
    (should (= (dll-shift test-list) 3))))


(ert-deftest count-an-empty-list ()
  (let ((test-list (dll-create)))
    (should (= (dll-count test-list) 0))))


(ert-deftest count-a-list-with-items ()
  (let ((test-list (dll-create)))
    (dll-push test-list 37)
    (dll-push test-list 1)
    (should (= (dll-count test-list) 2))))


(ert-deftest count-is-correct-after-mutation ()
  (let ((test-list (dll-create)))
    (dll-push test-list 31)
    (should (= (dll-count test-list) 1))
    (dll-unshift test-list 43)
    (should (= (dll-count test-list) 2))
    (dll-shift test-list)
    (should (= (dll-count test-list) 1))
    (dll-pop test-list)
    (should (= (dll-count test-list) 0))))


(ert-deftest popping-to-empty-does-not-break-the-list ()
  (let ((test-list (dll-create)))
    (dll-push test-list 41)
    (dll-push test-list 59)
    (dll-pop test-list)
    (dll-pop test-list)
    (dll-push test-list 47)
    (should (= (dll-count test-list) 1))
    (should (= (dll-pop test-list) 47))))


(ert-deftest shifting-to-empty-does-not-break-the-list ()
  (let ((test-list (dll-create)))
    (dll-push test-list 41)
    (dll-push test-list 59)
    (dll-shift test-list)
    (dll-shift test-list)
    (dll-push test-list 47)
    (should (= (dll-count test-list) 1))
    (should (= (dll-shift test-list) 47))))


(ert-deftest deletes-the-only-element ()
  (let ((test-list (dll-create)))
    (dll-push test-list 61)
    (dll-delete test-list 61)
    (should (= (dll-count test-list) 0))))


(ert-deftest deletes-the-element-with-the-specified-value-from-the-list ()
  (let ((test-list (dll-create)))
    (dll-push test-list 71)
    (dll-push test-list 83)
    (dll-push test-list 79)
    (dll-delete test-list 83)
    (should (= (dll-count test-list) 2))
    (should (= (dll-pop test-list) 79))
    (should (= (dll-shift test-list) 71))))


(ert-deftest deletes-the-element-with-the-specified-value-from-the-list-re-assigns-tail ()
  (let ((test-list (dll-create)))
    (dll-push test-list 71)
    (dll-push test-list 83)
    (dll-push test-list 79)
    (dll-delete test-list 83)
    (should (= (dll-count test-list) 2))
    (should (= (dll-pop test-list) 79))
    (should (= (dll-pop test-list) 71))))


(ert-deftest deletes-the-element-with-the-specified-value-from-the-list-re-assigns-head ()
  (let ((test-list (dll-create)))
    (dll-push test-list 71)
    (dll-push test-list 83)
    (dll-push test-list 79)
    (dll-delete test-list 83)
    (should (= (dll-count test-list) 2))
    (should (= (dll-shift test-list) 71))
    (should (= (dll-shift test-list) 79))))


(ert-deftest deletes-the-first-of-two-elements ()
  (let ((test-list (dll-create)))
    (dll-push test-list 97)
    (dll-push test-list 101)
    (dll-delete test-list 97)
    (should (= (dll-count test-list) 1))
    (should (= (dll-pop test-list) 101))))


(ert-deftest deletes-the-second-of-two-elements ()
  (let ((test-list (dll-create)))
    (dll-push test-list 97)
    (dll-push test-list 101)
    (dll-delete test-list 101)
    (should (= (dll-count test-list) 1))
    (should (= (dll-pop test-list) 97))))


(ert-deftest delete-does-not-modify-the-list-if-the-element-is-not-found ()
  (let ((test-list (dll-create)))
    (dll-push test-list 89)
    (dll-delete test-list 103)
    (should (= (dll-count test-list) 1))))


(ert-deftest deletes-only-the-first-occurrence ()
  (let ((test-list (dll-create)))
    (dll-push test-list 73)
    (dll-push test-list 9)
    (dll-push test-list 9)
    (dll-push test-list 107)
    (dll-delete test-list 9)
    (should (= (dll-count test-list) 3))
    (should (= (dll-pop test-list) 107))
    (should (= (dll-pop test-list) 9))
    (should (= (dll-pop test-list) 73))))


(provide 'linked-list-test)
;;; linked-list-test.el ends here
