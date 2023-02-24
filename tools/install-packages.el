(defun exercism//install-required-packages ()
  (require 'package)
  (package-initialize)
  (unless package-archive-contents
    (add-to-list
     'package-archives
     '("gnu" . "https://elpa.gnu.org/packages/")
     t)
    (add-to-list
     'package-archives
     '("melpa" . "https://melpa.org/packages/")
     t)
    (package-refresh-contents))
  (dolist (pkg '(mustache ht string-inflection))
    (unless (package-installed-p pkg)
      (package-install pkg))))
