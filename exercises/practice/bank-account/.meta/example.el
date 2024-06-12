;;; bank-account.el --- Bank Account (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'eieio)

(defclass bank-account ()
  ((open
    :initarg :open
    :initform nil
    :type boolean
    :documentation "Is the account open?")
   (funds
    :initarg :funds
    :initform 0
    :type number
    :documentation "Amount of funds in the account")
   (lock
    :initarg :lock
    :initform (bank-account--make-semaphore)
    :documentation "Semaphore lock for the account"))
  "Class representing a bank account.")

(defun bank-account--make-semaphore ()
  (list 0 (make-mutex)))

(defun bank-account--semaphore-post (semaphore)
  (let ((count (car semaphore))
        (mutex (cadr semaphore)))
    (with-mutex mutex
      (setcar semaphore (1+ count)))))

(defun bank-account--semaphore-wait (semaphore)
  (let ((count (car semaphore))
        (mutex (cadr semaphore)))
    (with-mutex mutex
      (while (<= count 0)
        (setq count (car semaphore)))
      (setcar semaphore (1- count)))))

(cl-defmethod check-open ((account bank-account))
  (unless (oref account open)
    (error "account not open")))

(cl-defmethod check-positive ((account bank-account) amount)
  (unless (> amount 0)
    (error "amount must be greater than 0")))

(cl-defmethod open-account ((account bank-account))
  (if (oref account open)
      (error "account already open")
    (oset account open t)
    (oset account funds 0)
    (bank-account--semaphore-post (oref account lock))))

(cl-defmethod close-account ((account bank-account))
  (check-open account)
  (bank-account--semaphore-wait (oref account lock))
  (oset account open nil)
  (bank-account--semaphore-post (oref account lock)))

(cl-defmethod deposit ((account bank-account) amount)
  (check-open account)
  (check-positive account amount)
  (bank-account--semaphore-wait (oref account lock))
  (oset account funds (+ (oref account funds) amount))
  (bank-account--semaphore-post (oref account lock)))

(cl-defmethod withdraw ((account bank-account) amount)
  (check-open account)
  (check-positive account amount)
  (if (> amount (oref account funds))
      (error "amount must be less than balance")
    (bank-account--semaphore-wait (oref account lock))
    (oset account funds (- (oref account funds) amount))
    (bank-account--semaphore-post (oref account lock))))

(cl-defmethod balance ((account bank-account))
  (check-open account)
  (oref account funds))

(defun make-new-bank-account ()
  (bank-account :open nil :funds 0 :lock (bank-account--make-semaphore)))


(provide 'bank-account)
;;; bank-account.el ends here

