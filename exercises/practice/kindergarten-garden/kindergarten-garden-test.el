;;; kindergarten-garden-test.el --- Tests for Kindergarten Garden (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "kindergarten-garden.el")
(declare-function plants "kindergarten-garden.el" (diagram student))


(ert-deftest partial-garden-with-single-student ()
  (should (equal '("radishes" "clover" "grass" "grass") (plants "RC\nGG" "Alice"))))


(ert-deftest partial-garden-different-garden-with-single-student ()
  (should (equal '("violets" "clover" "radishes" "clover") (plants "VC\nRC" "Alice"))))


(ert-deftest partial-garden-with-two-students ()
  (should (equal '("clover" "grass" "radishes" "clover") (plants "VVCG\nVVRC" "Bob"))))


(ert-deftest partial-garden-multiple-students-for-the-same-garden-with-three-students-second-students-garden ()
  (should (equal '("clover" "clover" "clover" "clover") (plants "VVCCGG\nVVCCGG" "Bob"))))


(ert-deftest partial-garden-multiple-students-for-the-same-garden-with-three-students-third-students-garden ()
  (should (equal '("grass" "grass" "grass" "grass") (plants "VVCCGG\nVVCCGG" "Charlie"))))


(ert-deftest full-garden-for-alice-first-students-garden ()
  (should (equal '("violets" "radishes" "violets" "radishes") (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Alice"))))


(ert-deftest full-garden-for-bob-second-students-garden ()
  (should (equal '("clover" "grass" "clover" "clover") (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Bob"))))


(ert-deftest full-garden-for-charlie ()
  (should (equal '("violets" "violets" "clover" "grass") (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Charlie"))))


(ert-deftest full-garden-for-david ()
  (should (equal '("radishes" "violets" "clover" "radishes") (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "David"))))


(ert-deftest full-garden-for-eve ()
  (should (equal '("clover" "grass" "radishes" "grass") (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Eve"))))


(ert-deftest full-garden-for-fred ()
  (should (equal '("grass" "clover" "violets" "clover") (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Fred"))))


(ert-deftest full-garden-for-ginny ()
  (should (equal '("clover" "grass" "grass" "clover") (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Ginny"))))


(ert-deftest full-garden-for-harriet ()
  (should (equal '("violets" "radishes" "radishes" "violets") (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Harriet"))))


(ert-deftest full-garden-for-ileana ()
  (should (equal '("grass" "clover" "violets" "clover") (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Ileana"))))


(ert-deftest full-garden-for-joseph ()
  (should (equal '("violets" "clover" "violets" "grass") (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Joseph"))))


(ert-deftest full-garden-for-kincaid-second-to-last-students-garden ()
  (should (equal '("grass" "clover" "clover" "grass") (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Kincaid"))))


(ert-deftest full-garden-for-larry-last-students-garden ()
  (should (equal '("grass" "violets" "clover" "violets") (plants "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV" "Larry"))))


(provide 'kindergarten-garden-test)
;;; kindergarten-garden-test.el ends here
