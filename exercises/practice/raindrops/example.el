;;; raindrops.el --- Raindrops (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)



(defun convert (n)
  "Convert integer N to its raindrops string."
  (let ((drops "")
        (factors (cl-remove-if-not (lambda (v)
                                     (and (>= v 3) (<= v 7)))
                                   (prime-factors n))))
    (if (not (null factors))
        (progn
          (when (member 3 factors)
            (setq drops (concat drops "Pling")))
          (when (member 5 factors)
            (setq drops (concat drops "Plang")))
          (when (member 7 factors)
            (setq drops (concat drops "Plong"))))
      (setq drops (number-to-string n)))
    drops))


(defun prime-factors (n)
  "Return a list of prime factors of N."
  (let ((result-list nil)
        (n-original n))
    (if (and (integerp n) (> n 1))
        (let ((limit (/ n 2))
              (divisor 2))
          (while (<= divisor limit)
            (if (= 0 (% n divisor))
                (setq n (/ n divisor)
                      limit n
                      result-list (append result-list (list divisor)))
              (if (= divisor 2)
                  (setq divisor 3)
                (setq divisor (+ divisor 2)))))
          (if (null result-list)
              (setq result-list (list n-original)))))
    result-list))







(provide 'raindrops)
;;; raindrops.el ends here
