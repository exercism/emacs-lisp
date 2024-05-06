;;; isbn-verifier.el --- ISBN Verifier (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun digit-value (c)
  (if (= ?X c) 10 (- c ?0)))

(defun validp (isbn)
    (let ((total 0)
          (weight 10)
          (characters (remq ?- (cl-coerce isbn 'list))))
      (cl-loop for c in characters
        always (or (cl-digit-char-p c) (and (= ?X c) (= weight 1)))
        do (setq total (+ total (* weight (digit-value c))))
        do (setq weight (- weight 1))
        finally return (and (= 0 weight) (= 0 (% total 11))))))

(provide 'isbn-verifier)
;;; isbn-verifier.el ends here
