;; This is a simplified quick sort implementation,
;; it does not modify the array in place.
(defn quicksort [arr]
  ;; Zero and one element arrays are always sorted
  (if (<= (len arr) 1) (return arr))
  ;; This example selects the middle element as the pivot
  (setv pivot   (get arr (// (len arr) 2))
        ;; lfor is the Hy equivalent of list comprehensions,
        ;; this one is the same as [x for x in arr if x < pivot]
        lesser  (lfor x arr :if (< x pivot) x)
        greater (lfor x arr :if (> x pivot) x))
  (+ (quicksort lesser) [pivot] (quicksort greater)))

(setv arr [2 6 3 14 19 5 1 7])
(print f"Original Array: {arr}")
(print f"Sorted Array:   {(quicksort arr)}")
