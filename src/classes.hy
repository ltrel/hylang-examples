(import math)

;; Classes are declared using defclass.
;; A list of base classes can be added inside the square brackets.
(defclass Circle []
  (setv type "Circle")

  ;; Constructor methods use the same name as they do in Python.
  (defn __init__ [self radius]
    (setv self.radius radius))

  (defn area [self]
    (* math.pi (** self.radius 2)))

  (defn perimeter [self]
    (* 2 math.pi self.radius))

  (defn dimensions [self]
    {"Radius" self.radius}))

(defclass Rectangle []
  (setv type "Rectangle")

  (defn __init__ [self length width]
    (setv self.length length)
    (setv self.width width))

  (defn area [self]
    (* self.length self.width))

  (defn perimeter [self]
    (+ (* self.length 2) (* self.width 2)))

  (defn dimensions [self]
    ;; Dictionary literals alternate between stating keys and values.
    ;; Extra spacing between pairs can be used for readability.
    {"Length" self.length  "Width" self.width}))

;; Create some shapes.
(setv shapes [(Circle 1)
              (Rectangle 3 4)
              (Circle 4)
              (Rectangle 12 7)])

(for [shape shapes]
  ;; Because Python uses duck typing, no formalized inheritance
  ;; is needed to access the same members on objects of different types.
  (print f"{shape.type}:")

  ;; Iterate over the dimensions that this particular shape has.
  (for [key (shape.dimensions)]
    (print f"{key}: {(get (shape.dimensions) key)}"))

  (print f"Area: {(shape.area)}")
  (print f"Perimeter: {(shape.perimeter)}")
  (print))
