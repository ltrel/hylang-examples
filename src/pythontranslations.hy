(import [hy.lex [hy-parse]])
(import [hy.compiler [hy-compile]])
(import os)
(import ast)

(setv src-dir ((. os path dirname) ((. os path realpath) __file__)))
(setv out-dir ((. os path join) src-dir "python"))
(unless ((. os path exists) out-dir)
  ((. os mkdir) out-dir))

(for [entry ((. os scandir) src-dir)]
  (when (and ((. entry path endswith) ".hy") (. entry is-file))
    (setv hy-source (with [f (open entry)] ((. f read)))
          hy-syntax-tree (hy-parse hy-source)
          python-syntax-tree (hy-compile hy-syntax-tree "__main__")
          python-source ((. ast unparse) python-syntax-tree)
          out-name (+ (first ((. entry name split) "." 1)) ".py"))

    (with [f (open ((. os path join) out-dir out-name) "w")]
      ((. f write) python-source)))) 
