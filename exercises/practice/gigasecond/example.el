;;; gigasecond.el --- Gigasecond exercise (exercism)

;;; Commentary:
;; Calculate the date one gigasecond (10^9 seconds) from the
;; given date.
;;
;; NB: Pay attention to  Emacs' handling of time zones and dst
;; in the encode-time and decode-time functions.

;;; Code:

(defun from (second minute hour day month year)
  "Calculate gigasecond from date given.
Params are  SECOND, MINUTE, HOUR, DAY, MONTH, and YEAR."
  (let ((gigasecond (seconds-to-time (expt 10 9)))
        (start-date (encode-time second minute hour day month year t)))
    (set-time-zone-rule t)
    (let ((end-date (decode-time (time-add start-date gigasecond))))
      (butlast end-date (- (length end-date) 6)))))





(provide 'gigasecond)
;;; gigasecond.el ends here
