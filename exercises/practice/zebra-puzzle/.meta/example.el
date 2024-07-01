;;; zebra-puzzle.el --- Zebra Puzzle (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defvar all-houses nil)

(defvar house-constraints nil)

(defvar feasible-houses nil)

(defvar street-constraints nil)

(defvar two-house-constraints nil)

(defvar feasible-streets nil)

(defvar all-streets nil)

(defvar houses-by-number nil)

(cl-defstruct house
  number color owner pet drink hobby)

(setq all-houses
      (cl-loop for n in '(1 2 3 4 5)
               append (cl-loop for c in '(red green ivory yellow blue)
                               append (cl-loop for o in '(Englishman Spaniard Ukrainian Norwegian Japanese)
                                               append (cl-loop for p in '(dog snails fox horse zebra)
                                                               append (cl-loop for d in '(coffee tea milk orange-juice water)
                                                                               append (cl-loop for e in '(dancing painting reading football chess)
                                                                                               collect (make-house :number n :color c :owner o :pet p :drink d :hobby e))))))))

(setq house-constraints
      (list
       (lambda (h) (equal (equal (house-owner h) 'Englishman)
		     (equal (house-color h) 'red)))
       (lambda (h) (equal (equal (house-owner h) 'Spaniard)
		     (equal (house-pet h) 'dog)))
       (lambda (h) (equal (equal (house-drink h) 'coffee)
		     (equal (house-color h) 'green)))
       (lambda (h) (equal (equal (house-owner h) 'Ukrainian)
		     (equal (house-drink h) 'tea)))
       (lambda (h) (equal (equal (house-hobby h) 'dancing)
		     (equal (house-pet h) 'snails)))
       (lambda (h) (equal (equal (house-hobby h) 'painting)
		     (equal (house-color h) 'yellow)))
       (lambda (h) (equal (equal (house-drink h) 'milk)
		     (= (house-number h) 3)))
       (lambda (h) (equal (equal (house-owner h) 'Norwegian)
		     (= (house-number h) 1)))
       (lambda (h) (equal (equal (house-hobby h) 'football)
		     (equal (house-drink h) 'orange-juice)))
       (lambda (h) (equal (equal (house-owner h) 'Japanese)
		     (equal (house-hobby h) 'chess)))
       (lambda (h) (equal (= (house-number h) 2)
		     (equal (house-color h) 'blue)))
       (lambda (h) (if (equal (house-color h) 'green)
		  (not (= (house-number h) 1))
		t))
       (lambda (h) (if (equal (house-color h) 'ivory)
		  (not (= (house-number h) 5))
		t))))

(defun apply-constraints (constraints items)
  "Apply a list of CONSTRAINTS to a list of ITEMS."
  (cl-loop for constraint in constraints
           do (setq items (cl-remove-if-not constraint items))
           finally return items))

(setq feasible-houses
      (apply-constraints house-constraints all-houses))

(defun next-door? (h1 h2)
  "Check if two houses, H1 and H2, are next to each other."
  (= (abs (- (house-number h1) (house-number h2))) 1))

(setq two-house-constraints
      (list
       (lambda (h1 h2)
         (if (and (equal (house-color h1) 'green)
                  (equal (house-color h2) 'ivory))
             (= (house-number h1) (1+ (house-number h2)))
           t))
       (lambda (h1 h2)
         (if (and (equal (house-hobby h1) 'reading)
                  (equal (house-pet h2) 'fox))
             (next-door? h1 h2)
           t))
       (lambda (h1 h2)
         (if (and (equal (house-hobby h1) 'painting)
                  (equal (house-pet h2) 'horse))
             (next-door? h1 h2)
           t))))

(defun check-street (constraint street)
  "Check if all pairs of houses in STREET satisfy CONSTRAINT."
  (cl-loop for h1 in street
           always (cl-loop for h2 in street
                           always (funcall constraint h1 h2))))

(setq street-constraints
      (mapcar (lambda (c)
                (lambda (s) (check-street c s)))
              two-house-constraints))

(setq houses-by-number
      (cl-loop for n in '(1 2 3 4 5)
               collect (cl-remove-if-not (lambda (h) (= n (house-number h))) feasible-houses)))

(defun disjoint? (h1 h2)
  "Check if two houses, H1 and H2, are disjoint in terms of their attributes."
  (not (or (equal (house-color h1) (house-color h2))
           (equal (house-owner h1) (house-owner h2))
           (equal (house-pet h1) (house-pet h2))
           (equal (house-drink h1) (house-drink h2))
           (equal (house-hobby h1) (house-hobby h2)))))

(defun extends? (street h)
  "Check if a house, H, can be added to a STREET."
  (cl-every (lambda (h1) (disjoint? h h1)) street))

(defun build-streets (houses street)
  "Recursively build all possible STREET with HOUSES."
  (if (null houses)
      (list street)
    (cl-loop for h in (car houses)
             when (extends? street h)
             append (build-streets (cdr houses) (cons h street)))))

(setq all-streets
      (build-streets houses-by-number '()))

(setq feasible-streets
      (apply-constraints street-constraints all-streets))

(defun find-owner (condition)
  "Find the owner of a house based on a CONDITION."
  (if (= 1 (length feasible-streets))
      (cl-loop for h in (car feasible-streets)
               if (funcall condition h)
               return (house-owner h))
    nil))

(defun owns-zebra ()
  "Find the owner of the zebra."
  (find-owner (lambda (h) (equal (house-pet h) 'zebra))))

(defun drinks-water ()
  "Find the owner of the house where water is drunk."
  (find-owner (lambda (h) (equal (house-drink h) 'water))))

(provide 'zebra-puzzle)
;;; zebra-puzzle.el ends here
