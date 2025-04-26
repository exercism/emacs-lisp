;;; phone-number.el --- phone-number Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

(define-error 'short-phone-num-error "must not be fewer than 10 digits")
(define-error 'long-phone-num-error "must not be greater than 11 digits")
(define-error 'letters-in-phone-num-error "letters not permitted")
(define-error 'punctuations-in-phone-num-error "punctuations not permitted")
(define-error 'country-code-error "country code must be 1")
(define-error 'area-code-starting-with-0-error "area code cannot start with zero")
(define-error 'area-code-starting-with-1-error "area code cannot start with one")
(define-error 'exchange-code-starting-with-0-error "exchange code cannot start with zero")
(define-error 'exchange-code-starting-with-1-error "exchange code cannot start with one")

(defun char-digit-p (x)
  (<= ?0 x ?9))

(defun char-lowercase-p (x)
  (<= ?a x ?z))

(defun char-uppercase-p (x)
  (<= ?A x ?Z))

(defun char-alphabetic-p (x)
  (or (char-lowercase-p x)
      (char-uppercase-p x)))

(defun char-punctuation-p (x)
  (or (<= 33 x 39)
      (= x 42)
      (= x 44)
      (= x 47)
      (<= 58 x 64)
      (<= 91 x 96)
      (<= 123 x 126)))

(defun negate (pred)
  (lambda (&rest args) (apply pred args)))

(defun string-remove (s pred)
  (let* ((n (length s))
         (to-str (make-string n ?\0))
         (k 0))
    (dotimes (i n)
      (let ((x (aref s i)))
        (when (funcall pred x)
          (setf (aref to-str k) x)
          (cl-incf k))))
    (substring to-str 0 k)))

(defun numbers (num)
  "Converts a num string into a string of digits."
  (cond
   ((cl-find-if #'char-alphabetic-p num)
    (signal 'letters-in-phone-num-error num))
   ((cl-find-if #'char-punctuation-p num)
    (signal 'punctuations-in-phone-num-error num)))
  (let* ((digits (string-remove num (negate #'char-digit-p)))
         (n (length digits)))
    (cond
     ((< n 10) (signal 'short-phone-num-error num))
     ((> n 11) (signal 'long-phone-num-error num)))
    (if (= n 11)
        (if (= (aref digits 0) ?1)
            (setf digits (substring digits 1))
          (signal 'country-code-error num)))
    (let ((y (aref digits 0)))
      (cond
       ((= y ?0)
        (signal 'area-code-starting-with-0-error num))
       ((= y ?1)
        (signal 'area-code-starting-with-1-error num)))
    (let ((y (aref digits 3)))
      (cond
       ((= y ?0)
        (signal 'exchange-code-starting-with-0-error num))
       ((= y ?1)
        (signal 'exchange-code-starting-with-1-error num)))))
    digits))
    
(defun area-code (num)
  (let ((digits (numbers num)))
    (substring digits 0 3)))

(defun pprint (num)
  (let ((digits (numbers num)))
    (format "(%s) %s-%s" (substring digits 0 3)
            (substring digits 3 6)
            (substring digits 6 10))))


(provide 'phone-number)
;;; phone-number.el ends here
