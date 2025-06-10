;;; parallel-letter-frequency.el --- Parallel Letter Frequency (exercism) -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)


(defun clean-text (text)
  (downcase (replace-regexp-in-string "[^[:alpha:]]" "" text)))


(defun combine-frequencies (freqs-list)
  (let ((combined-freqs (make-hash-table :test 'equal)))
    (dolist (freqs freqs-list)
      (maphash (lambda (key value)
                 (puthash key (+ value (gethash key combined-freqs 0)) combined-freqs))
               freqs))
    combined-freqs))


(defun calculate-frequencies (texts)
    (let ((cleaned-texts (mapcar #'clean-text texts)))
    (if (cl-every #'string-empty-p cleaned-texts)
        (make-hash-table :test 'equal)
      (let* ((num-processes (min (length cleaned-texts) 8 (max 1 (string-to-number (shell-command-to-string "nproc")))))
             (texts-per-process (ceiling (/ (float (length cleaned-texts)) num-processes)))
             (results (make-hash-table :test 'equal))
             (pending num-processes)
             (final-result (make-hash-table :test 'equal))
             (processes nil))
        (dotimes (i num-processes)
          (let* ((start-index (* i texts-per-process))
                 (end-index (min (* (1+ i) texts-per-process) (length cleaned-texts)))
                 (process-texts (if (< start-index (length cleaned-texts))
                                    (cl-subseq cleaned-texts start-index end-index)
                                  '())))
            (when (not (null process-texts))
              (let* ((command (prin1-to-string `(calculate-frequencies-in-subprocess ',process-texts)))
                     (process (make-process
                               :name (format "letter-freq-process-%d" i)
                               :buffer (generate-new-buffer (format " *letter-freq-process-%d*" i))
                               :command (list "emacs" "--batch" "-l" "parallel-letter-frequency.el" "--eval" command)
                               :sentinel (lambda (proc _event)
                                           (when (eq (process-status proc) 'exit)
                                             (with-current-buffer (process-buffer proc)
                                               (let ((result (read (buffer-string))))
                                                 (maphash (lambda (key value)
                                                            (puthash key (+ value (gethash key results 0)) results))
                                                          result))
                                               (setq pending (1- pending))
                                               (when (= pending 0)
                                                 (setq final-result (combine-frequencies (list results))))))))))
                (push process processes)))))
        (while (> pending 0)
          (sleep-for 0.1))
        final-result))))


(defun calculate-frequencies-in-subprocess (texts)
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
    (prin1 freqs)))


(provide 'parallel-letter-frequency)
;;; parallel-letter-frequency.el ends here
