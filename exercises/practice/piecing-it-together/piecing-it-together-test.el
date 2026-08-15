;;; piecing-it-together-test.el --- Tests for Piecing It Together (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "piecing-it-together.el")
(declare-function jigsaw-data "piecing-it-together.el" (partial))


(ert-deftest 1000-pieces-puzzle-with-1.6-aspect-ratio ()
  (let ((expected (list :pieces 1000 :border 126 :inside 874
                        :rows 25 :columns 40
                        :aspect-ratio 1.6 :format 'landscape))
        (actual (jigsaw-data (list :pieces 1000 :aspect-ratio 1.6))))
    (dolist (key (list :pieces :border :inside :rows
                       :columns :aspect-ratio :format))
      (should (equal (plist-get expected key)
                     (plist-get actual key))))))


(ert-deftest square-puzzle-with-32-rows ()
  (let ((expected (list :pieces 1024 :border 124 :inside 900
                        :rows 32 :columns 32
                        :aspect-ratio 1.0 :format 'square))
        (actual (jigsaw-data (list :rows 32 :format 'square))))
    (dolist (key (list :pieces :border :inside :rows
                       :columns :aspect-ratio :format))
      (should (equal (plist-get expected key)
                     (plist-get actual key))))))


(ert-deftest 400-pieces-square-puzzle-with-only-inside-pieces-and-aspect-ratio ()
  (let ((expected (list :pieces 400 :border 76 :inside 324
                        :rows 20 :columns 20
                        :aspect-ratio 1.0 :format 'square))
        (actual (jigsaw-data (list :inside 324 :aspect-ratio 1.0))))
    (dolist (key (list :pieces :border :inside :rows
                       :columns :aspect-ratio :format))
      (should (equal (plist-get expected key)
                     (plist-get actual key))))))


(ert-deftest 1500-pieces-landscape-puzzle-with-30-rows-and-1.6-aspect-ratio ()
  (let ((expected (list :pieces 1500 :border 156 :inside 1344
                        :rows 30 :columns 50
                        :aspect-ratio 1.6666666666666667 :format 'landscape))
        (actual (jigsaw-data (list :rows 30 :aspect-ratio 1.6666666666666667))))
    (dolist (key (list :pieces :border :inside :rows
                       :columns :aspect-ratio :format))
      (should (equal (plist-get expected key)
                     (plist-get actual key))))))


(ert-deftest 300-pieces-portrait-puzzle-with-70-border-pieces ()
  (let ((expected (list :pieces 300 :border 70 :inside 230
                        :rows 25 :columns 12
                        :aspect-ratio 0.48 :format 'portrait))
        (actual (jigsaw-data (list :pieces 300 :border 70 :format 'portrait))))
    (dolist (key (list :pieces :border :inside :rows
                       :columns :aspect-ratio :format))
      (should (equal (plist-get expected key)
                     (plist-get actual key))))))


(ert-deftest puzzle-with-insufficient-data ()
  (should-error (jigsaw-data (list :pieces 1500 :format 'landscape))))


(ert-deftest puzzle-with-contradictory-data ()
  (should-error (jigsaw-data (list :rows 100 :columns 1000 :format 'square))))


(provide 'piecing-it-together-test)
;;; piecing-it-together-test.el ends here
