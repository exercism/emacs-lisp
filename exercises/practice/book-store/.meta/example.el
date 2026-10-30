;;; book-store.el --- Book Store (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun total (basket)
  (let ((tally (make-vector 6 0)))
    (cl-loop for book in basket
      do (aset tally book (1+ (aref tally book))))
    (sort tally #'<)
    (cl-loop for book from 5 downto 1
      do (aset tally book (- (aref tally book) (aref tally (1- book)))))

    (let* ((one (aref tally 5))
           (two (aref tally 4))
           (three (aref tally 3))
           (four (aref tally 2))
           (five (aref tally 1))
           (adjustment (min three five)))
      (setq three (- three adjustment))
      (setq five (- five adjustment))
      (setq four (+ four adjustment adjustment))
      (+ (* 800 one) (* 1520 two) (* 2160 three) (* 2560 four) (* 3000 five)))))


(provide 'book-store)
;;; book-store.el ends here

