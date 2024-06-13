;;; circular-buffer-test.el --- Circular Buffer (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(require 'eieio)

(load-file "circular-buffer.el")

(defun create-test-buffer (capacity)
  "Helper function to create a circular buffer with the given capacity."
  (circular-buffer :capacity capacity))

(ert-deftest reading-empty-buffer-should-fail ()
  (let ((buf (create-test-buffer 1)))
    (should-error (read-buff buf) :type 'empty-buffer-error)))


(ert-deftest can-read-an-item-just-written ()
  (let ((buf (create-test-buffer 1)))
    (write buf 1)
    (should (equal (read-buff buf) 1))))


(ert-deftest each-item-may-only-be-read-once ()
  (let ((buf (create-test-buffer 1)))
    (write buf 1)
    (should (equal (read-buff buf) 1))
    (should-error (read-buff buf) :type 'empty-buffer-error)))


(ert-deftest items-are-read-in-the-order-they-are-written ()
  (let ((buf (create-test-buffer 2)))
    (write buf 1)
    (write buf 2)
    (should (equal (read-buff buf) 1))
    (should (equal (read-buff buf) 2))))


(ert-deftest full-buffer-cant-be-written-to ()
  (let ((buf (create-test-buffer 1)))
    (write buf 1)
    (should-error (write buf 2) :type 'full-buffer-error)))


(ert-deftest a-read-frees-up-capacity-for-another-write ()
  (let ((buf (create-test-buffer 1)))
    (write buf 1)
    (should (equal (read-buff buf) 1))
    (write buf 2)
    (should (equal (read-buff buf) 2))))


(ert-deftest read-position-is-maintained-even-across-multiple-writes ()
  (let ((buf (create-test-buffer 3)))
    (write buf 1)
    (write buf 2)
    (should (equal (read-buff buf) 1))
    (write buf 3)
    (should (equal (read-buff buf) 2))
    (should (equal (read-buff buf) 3))))


(ert-deftest items-cleared-out-of-buffer-cant-be-read ()
  (let ((buf (create-test-buffer 1)))
    (write buf 1)
    (clear buf)
    (should-error (read-buff buf) :type 'empty-buffer-error)))


(ert-deftest clear-frees-up-capacity-for-another-write ()
  (let ((buf (create-test-buffer 1)))
    (write buf 1)
    (clear buf)
    (write buf 2)
    (should (equal (read-buff buf) 2))))


(ert-deftest clear-does-nothing-on-empty-buffer ()
  (let ((buf (create-test-buffer 1)))
    (clear buf)
    (write buf 1)
    (should (equal (read-buff buf) 1))))


(ert-deftest overwrite-acts-like-write-on-non-full-buffer ()
  (let ((buf (create-test-buffer 2)))
    (write buf 1)
    (overwrite buf 2)
    (should (equal (read-buff buf) 1))
    (should (equal (read-buff buf) 2))))


(ert-deftest overwrite-replaces-the-oldest-item-on-full-buffer ()
  (let ((buf (create-test-buffer 2)))
    (write buf 1)
    (write buf 2)
    (overwrite buf 3)
    (should (equal (read-buff buf) 2))
    (should (equal (read-buff buf) 3))))


(ert-deftest overwrite-replaces-the-oldest-item-remaining-in-buffer-following-a-read ()
  (let ((buf (create-test-buffer 3)))
    (write buf 1)
    (write buf 2)
    (write buf 3)
    (should (equal (read-buff buf) 1))
    (write buf 4)
    (overwrite buf 5)
    (should (equal (read-buff buf) 3))
    (should (equal (read-buff buf) 4))
    (should (equal (read-buff buf) 5))))


(ert-deftest initial-clear-does-not-affect-wrapping-around ()
  (let ((buf (create-test-buffer 2)))
    (clear buf)
    (write buf 1)
    (write buf 2)
    (overwrite buf 3)
    (overwrite buf 4)
    (should (equal (read-buff buf) 3))
    (should (equal (read-buff buf) 4))
    (should-error (read-buff buf) :type 'empty-buffer-error)))


(provide 'circular-buffer-test)
;;; circular-buffer-test.el ends here

