;;; parallel-letter-frequency-subprocess.el --- Parallel Letter Frequency Subprocess (exercism) -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun calculate-frequencies-in-subprocess (texts)
  (princ
   (let ((freqs (make-hash-table :test 'equal)))
     (dolist (text texts)
       (let ((text-freqs (make-hash-table :test 'equal)))
         (dolist (char (string-to-list text))
           (when (string-match-p "[[:alpha:]]" (char-to-string char))
             (puthash
              char (1+ (gethash char text-freqs 0)) text-freqs)))
         (maphash
          (lambda (key value)
            (puthash key (+ value (gethash key freqs 0)) freqs))
          text-freqs)))
     (let (result)
       (maphash
        (lambda (key value)
          (push (format "%c:%d" key value) result))
        freqs)
       (string-join (reverse result) ",")))))


(provide 'parallel-letter-frequency-subprocess)
;;; parallel-letter-frequency-subprocess.el ends here
