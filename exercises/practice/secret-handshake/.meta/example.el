;;; secret-handshake.el --- Secret Handshake (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun commands (number)
  (let ((all-commands '("wink" "double blink" "close your eyes" "jump"))
        (result nil))
    (cl-labels
      ((extract (action shift pending)
          (cl-loop until (null pending)
            if (/= (logand number action) 0)
              do (setq result (cons (car pending) result))
            do (setq pending (cdr pending))
            do (setq action (lsh action shift))
            finally return result)))
      (if (= (logand number 16) 0)
        (funcall #'extract 8 -1 (reverse all-commands))
        (funcall #'extract 1 1 all-commands)))))

(provide 'secret-handshake)
;;; secret-handshake.el ends here

