;;; high-scores.el --- High Scores (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun latest (scores)
  (car (last scores)))

(defun personal-best (scores)
  (apply #'max scores))

(defun personal-top-three (scores)
  (take 3 (sort scores :lessp #'>)))


(provide 'high-scores)
;;; high-scores.el ends here

