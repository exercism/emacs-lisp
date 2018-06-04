;;; run-length-encoding.el --- run-length-encoding Exercise (exercism)

;;; Commentary:

;;; Code:


(defun run-length-group (s)
  "return list of character run counts"
  (let ((case-fold-search nil)
	groups)
    (with-temp-buffer
      (insert s)
      (goto-char (point-min))
      (while (re-search-forward "\\(.\\)\\1*" nil t)
	(push (cons
	       (length (match-string 0))
	       (match-string 1))
	      groups)))
    (nreverse groups)))

;; (run-length-group "bbaaaac")


(defun run-length-encode (s)
  "encodes a string with run-length-encoding"
  (mapconcat (lambda (v)
	       (if (= (car v) 1)
		   (cdr v)
		 (format "%d%s" (car v) (cdr v))))
	     (run-length-group s)
	     ""))

;; "2a3b4c" (run-length-encode "aabbbcccc")


(defun run-length-parse (s)
  "split string into pairs containing a count and a character"
  (let (rtn)
    (with-temp-buffer
      (insert s)
      (goto-char (point-min))
      (while (re-search-forward "\\([0-9]*\\)\\(.\\)" nil t)
	(push (cons
	       (string-to-number (match-string 1))
	       (string-to-char (match-string 2)))
	      rtn)))
    (nreverse rtn)))

;; (run-length-parse "2a3b4cz")


(defun run-length-decode (s)
  "decodes a run-length-encoded string"
  (mapconcat (lambda (n)
	       (make-vector (if (= (car n) 0) 1 (car n)) (cdr n)))
	     (run-length-parse s)
	     ""))


(provide 'run-length-encoding)
;;; run-length-encoding.el ends here
