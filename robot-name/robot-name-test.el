;;; robot-name-test.el --- Tests for Robot Name (exercism)

;;; Commentary:

;; Ported pretty much directly from the xlisp version :)

;;; Code:

(require 'cl)

(load-file "robot-name.el")

(defun is-upper-alpha-p (c)
  "Test if char C is an uppercase alpha char."
  (let ((c (string-to-char c))
        (A (string-to-char "A"))
        (Z (string-to-char "Z")))
    (<= A c Z)))

(defun is-digit-p (d)
  "Test if D is an integer from 0-9."
  (when (string-match "[[:digit:]]" d)
      (let ((d (string-to-char d)))
     (<= ?0 d ?9))))

(defvar *robbie* (build-robot))
(defvar *clutz*  (build-robot))

(ert-deftest name-matches-expected-pattern ()
  (let ((name (robot-name *robbie*)))
    (should (= (length name) 5))
    (should (every 'is-upper-alpha-p
                   (split-string-and-unquote (substring name 0 2) "")))
    (should (every 'is-digit-p
                   (split-string-and-unquote (substring name 2 5) "")))))

(ert-deftest name-is-persistent ()
  "Test that robot name is persistent."
  (should (equal (robot-name *robbie*) (robot-name *robbie*))))

(ert-deftest different-robots-have-different-names ()
  (should-not (equal (robot-name *robbie*) (robot-name *clutz*))))

(ert-deftest name-can-be-reset ()
  (let* ((robot (build-robot))
         (original-name (robot-name robot)))
    (reset-robot robot)
    (should-not (equal original-name (robot-name robot)))))

(provide 'robot-name-test)
;;; robot-name-test.el ends here
