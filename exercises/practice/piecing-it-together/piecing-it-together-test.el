;;; piecing-it-together-test.el --- Tests for Piecing It Together (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "piecing-it-together.el")
(declare-function jigsaw-data "piecing-it-together.el" (partial))


(defun exercism/plist-equal-p (a b)
  (seq-set-equal-p (seq-partition a 2) (seq-partition b 2)))


(ert-deftest 1000-pieces-puzzle-with-1_6-aspect-ratio ()
  (let ((expected (list :pieces 1000 :border 126 :inside 874
                        :rows 25 :columns 40
                        :aspect-ratio 1.6 :format 'landscape))
        (actual (jigsaw-data (list :pieces 1000 :aspect-ratio 1.6))))
    (should (exercism/plist-equal-p expected actual))))


(ert-deftest square-puzzle-with-32-rows ()
  (let ((expected (list :pieces 1024 :border 124 :inside 900
                        :rows 32 :columns 32
                        :aspect-ratio 1.0 :format 'square))
        (actual (jigsaw-data (list :rows 32 :format 'square))))
    (should (exercism/plist-equal-p expected actual))))


(ert-deftest 400-pieces-square-puzzle-with-only-inside-pieces-and-aspect-ratio ()
  (let ((expected (list :pieces 400 :border 76 :inside 324
                        :rows 20 :columns 20
                        :aspect-ratio 1.0 :format 'square))
        (actual (jigsaw-data (list :inside 324 :aspect-ratio 1.0))))
    (should (exercism/plist-equal-p expected actual))))


(ert-deftest 1500-pieces-landscape-puzzle-with-30-rows-and-1_6-aspect-ratio ()
  (let ((expected (list :pieces 1500 :border 156 :inside 1344
                        :rows 30 :columns 50
                        :aspect-ratio 1.6666666666666667 :format 'landscape))
        (actual (jigsaw-data (list :rows 30 :aspect-ratio 1.6666666666666667))))
    (should (exercism/plist-equal-p expected actual))))


(ert-deftest 300-pieces-portrait-puzzle-with-70-border-pieces ()
  (let ((expected (list :pieces 300 :border 70 :inside 230
                        :rows 25 :columns 12
                        :aspect-ratio 0.48 :format 'portrait))
        (actual (jigsaw-data (list :pieces 300 :border 70 :format 'portrait))))
    (should (exercism/plist-equal-p expected actual))))


(ert-deftest puzzle-with-insufficient-data ()
  (let ((error-data
         (should-error (jigsaw-data (list :pieces 1500 :format 'landscape)))))
    (should
     (string= "Insufficient data" (error-message-string error-data)))))


(ert-deftest puzzle-with-contradictory-data ()
  (let ((error-data
         (should-error
          (jigsaw-data (list :rows 100 :columns 1000 :format 'square)))))
    (should
     (string= "Contradictory data" (error-message-string error-data)))))


(provide 'piecing-it-together-test)
;;; piecing-it-together-test.el ends here
