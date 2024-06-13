;;; bank-account-test.el --- Bank Account (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "bank-account.el")

(require 'eieio)

(ert-deftest newly-opened-account-has-zero-balance ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (should (= (balance account) 0))))


(ert-deftest single-deposit ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (deposit account 100)
    (should (= (balance account) 100))))


(ert-deftest multiple-deposits ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (deposit account 100)
    (deposit account 50)
    (should (= (balance account) 150))))


(ert-deftest withdraw-once ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (deposit account 100)
    (withdraw account 75)
    (should (= (balance account) 25))))


(ert-deftest withdraw-twice ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (deposit account 100)
    (withdraw account 80)
    (withdraw account 20)
    (should (= (balance account) 0))))


(ert-deftest can-do-multiple-operations-sequentially ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (deposit account 100)
    (deposit account 110)
    (withdraw account 200)
    (deposit account 60)
    (withdraw account 50)
    (should (= (balance account) 20))))


(ert-deftest cannot-check-balance-of-closed-account ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (close-account account)
    (should-error (balance account) :type 'account-closed)))


(ert-deftest cannot-deposit-into-closed-account ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (close-account account)
    (should-error (deposit account 50) :type 'account-closed)))


(ert-deftest cannot-deposit-into-unopened-account ()
  (let ((account (make-new-bank-account)))
    (should-error (deposit account 50) :type 'account-closed)))


(ert-deftest cannot-withdraw-from-closed-account ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (close-account account)
    (should-error (withdraw account 50) :type 'account-closed)))


(ert-deftest cannot-close-an-account-that-was-not-opened ()
  (let ((account (make-new-bank-account)))
    (should-error (close-account account) :type 'account-closed)))


(ert-deftest cannot-open-an-already-opened-account ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (should-error (open-account account) :type 'account-open)))


(ert-deftest reopened-account-does-not-retain-balance ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (deposit account 50)
    (close-account account)
    (open-account account)
    (should (= (balance account) 0))))


(ert-deftest cannot-withdraw-more-than-deposited ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (deposit account 25)
    (should-error (withdraw account 50) :type 'account-overdraw)))


(ert-deftest cannot-withdraw-negative ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (deposit account 100)
    (should-error (withdraw account -50) :type 'account-negative-transaction)))


(ert-deftest cannot-deposit-negative ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (should-error (deposit account -50) :type 'account-negative-transaction)))


(ert-deftest can-handle-concurrent-transactions ()
  (let ((account (make-new-bank-account)))
    (open-account account)
    (defun concurrent-operation ()
      (deposit account 1)
      (withdraw account 1))
    (let ((threads ()))
      (dotimes (_ 1000)
        (push (make-thread #'concurrent-operation) threads))
      (dolist (thread threads)
        (thread-join thread)))
    (should (= (balance account ) 0))))


(provide 'bank-account-test)
;;; bank-account-test.el ends here
