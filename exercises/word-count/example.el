;;; word-count.el --- word-count Exercise (exercism)

;;; Commentary:

;;; Code:


(defun word-count (sentence)
  (let ((count nil))
    (dolist (word (split-string (downcase sentence) "[^a-z0-9]" t))
      (let ((entry (assoc-string word count)))
        (if entry
            (setcdr entry (1+ (cdr entry)))
          (push (cons word 1) count))))
    count))


(provide 'word-count)
;;; word-count.el ends here
