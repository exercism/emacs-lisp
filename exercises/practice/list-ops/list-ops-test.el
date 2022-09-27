;;; list-ops-test.el --- Tests for List Ops (exercism)

;;; Commentary:

;;; Code:

(load-file "list-ops.el")

;; TODO(FAP): add tests

(list-length '(4 309 4))

(list-map '(1 2 3 4 5) '1+)

(list-filter '(1 2 "a" 3) 'numberp)

(list-reverse '(1 2 3))
(list-append '(1 2 3) '(4 5 6))

(list-concatenate '(1 2 3) '(4 5 6) '(7 8 9) '(10))


(provide 'list-ops-test)
;;; list-ops-test.el ends here
