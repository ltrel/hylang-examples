(defn binary-search [arr x low high]
  ;; If statement takes a condition and two forms,
  ;; the first form is run when the condition is true,
  ;; the second form is run when the condition is false.
  (if (>= high low)
    ;; Do (progn in lisp) combines multiple forms into one
    (do
      (setv mid (// (+ high low) 2))
      (cond
        ;; List elements are accessed with (get list index)
        [(= (get arr mid) x) mid]
        [(> (get arr mid) x) (binary-search arr x low (- mid 1))]
        [True (binary-search arr x (+ mid 1) high)]))
    ;; Note that no return statements were neccesary.
    ;; This is because if statements return the form that was
    ;; executed and functions implicitly return their last form.
    -1))

(setv arr [3 6 7 10 14 19 21 25 36])
(setv low 0)
(setv high (- (len arr) 1))

(print arr)
(print f"The index of 7 is {(binary-search arr 7 low high)}")
(print f"The index of 14 is {(binary-search arr 14 low high)}")
(print f"The index of 36 is {(binary-search arr 36 low high)}")
(print f"The index of 1 is {(binary-search arr 1 low high)}")
