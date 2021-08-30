;;; etl.el --- etl Exercise (exercism)

;;; Commentary:

;;; Code:


(defun etl (data)
  (let ((rtn (make-hash-table)))
    (maphash (lambda (k v)
               (when (< k 0)
                 (error "Unexpected key value %s" k))
               (dolist (i v)
                 (when (not (stringp i))
                   (error "Non string value found %s" i))
                 (puthash (downcase i) k rtn)))
             data)
    rtn))


(provide 'etl)
;;; etl.el ends here
