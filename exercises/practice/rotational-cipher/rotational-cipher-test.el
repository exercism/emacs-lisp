;;; rotational-cipher-test.el --- Rotational Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "rotational-cipher.el")
(declare-function rotate "rotational-cipher.el" (text shift-key))


(ert-deftest rotate-a-by-0-same-output-as-input ()
  (should (string= (rotate "a" 0) "a")))


(ert-deftest rotate-a-by-1 ()
  (should (string= (rotate "a" 1) "b")))


(ert-deftest rotate-a-by-26-same-output-as-input ()
  (should (string= (rotate "a" 26) "a")))


(ert-deftest rotate-m-by-13 ()
  (should (string= (rotate "m" 13) "z")))


(ert-deftest rotate-n-by-13-with-wrap-around-alphabet ()
  (should (string= (rotate "n" 13) "a")))


(ert-deftest rotate-capital-letters ()
  (should (string= (rotate "OMG" 5) "TRL")))


(ert-deftest rotate-spaces ()
  (should (string= (rotate "O M G" 5) "T R L")))


(ert-deftest rotate-numbers ()
  (should
   (string=
    (rotate "Testing 1 2 3 testing" 4) "Xiwxmrk 1 2 3 xiwxmrk")))


(ert-deftest rotate-punctuation ()
  (should
   (string= (rotate "Let's eat, Grandma!" 21) "Gzo'n zvo, Bmviyhv!")))


(ert-deftest rotate-all-letters ()
  (should
   (string=
    (rotate
     "The quick brown fox jumps over the lazy dog." 13)
    "Gur dhvpx oebja sbk whzcf bire gur ynml qbt.")))


(provide 'rotational-cipher-test)
;;; rotational-cipher-test.el ends here
