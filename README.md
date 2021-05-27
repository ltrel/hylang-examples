# Hylang Examples 🦑
This is a collection of code examples written in the Hy programming language. The aim of this repository is to help those interested in learning Hy by providing well-documented solutions to common programming problems, demonstrations of the language features, and other cool stuff. As a bit of a disclaimer, I'm no Lisp expert and am far more comfortable writing Python, so I may not be doing things the best way possible, but I hope this can still be useful to programmers coming from a similar background.
## List of Programs
- FizzBuzz
- Binary search algorithm
- Quicksort sorting algorithm (simplified and traditional implementations)
- Sierpinski Triangle (requires Pillow/PIL)
- More stuff coming soon
## Generating Python Translations of Programs
To get a better idea of how code in Hy corresponds to Python code, you can use the provided `pythontranslations.hy` script to generate equivalent Python programs from all the examples. This works using the same `ast.unparse()` trick as Hy's built-in `hy2py` script. Unfortunately as a consequence of this, the generated code will often be poorly formatted, and in some cases (macros particularly) near-unreadable.
