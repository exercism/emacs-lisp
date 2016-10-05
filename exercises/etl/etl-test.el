;;; etl-test.el --- Tests for etl (exercism)

;;; Commentary:

;;; Code:

(load-file "etl.el")


(defconst mixed-case-input #s(hash-table
                              data (1 ("a" "E" "I" "o" "U" "L" "N" "r" "s" "T")
                                      2 ("D" "G")
                                      3 ("B" "c" "M" "P")
                                      4 ("f" "h" "V" "W" "y")
                                      5 ("K")
                                      8 ("J" "x")
                                      10 ("q" "z"))))


(defconst mixed-case-expected #s(hash-table
                                 data ("a" 1 
                                        "b" 3
                                        "c" 3
                                        "d" 2
                                        "e" 1
                                        "f" 4
                                        "g" 2
                                        "h" 4
                                        "i" 1 
                                        "j" 8
                                        "k" 5
                                        "l" 1
                                        "m" 3
                                        "n" 1
                                        "o" 1
                                        "p" 3
                                        "q" 10
                                        "r" 1
                                        "s" 1
                                        "t" 1 
                                        "u" 1
                                        "v" 4
                                        "x" 8
                                        "w" 4
                                        "y" 4
                                        "z" 10)))
  

(defconst negative-keys-input #s(hash-table
                                 data (1 ("L" "N")
                                         -3 ("B" "c" "P"))))


(defconst listof-chars-input #s(hash-table
                                data (1 (?N ?r ?q))))


(defun hash->list (hash)
  (let (lst)
    (maphash (lambda (k v) (push (cons k v) lst)) hash)
    lst))


(defun sort-pairs (lst fn)
  (sort lst (lambda (a b) (funcall fn (car a) (car b)))))


(defun hash-equal (a b fn)
  (equal (sort-pairs (hash->list a) fn)
         (sort-pairs (hash->list b) fn)))


(ert-deftest empty-hash-test ()
  (should (zerop (hash-table-count (etl (make-hash-table))))))


(ert-deftest mixed-case-test ()
  (should (hash-equal (etl mixed-case-input) mixed-case-expected 'string<)))


(ert-deftest negative-key-test ()
  (should-error (etl negative-keys-input)))


(ert-deftest list-of-non-string-values-test ()
  (should-error (etl listof-chars-input)))


(provide 'etl)
;;; etl-test.el ends here
