;;; word-count.el --- word-count Exercise (exercism)

;;; Commentary:

;;; Code:


(defun word-count (sentence)
  (let ((count nil))
    (dolist (i (split-string (downcase sentence) "[^a-z0-9]" t))
      (let ((n (assoc i count)))
        (if n (setcdr n (1+ (cdr n)))
          (push (cons i 1) count))))
    count))


(provide 'word-count)
;;; word-count.el ends here
