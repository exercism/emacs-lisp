;;; parallel-letter-frequency.el --- Parallel Letter Frequency (exercism) -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun clean-text (text)
  "Clean TEXT by removing numbers, punctuation, and whitespace, keeping only alphabetic characters and converting to lowercase."
  (downcase (replace-regexp-in-string "[^[:alpha:]]" "" text)))

(defun combine-frequencies (freqs-list)
  "Combine a list of frequency hash tables in FREQU-list into a single hash table."
  (let ((combined-freqs (make-hash-table :test 'equal)))
    (dolist (freqs freqs-list)
      (maphash (lambda (key value)
                 (puthash key (+ value (gethash key combined-freqs 0)) combined-freqs))
               freqs))
    combined-freqs))

(defun serialize-hash-table (hash-table)
  "Serialize HASH-TABLE to a string."
  (let (result)
    (maphash (lambda (key value)
               (push (format "%c:%d" key value) result))
             hash-table)
    (string-join (reverse result) ",")))

(defun deserialize-hash-table (str)
  "Deserialize STR to a hash table."
  (let ((hash-table (make-hash-table :test 'equal)))
    (unless (string= str "") ; Check if the string is empty
      (dolist (item (split-string str ","))
        (let ((pair (split-string item ":")))
          (puthash (string-to-char (nth 0 pair))
                   (string-to-number (nth 1 pair))
                   hash-table))))
    hash-table))

(defun calculate-frequencies (texts)
  "Calculate letter frequencies for each string in TEXTS using processes."
  (let ((cleaned-texts (mapcar #'clean-text texts)))
    (if (cl-every #'string-empty-p cleaned-texts)
        '()  ;; Return empty list if all cleaned texts are empty
      (let* ((num-processes (min (length cleaned-texts) (max 1 (string-to-number (shell-command-to-string "nproc")))))
             (texts-per-process (ceiling (/ (float (length cleaned-texts)) num-processes)))
             (results (make-hash-table :test 'equal))
             (pending num-processes)
             (final-result nil)
             (processes nil))
        ;; Create processes
        (dotimes (i num-processes)
          (let* ((start-index (* i texts-per-process))
                 (end-index (min (* (1+ i) texts-per-process) (length cleaned-texts)))
                 (process-texts (if (< start-index (length cleaned-texts))
                                    (cl-subseq cleaned-texts start-index end-index)
                                  '())))
            (when (not (null process-texts))
              (let* ((command (format "(princ (let ((freqs (make-hash-table :test 'equal))) (dolist (text '%S) (let ((text-freqs (make-hash-table :test 'equal))) (dolist (char (string-to-list text)) (when (string-match-p \"[[:alpha:]]\" (char-to-string char)) (puthash char (1+ (gethash char text-freqs 0)) text-freqs))) (maphash (lambda (key value) (puthash key (+ value (gethash key freqs 0)) freqs)) text-freqs))) (let (result) (maphash (lambda (key value) (push (format \"%%c:%%d\" key value) result)) freqs) (string-join (reverse result) \",\")))))"
                                     process-texts))
                     (process (make-process
                               :name (format "letter-freq-process-%d" i)
                               :buffer (generate-new-buffer (format " *letter-freq-process-%d*" i))
                               :command (list "emacs" "--batch" "--eval" command)
                               :sentinel (lambda (proc _event)
                                           (when (eq (process-status proc) 'exit)
                                             (with-current-buffer (process-buffer proc)
                                               (let ((result (deserialize-hash-table (buffer-string))))
                                                 (maphash (lambda (key value)
                                                            (puthash key (+ value (gethash key results 0)) results))
                                                          result))
                                               (setq pending (1- pending))
                                               (when (= pending 0)
                                                 (setq final-result (combine-frequencies (list results)))
                                                 (let ((sorted-result nil))
                                                   (maphash (lambda (key value)
                                                              (push (list (char-to-string key) value) sorted-result))
                                                            final-result)
                                                   (setq sorted-result (sort sorted-result (lambda (a b) (string< (car a) (car b)))))
                                                   (setq final-result (apply 'append sorted-result))))))))))
                (push process processes)))))
        ;; Wait for all processes to finish
        (while (> pending 0)
          (sleep-for 0.1))
        final-result))))

(provide 'parallel-letter-frequency)
;;; parallel-letter-frequency.el ends here
