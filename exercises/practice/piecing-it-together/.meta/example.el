;;; piecing-it-together.el --- Piecing It Together (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun determine-format (columns rows)
  (cond ((< columns rows) 'portrait)
        ((> columns rows) 'landscape)
        (t 'square)))

(defun jigsaw-data (partial)
  (let ((required-pieces (plist-get partial :pieces))
        (required-border (plist-get partial :border))
        (required-inside (plist-get partial :inside))
        (required-rows (plist-get partial :rows))
        (required-columns (plist-get partial :columns))
        (required-aspect-ratio (plist-get partial :aspect-ratio))
        (required-format (plist-get partial :format))
        (result nil))
    (cl-loop for rows from 2 to 250 do
      (cl-loop for columns from 2 to 250 do
        (let ((pieces (* rows columns))
              (border (+ rows columns rows columns -4))
              (inside (* (- rows 2) (- columns 2)))
              (aspect-ratio (/ (float columns) rows))
              (format (determine-format columns rows)))
          (when (and (or (null required-pieces)
                         (equal pieces required-pieces))
                     (or (null required-border)
                         (equal border required-border))
                     (or (null required-inside)
                         (equal inside required-inside))
                     (or (null required-rows)
                         (equal rows required-rows))
                     (or (null required-columns)
                         (equal columns required-columns))
                     (or (null required-aspect-ratio)
                         (equal aspect-ratio required-aspect-ratio))
                     (or (null required-format)
                         (equal format required-format)))
            (unless (null result)
              (error "Insufficient data"))
            (setq result (list :pieces pieces :border border :inside inside
                               :rows rows :columns columns
                               :aspect-ratio aspect-ratio :format format))))))
    (when (null result)
      (error "Contradictory data"))
    result))

(provide 'piecing-it-together)
;;; piecing-it-together.el ends here
