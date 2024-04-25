;;; eliuds-eggs.el --- Eliud's Eggs (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun egg-count (number)
  (let ((eggs 0))
    (while (> number 0)
      (setq eggs (+ eggs (% number 2))
            number (truncate number 2)))
    eggs))


(provide 'eliuds-eggs)
;;; eliuds-eggs.el ends here

