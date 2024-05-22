;;; dnd-character-test.el --- D&amp;D Character (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "dnd-character.el")
(declare-function modifier "dnd-character.el" (score))
(declare-function ability "dnd-character.el" ())
(declare-function generate-dnd-character "dnd-character.el" ())


(ert-deftest ability-modifier-for-score-3-is-negative-4 ()
  (should (= -4 (modifier 3))))


(ert-deftest ability-modifier-for-score-4-is-negative-3 ()
  (should (= -3 (modifier 4))))


(ert-deftest ability-modifier-for-score-5-is-negative-3 ()
  (should (= -3 (modifier 5))))


(ert-deftest ability-modifier-for-score-6-is-negative-2 ()
  (should (= -2 (modifier 6))))


(ert-deftest ability-modifier-for-score-7-is-negative-2 ()
  (should (= -2 (modifier 7))))


(ert-deftest ability-modifier-for-score-8-is-negative-1 ()
  (should (= -1 (modifier 8))))


(ert-deftest ability-modifier-for-score-9-is-negative-1 ()
  (should (= -1 (modifier 9))))


(ert-deftest ability-modifier-for-score-10-is-0 ()
  (should (= 0 (modifier 10))))


(ert-deftest ability-modifier-for-score-11-is-0 ()
  (should (= 0 (modifier 11))))


(ert-deftest ability-modifier-for-score-12-is-positive-1 ()
  (should (= 1 (modifier 12))))


(ert-deftest ability-modifier-for-score-13-is-positive-1 ()
  (should (= 1 (modifier 13))))


(ert-deftest ability-modifier-for-score-14-is-positive-2 ()
  (should (= 2 (modifier 14))))


(ert-deftest ability-modifier-for-score-15-is-positive-2 ()
  (should (= 2 (modifier 15))))


(ert-deftest ability-modifier-for-score-16-is-positive-3 ()
  (should (= 3 (modifier 16))))


(ert-deftest ability-modifier-for-score-17-is-positive-3 ()
  (should (= 3 (modifier 17))))


(ert-deftest ability-modifier-for-score-18-is-positive-4 ()
  (should (= 4 (modifier 18))))


(defun valid-range-p (score)
  (and (<= 3 score) (>= 18 score)))

(ert-deftest random-ability-is-within-range ()
  (should (valid-range-p (ability))))


(ert-deftest random-character-is-valid ()
   (let* ((dnd-char (generate-dnd-character))
          (strength (aref dnd-char 1))
          (dexterity (aref dnd-char 2))
          (constitution (aref dnd-char 3))
          (intelligence (aref dnd-char 4))
          (wisdom (aref dnd-char 5))
          (charisma (aref dnd-char 6))
          (hitpoints (aref dnd-char 7)))
      (should (and (recordp dnd-char)
                   (valid-range-p strength)
                   (valid-range-p dexterity)
                   (valid-range-p constitution)
                   (valid-range-p intelligence)
                   (valid-range-p wisdom)
                   (valid-range-p charisma)))))


(provide 'dnd-character-test)
;;; dnd-character-test.el ends here

