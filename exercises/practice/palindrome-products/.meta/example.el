;;; palindrome-products.el --- Palindrome Products (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)


(defun is-palindrome (n)
  (if (= 0 (% n 10))
    (= 0 n)
    (let ((acc 0)
          (digit 0))
      (cl-loop while (< acc n)
               do (setq digit (% n 10))
               do (setq n (/ n 10))

               when (= acc n)
               do (cl-return t)

               do (setq acc (+ (* 10 acc) digit))

               when (= acc n)
               do (cl-return t)

               finally return nil))))


(defun smallest (min-factor max-factor)
  (when (< max-factor min-factor)
    (error "min must be <= max"))

  (let ((value nil)
        (factors nil))
    (cl-loop for first from min-factor to max-factor
      do (cl-loop for second from first to max-factor
                  for product = (* first second)

                  do (if (and value (< value product)) (cl-return))

                  when (is-palindrome product)
                  do (cond ((or (null factors) (< product value))
                            (setq value product)
                            (setq factors `((,first ,second))))
                           ((= product value)
                            (push `(,first ,second) factors)))))
    (list :value value :factors (reverse factors))))


(defun largest (min-factor max-factor)
  (when (< max-factor min-factor)
    (error "min must be <= max"))

  (let ((value nil)
        (factors nil))
    (cl-loop for second from max-factor downto min-factor
      do (cl-loop for first from second downto min-factor
                  for product = (* first second)

                  do (if (and value (< product value)) (cl-return))

                  when (is-palindrome product)
                  do (cond ((or (null factors) (< value product))
                            (setq value product)
                            (setq factors `((,first ,second))))
                           ((= product value)
                            (push `(,first ,second) factors)))))
    (list :value value :factors (reverse factors))))


(provide 'palindrome-products)
;;; palindrome-products.el ends here

