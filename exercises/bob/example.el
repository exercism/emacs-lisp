;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:
(require 'subr-x)

(defun response-for (phrase)
  "Provides Bob's response to PHRASE."
  (let ((stripped-phrase (string-trim phrase)))
    (cond ((shout-questionp stripped-phrase) "Calm down, I know what I'm doing!")
          ((shoutp stripped-phrase) "Whoa, chill out!")
          ((string-match-p "^[[:space:]]*$" stripped-phrase) "Fine. Be that way!")
          ((questionp stripped-phrase) "Sure.")
          (t "Whatever."))))

(defun shoutp (phrase)
  "Determines if PHRASE is shouted."
  (and (string-match "[A-Z]" phrase)
       (string= (upcase phrase) phrase)))

(defun questionp (phrase)
  "Determines if PHRASE is a question."
  (string-suffix-p "?" phrase))

(defun shout-questionp (phrase)
  "Determines if PHRASE is a shouted question."
  (and (shoutp phrase) (questionp phrase)))

(provide 'bob)
;;; bob.el ends here
