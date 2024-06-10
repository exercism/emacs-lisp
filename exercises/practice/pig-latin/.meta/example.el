;;; pig-latin.el --- Pig Latin (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defvar +vowels+ '("a" "e" "i" "o" "u" "xr" "yt"))

(defun custom-split-string (str)
  "Split STR into a list of words."
  (if (zerop (length str))
      nil
    (let* ((split-at (string-match " " str))
           (word (if split-at (substring str 0 split-at) str))
           (rest-str (if split-at (substring str (1+ split-at)) "")))
      (cons word (custom-split-string rest-str)))))

(defun starts-with-p (word search-list)
  "Check if WORD starts with any prefix in SEARCH-LIST."
  (if search-list
      (if (string-prefix-p (car search-list) word)
          t
        (starts-with-p word (cdr search-list)))))

(defun stop-p (word index)
  "Determine if processing should stop based on WORD and INDEX."
  (or (starts-with-p word +vowels+) 
      (and (char-equal ?y (aref word 0)) (= index 1))))

(defun take-consonants (word &optional index)
  "Calculate the number of consonants at the start of WORD.
INDEX is used to keep track of the current position."
  (unless index
    (setq index 0))
  (cond
   ((stop-p word index) index)
   ((starts-with-p word '("qu")) (take-consonants (substring word 2) (+ 2 index)))
   (t (take-consonants (substring word 1) (1+ index)))))

(defun translate-word (word)
  "Translate a single WORD into Pig Latin."
  (let ((index (take-consonants word)))
    (concat (substring word index) (substring word 0 index) "ay")))

(defun translate (phrase)
  "Translate a PHRASE into Pig Latin."
  (mapconcat #'translate-word (split-string phrase) " "))


(provide 'pig-latin)
;;; pig-latin.el ends here

