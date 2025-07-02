;;; dnd-character.el --- D&amp;D Character (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun modifier (score)
  (floor (- score 10) 2))


(defun ability ()
  (let ((rolls '()))
    (dotimes (_ 4)
      (push (+ 1 (random 6)) rolls))
    (apply '+ (cdr (sort rolls '<)))))

(defun generate-dnd-character ()
   (let ((constitution (ability)))
      (record 'dnd-character
              (ability)                         ; strength
              (ability)                         ; dexterity
              constitution                      ; constitution
              (ability)                         ; intelligence
              (ability)                         ; wisdom
              (ability)                         ; charisma
              (+ 10 (modifier constitution))))) ; hitpoints


(provide 'dnd-character)
;;; dnd-character.el ends here

