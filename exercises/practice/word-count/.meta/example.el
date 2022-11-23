;;; word-count.el --- word-count Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defvar exercisms--word-regexp "\\(\\([a-zA-Z]+\\('[a-zA-Z]+\\)?\\)\\|[0-9]+\\)")

(defun word-count (sentence)
  (let ((start 0)
        (word-counts '()))
    (save-match-data (while (string-match exercisms--word-regexp sentence start)
                       (let ((match (downcase (match-string 1 sentence))))
                         (if (assoc match word-counts)
                             (setf (cdr (assoc match word-counts))
                                   (1+ (assoc-default match word-counts 'equal 0)))
                           (push `(,match . 1) word-counts)))
                       (setq start (match-end 1))))
    word-counts))


(provide 'word-count)
;;; word-count.el ends here
