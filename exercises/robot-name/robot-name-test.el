;;; robot-name-test.el --- Tests for Robot Name (exercism)

;;; Commentary:

;; Ported pretty much directly from the xlisp version :)

;;; Code:

(require 'rx)

(load-file "robot-name.el")

(defvar *robbie* (build-robot))
(defvar *clutz*  (build-robot))

(defvar robot-name-re
  (rx string-start
      (= 2 upper-case)
      (= 3 digit)
      string-end))

(ert-deftest name-matches-expected-pattern ()
  (let ((name (robot-name *robbie*)))
    (should (string-match-p robot-name-re name))))

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
