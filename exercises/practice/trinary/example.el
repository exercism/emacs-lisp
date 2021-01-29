;;; trinary.el --- Trinary (exercism)

;;; Commentary:

;;; Code:
(require 'cl-lib)

(defun trinary-to-decimal (string)
  "Convert STRING from trinary to decimal.
If STRING is not a valid trinary number then return 0."
  (if (string-match-p "[^0-2]" string)
      0
    (let ((result 0))
      (dotimes (i (length string))
        (let ((digit (- (aref string i) ?0)))
          (setq result (+ (* result 3) digit))))
      result)))


(provide 'trinary)
;;; trinary.el ends here
