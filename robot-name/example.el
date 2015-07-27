;;; robot-name.el --- Robot Name (exercism)

;;; Commentary:
;;
;; Build a robot with a name like AA000, that can be reset
;; to a new name. Instructions are in README.md
;;

;;; Code:

(defun rand-alpha-char ()
  "Return a random alphabetic character as a string."
  (let* ((char-list (number-sequence ?A ?Z))
         (char-int (nth (random (length char-list)) char-list)))
    (string char-int)))

(defun rand-digit-char ()
  "Return a random digit [0-9] as a string."
  (int-to-string (random 10)))

(defun random-robot-name ()
  "Create a random robot name with 2 alpha chars and 3 digits."
  (concat (rand-alpha-char)
          (rand-alpha-char)
          (rand-digit-char)
          (rand-digit-char)
          (rand-digit-char)))

(defun build-robot ()
  "Build a new robot with a random name."
  (let ((new-robot (make-hash-table :test 'equal)))
    (puthash "name" (random-robot-name) new-robot)
    new-robot))

(build-robot)

(defun robot-name (robot)
  "Get the ROBOT's name."
  (gethash "name" robot))

(defun reset-robot (robot)
  "Reset the name of ROBOT.  Factory reset!"
  (setf robot (puthash "name" (random-robot-name) robot))
  robot)


(provide 'robot-name)
;;; robot-name.el ends here
