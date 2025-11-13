# Recursive Functions in Scheme (Racket)

A small collection of recursive and non-recursive functions written in Racket (Scheme) for a programming languages course. The project focuses on functional programming concepts, recursion, and list processing.

## Implemented Functions

- `area(r)`  
  Computes the area of a circle given its radius using `3.14 * r^2`.

- `power(A, B)`  
  Recursively computes \( A^B \), handling positive and zero exponents.

- `countZero(list)`  
  Counts how many times the value `0` appears in a simple list of numbers.

- `reverse(list)`  
  Recursively returns the reverse of a simple list.

- `palindrome(list)`  
  Checks whether a simple list reads the same forward and backward.

- `merge(firstNameList, lastNameList)`  
  Merges two lists (first names and last names) into a list of `(first last)` pairs.

## Skills Demonstrated

- Functional programming (Scheme/Racket)
- Recursion and list processing
- Pattern matching and conditionals (`cond`, `if`)
- Working with lists using `car`, `cdr`, `cons`, `append`, etc.

## How to Run

1. Open the file in DrRacket or any Racket-compatible environment.
2. Make sure the first line is:

   ```racket
   #lang racket
