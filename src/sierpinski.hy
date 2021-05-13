(import [PIL [Image ImageDraw]])

(setv fg-color (, 255 255 255))
(setv bg-color (, 0 0 0))
(setv dimensions (, 2000 2000))
(setv file-path "sierpenski.png")

(defn draw-iteration [draw x y w h]
  ;; Stop drawing when the subdivisions get too small.
  (if (or (< w 8) (< h 8)) (return))

  ;; Determine the three points of the central triangle and draw it.
  (setv points [(, (int (+ x (* w 0.25))) (int (+ y (* h 0.5))))
                (, (int (+ x (* w 0.75))) (int (+ y (* h 0.5))))
                (, (int (+ x (* w 0.5))) (+ y h))])
  ((. draw polygon) points :fill bg-color)

  ;; Determine the bounding boxes of the remaining three triangles.
  (setv left  [x (+ y (// h 2)) (// w 2) (// h 2)]
        right [(+ x (// w 2)) (+ y (// h 2)) (// w 2) (// h 2)]
        top   [(int (+ x (* w 0.25))) y (// w 2) (// h 2)])
  
  ;; Use unpacking to expand the lists into positional args.
  (draw-iteration draw #* left)
  (draw-iteration draw #* right)
  (draw-iteration draw #* top))

;; Create image and drawing object.
(setv img ((. Image new) "RGB" dimensions bg-color))
(setv draw ((. ImageDraw Draw) img))

;; Draw initial triangle.
(setv points [(, 0 (last dimensions))
              (, (first dimensions) (last dimensions))
              (, (// (first dimensions) 2) 0)])
((. draw polygon) points :fill fg-color)

;; Begin descent into recursive hell.
(draw-iteration draw 0 0 (first dimensions) (last dimensions))

((. img save) file-path)
