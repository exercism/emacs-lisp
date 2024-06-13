;;; bank-account.el --- Bank Account (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(define-error 'account-closed
              (error "Delete this S-Expression and write your own implementation"))
(define-error 'account-open
              (error "Delete this S-Expression and write your own implementation"))
(define-error 'account-overdraw
              (error "Delete this S-Expression and write your own implementation"))
(define-error 'account-negative-transaction
              (error "Delete this S-Expression and write your own implementation"))

(defclass bank-account (operations)
  (error "Delete this S-Expression and write your own implementation"))


(provide 'bank-account)
;;; bank-account.el ends here
