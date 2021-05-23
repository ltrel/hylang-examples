;; This is a simplified quick sort implementation,
;; it does not modify the array in place.
(defn quicksort-simple [arr]
  ;; Zero and one element arrays are always sorted
  (if (<= (len arr) 1) (return arr))
  ;; This example selects the middle element as the pivot
  (setv pivot   (get arr (// (len arr) 2))
        ;; lfor is the Hy equivalent of list comprehensions,
        ;; this one is the same as [x for x in arr if x < pivot]
        lesser  (lfor x arr :if (< x pivot) x)
        greater (lfor x arr :if (> x pivot) x))
  (+ (quicksort-simple lesser) [pivot] (quicksort-simple greater)))

;;; Traditional in place quick sort
(defmacro swap-elements [arr a b]
  ;; This macro uses quasiquoting to return code that swaps the
  ;; elements at index a and b in arr, removing the need for writing
  ;; the long setv expression manually every time a swap is needed.
  `(setv [(get ~arr ~a) (get ~arr ~b)]
         [(get ~arr ~b) (get ~arr ~a)]))

(defn partition [arr low high]
  (setv pivot (get arr high))
  (setv i (- low 1))
  (for [j (range low high)]
    (when (<= (get arr j) pivot)
      (+= i 1)
      (swap-elements arr i j)))
  (swap-elements arr (+ i 1) high)
  (+ i 1))

(defn quicksort-trad [arr low high]
  (when (< low high)
    (setv partition-index (partition arr low high))
    (quicksort-trad arr low (- partition-index 1))
    (quicksort-trad arr (+ partition-index 1) high)))

(setv arr [2 6 3 14 19 5 1 7])
(print "Simplified Implementation:")
(print f"Original Array: {arr}")
(print f"Sorted Array:   {(quicksort-simple arr)}")

(setv arr [2 6 3 14 19 5 1 7])
(print "Traditional Implementation:")
(print f"Original Array: {arr}")
(quicksort-trad arr 0 (- (len arr) 1))
(print f"Sorted Array:   {arr}")