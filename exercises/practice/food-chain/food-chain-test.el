;;; food-chain-test.el --- Food Chain (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "food-chain.el")
(declare-function recite "food-chain.el" (start-verse end-verse))


(ert-deftest fly ()
  (let ((expected '("I know an old lady who swallowed a fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die.")))
    (should (equal (recite 1 1) expected))))

(ert-deftest spider ()
  (let ((expected '("I know an old lady who swallowed a spider."
                    "It wriggled and jiggled and tickled inside her."
                    "She swallowed the spider to catch the fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die.")))
    (should (equal (recite 2 2) expected))))


(ert-deftest bird ()
  (let ((expected '("I know an old lady who swallowed a bird."
                    "How absurd to swallow a bird!"
                    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."
                    "She swallowed the spider to catch the fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die.")))
    (should (equal (recite 3 3) expected))))


(ert-deftest cat ()
  (let ((expected '("I know an old lady who swallowed a cat."
                    "Imagine that, to swallow a cat!"
                    "She swallowed the cat to catch the bird."
                    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."
                    "She swallowed the spider to catch the fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die.")))
    (should (equal (recite 4 4) expected))))


(ert-deftest dog ()
  (let ((expected '("I know an old lady who swallowed a dog."
                    "What a hog, to swallow a dog!"
                    "She swallowed the dog to catch the cat."
                    "She swallowed the cat to catch the bird."
                    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."
                    "She swallowed the spider to catch the fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die.")))
    (should (equal (recite 5 5) expected))))


(ert-deftest goat ()
  (let ((expected '("I know an old lady who swallowed a goat."
                    "Just opened her throat and swallowed a goat!"
                    "She swallowed the goat to catch the dog."
                    "She swallowed the dog to catch the cat."
                    "She swallowed the cat to catch the bird."
                    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."
                    "She swallowed the spider to catch the fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die.")))
    (should (equal (recite 6 6) expected))))


(ert-deftest cow ()
  (let ((expected '("I know an old lady who swallowed a cow."
                    "I don't know how she swallowed a cow!"
                    "She swallowed the cow to catch the goat."
                    "She swallowed the goat to catch the dog."
                    "She swallowed the dog to catch the cat."
                    "She swallowed the cat to catch the bird."
                    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."
                    "She swallowed the spider to catch the fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die.")))
    (should (equal (recite 7 7) expected))))


(ert-deftest horse ()
  (let ((expected '("I know an old lady who swallowed a horse."
                    "She's dead, of course!")))
    (should (equal (recite 8 8) expected))))


(ert-deftest multiple-verses ()
  (let ((expected '("I know an old lady who swallowed a fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die."
                    ""
                    "I know an old lady who swallowed a spider."
                    "It wriggled and jiggled and tickled inside her."
                    "She swallowed the spider to catch the fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die."
                    ""
                    "I know an old lady who swallowed a bird."
                    "How absurd to swallow a bird!"
                    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."
                    "She swallowed the spider to catch the fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die.")))
    (should (equal (recite 1 3) expected))))


(ert-deftest full-song ()
  (let ((expected '("I know an old lady who swallowed a fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die."
                    ""
                    "I know an old lady who swallowed a spider."
                    "It wriggled and jiggled and tickled inside her."
                    "She swallowed the spider to catch the fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die."
                    ""
                    "I know an old lady who swallowed a bird."
                    "How absurd to swallow a bird!"
                    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."
                    "She swallowed the spider to catch the fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die."
                    ""
                    "I know an old lady who swallowed a cat."
                    "Imagine that, to swallow a cat!"
                    "She swallowed the cat to catch the bird."
                    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."
                    "She swallowed the spider to catch the fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die."
                    ""
                    "I know an old lady who swallowed a dog."
                    "What a hog, to swallow a dog!"
                    "She swallowed the dog to catch the cat."
                    "She swallowed the cat to catch the bird."
                    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."
                    "She swallowed the spider to catch the fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die."
                    ""
                    "I know an old lady who swallowed a goat."
                    "Just opened her throat and swallowed a goat!"
                    "She swallowed the goat to catch the dog."
                    "She swallowed the dog to catch the cat."
                    "She swallowed the cat to catch the bird."
                    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."
                    "She swallowed the spider to catch the fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die."
                    ""
                    "I know an old lady who swallowed a cow."
                    "I don't know how she swallowed a cow!"
                    "She swallowed the cow to catch the goat."
                    "She swallowed the goat to catch the dog."
                    "She swallowed the dog to catch the cat."
                    "She swallowed the cat to catch the bird."
                    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."
                    "She swallowed the spider to catch the fly."
                    "I don't know why she swallowed the fly. Perhaps she'll die."
                    ""
                    "I know an old lady who swallowed a horse."
                    "She's dead, of course!")))
    (should (equal (recite 1 8) expected))))


(provide 'food-chain-test)
;;; food-chain-test.el ends here
