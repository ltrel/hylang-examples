;; Functions are defined like this,
;; the argument(s) are always wrapped in a list
(defn fizzbuzz [max]
    ;; For takes a list with a variable name and an interable,
    ;; followed by a sequence of forms to evaluate
    (for [i (range 1 (+ max 1))]
        ;; Cond checks each condition one by one, like an if/elif chain.
        (cond
            ;; Strings in Hy must use double quotes
            [(not (% i 15)) (print "FizzBuzz")]
            [(not (% i 3)) (print "Fizz")]
            [(not (% i 5)) (print "Buzz")]
            [True (print i)])))

;; Define variables with setv
(setv max 100)
;; Functions are called with arguments separated by spaces
(fizzbuzz max)
