;;; say.el --- Say (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(define-error 'out-of-range "input out of range")

(defun say (number)
  (when (or (< number 0) (>= number (expt 10 12)))
    (signal 'out-of-range 'nil))
  (let ((ones '("zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"))
        (teens '("ten" "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen"))
        (tens '("" "" "twenty" "thirty" "forty" "fifty" "sixty" "seventy" "eighty" "ninety"))
        (powers '("" "thousand" "million" "billion")))

    (cl-labels
      ((number-to-words (n)
        (let ((parts '()))
          (while (> n 0)
            (let* ((power (if (> n 999999999) 3 (if (> n 999999) 2 (if (> n 999) 1 0))))
              (unit (expt 1000 power))
              (quotient (/ n unit))
              (remainder (% n unit)))
            (if (> quotient 0)
              (push (concat (number-to-words-1000 quotient) (if (> power 0) (concat " " (nth power powers)) "")) parts))
            (setq n remainder)))
          (string-join (reverse parts) " ")))

      (number-to-words-1000 (n)
        (cond
          ((< n 10) (nth n ones))
          ((< n 20) (nth (- n 10) teens))
          ((< n 100)
            (let ((ten (nth (/ n 10) tens))
              (one (nth (% n 10) ones)))
            (if (= (% n 10) 0)
              ten
              (concat ten "-" one))))
          ((< n 1000)
            (let ((hundred (nth (/ n 100) ones))
              (remainder (% n 100)))
            (if (= remainder 0)
              (concat hundred " hundred")
              (concat hundred " hundred " (number-to-words-1000 remainder))))))))

      (when (and (>= number 0) (< number (expt 10 12)))
        (if (= number 0)
          "zero"
          (string-trim (number-to-words number)))))))

(provide 'say)
;;; say.el ends here

