;;; hello-world.el --- Hello World Exercise (exercism)

;;; Commentary:

;;; Code:

(defun hello (&optional name)
  "Say hello, optionally to NAME."
  (let ((greetee (or name "World")))
    (concat "Hello, " greetee "!")))

(provide 'hello-world)
;;; hello-world.el ends here
