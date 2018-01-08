;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:
(defun response-for (phrase)
  "Provides Bob's response to PHRASE."
  (cond ((shoutp phrase) "Whoa, chill out!")
        ((string-match-p "^[[:space:]]*$" phrase) "Fine. Be that way!")
        ((questionp phrase) "Sure.")
        (t "Whatever.")))

(defun shoutp (phrase)
  "Determines if PHRASE is shouted."
  (and (string-match "[A-Z]" phrase)
       (string= (upcase phrase) phrase)))

(defun questionp (phrase)
  "Determines if PHRASE is a question."
  (and (> (length phrase) 0)
   (= ?? (aref phrase (1- (length phrase))))))




(provide 'bob)
;;; bob.el ends here
