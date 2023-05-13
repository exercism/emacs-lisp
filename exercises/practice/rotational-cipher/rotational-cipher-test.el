;;; rotational-cipher-test.el --- Rotational Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "rotational-cipher.el")
(declare-function rotate "rotational-cipher.el" (text shift-key))


(ert-deftest rotate-a-by-0-same-output-as-input ()
  ;; Function under test: rotate
  ;; Input: {"text":"a","shiftKey":0}
  ;; Expected: "a"
  (should (string= (rotate "a" 0) "a")))


(ert-deftest rotate-a-by-1 ()
  ;; Function under test: rotate
  ;; Input: {"text":"a","shiftKey":1}
  ;; Expected: "b"
  (should (string= (rotate "a" 1) "b")))


(ert-deftest rotate-a-by-26-same-output-as-input ()
  ;; Function under test: rotate
  ;; Input: {"text":"a","shiftKey":26}
  ;; Expected: "a"
  (should (string= (rotate "a" 26) "a")))


(ert-deftest rotate-m-by-13 ()
  ;; Function under test: rotate
  ;; Input: {"text":"m","shiftKey":13}
  ;; Expected: "z"
  (should (string= (rotate "m" 13) "z")))


(ert-deftest rotate-n-by-13-with-wrap-around-alphabet ()
  ;; Function under test: rotate
  ;; Input: {"text":"n","shiftKey":13}
  ;; Expected: "a"
  (should (string= (rotate "n" 13) "a")))


(ert-deftest rotate-capital-letters ()
  ;; Function under test: rotate
  ;; Input: {"text":"OMG","shiftKey":5}
  ;; Expected: "TRL"
  (should (string= (rotate "OMG" 5) "TRL")))


(ert-deftest rotate-spaces ()
  ;; Function under test: rotate
  ;; Input: {"text":"O M G","shiftKey":5}
  ;; Expected: "T R L"
  (should (string= (rotate "O M G" 5) "T R L")))


(ert-deftest rotate-numbers ()
  ;; Function under test: rotate
  ;; Input: {"text":"Testing 1 2 3 testing","shiftKey":4}
  ;; Expected: "Xiwxmrk 1 2 3 xiwxmrk"
  (should
   (string=
    (rotate "Testing 1 2 3 testing" 4) "Xiwxmrk 1 2 3 xiwxmrk")))


(ert-deftest rotate-punctuation ()
  ;; Function under test: rotate
  ;; Input: {"text":"Let's eat, Grandma!","shiftKey":21}
  ;; Expected: "Gzo'n zvo, Bmviyhv!"
  (should
   (string= (rotate "Let's eat, Grandma!" 21) "Gzo'n zvo, Bmviyhv!")))


(ert-deftest rotate-all-letters ()
  ;; Function under test: rotate
  ;; Input: {"text":"The quick brown fox jumps over the lazy dog.","shiftKey":13}
  ;; Expected: "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
  (should
   (string=
    (rotate
     "The quick brown fox jumps over the lazy dog." 13)
    "Gur dhvpx oebja sbk whzcf bire gur ynml qbt.")))


(provide 'rotational-cipher-test)
;;; rotational-cipher-test.el ends here
