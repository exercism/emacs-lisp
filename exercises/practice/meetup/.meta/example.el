;;; meetup.el --- Meetup (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'calendar)

(defconst +days-of-the-week+
  '((:sunday . 0)
    (:monday . 1)
    (:tuesday . 2)
    (:wednesday . 3)
    (:thursday . 4)
    (:friday . 5)
    (:saturday . 6)))

(defconst +schedules+
  '((:first . 1)
    (:second . 8)
    (:third . 15)
    (:teenth . 13)
    (:fourth . 22)
    (:last . -7)))

(defun last-day-of (month year)
  (calendar-last-day-of-month month year))

(defun find-dow-near-date (target-dow start-day month year direction)
  (let* ((direction-factor (if (eq direction :before) -1 1))
         (current-day start-day)
         (found-day nil))
    (while (and (not found-day)
                (<= 1 current-day (last-day-of month year)))
      (let ((current-dow (calendar-day-of-week (list month current-day year))))
        (when (= current-dow target-dow)
          (setq found-day current-day)))
      (setq current-day (+ current-day direction-factor)))
    (list year month found-day)))

(defun meetup (year month dayofweek schedule)
  (let* ((target-dow (cdr (assoc dayofweek +days-of-the-week+)))
         (first-day-of-month (calendar-day-of-week (list month 1 year)))
         (schedule-offset (cdr (assoc schedule +schedules+)))
         (first-target-dow (+ 1 (- target-dow first-day-of-month)))
         (first-occurrence (if (>= first-target-dow 1)
                               first-target-dow
                             (+ first-target-dow 7)))
         (start-day (cond
                     ((eq schedule :last)
                      (last-day-of month year))
                     ((eq schedule :teenth)
                      13)
                     (t
                      (+ first-occurrence (* (/ (1- schedule-offset) 7) 7))))))
    (if (eq schedule :last)
        (find-dow-near-date target-dow start-day month year :before)
      (find-dow-near-date target-dow start-day month year :after))))

(provide 'meetup)
;;; meetup.el ends here
