;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:
(require 'subr-x)

(defun response-for (phrase)
  "Provides Bob's response to PHRASE."
  (let ((stripped-phrase (string-trim phrase)))
    (cond ((string-empty-p stripped-phrase)
           "Fine. Be that way!")

          ((and (shoutp    stripped-phrase)
                (questionp stripped-phrase))
           "Calm down, I know what I'm doing!")

          ((shoutp stripped-phrase)
           "Whoa, chill out!")

          ((questionp stripped-phrase)
           "Sure.")

          (t "Whatever."))))

(defun shoutp (phrase)
  "Determines if PHRASE is shouted."
  (and (string-match "[A-Z]" phrase)
       (string= (upcase phrase) phrase)))

(defun questionp (phrase)
  "Determines if PHRASE is a question."
  (string-suffix-p "?" phrase))

(provide 'bob)
;;; bob.el ends here
