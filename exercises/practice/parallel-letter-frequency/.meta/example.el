;;; parallel-letter-frequency.el --- Parallel Letter Frequency (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun count-frequencies (text)
  "Count the frequency of each letter in TEXT."
  (let ((freqs (make-hash-table :test 'equal)))
    (dolist (char (string-to-list (downcase text)))
      (when (string-match-p "[[:alpha:]]" (char-to-string char))  ; Check if char is a Unicode letter
        (puthash char (1+ (gethash char freqs 0)) freqs)))
    freqs))

(defun combine-frequencies (freqs-list)
  "Combine a list of frequency hash tables into a single hash table."
  (let ((combined-freqs (make-hash-table :test 'equal)))
    (dolist (freqs freqs-list)
      (maphash (lambda (key value)
                 (puthash key (+ value (gethash key combined-freqs 0)) combined-freqs))
               freqs))
    combined-freqs))

(defun calculate-frequencies (texts)
  "Calculate letter frequencies for each string in TEXTS using threads."
  (let ((threads (mapcar (lambda (text)
                           (make-thread
                            (lambda ()
                              (count-frequencies text))))
                         texts))
        result
        freqs-list)
    ;; Wait for all threads to complete and collect their results
    (dolist (thread threads)
      (thread-join thread)
      (push (thread-join thread) freqs-list))
    ;; Combine the frequencies
    (let ((combined-freqs (combine-frequencies freqs-list)))
      (maphash (lambda (key value)
                 (push (list (char-to-string key) value) result))
               combined-freqs)
      (setq result (sort result (lambda (a b) (string< (car a) (car b)))))
      (setq result (apply 'append result))
      result)))


(provide 'parallel-letter-frequency)
;;; parallel-letter-frequency.el ends here
