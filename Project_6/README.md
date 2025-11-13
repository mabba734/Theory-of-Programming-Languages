# Logic Programming Exercises in Prolog

A set of Prolog predicates that implement basic list processing, numerical checks, and tree traversal. The project focuses on **logic programming**, **recursion**, and **pattern matching**, using declarative definitions instead of imperative control flow.

## Implemented Predicates

- `mymember/2`  
  Checks whether a value is a member of a list using recursion.

- `myeven/1`  
  Determines whether a given non-negative integer is even by recursively subtracting 2.

- `myevennumber/2`  
  Counts how many even numbers appear in a list.

- `myminlist/2`  
  Finds the minimum value in a list of numbers using recursive comparison.

- `palindrome/1`  
  Checks whether a list reads the same forwards and backwards.

- `leafcount/2`  
  Counts the number of leaf nodes in a binary tree represented as `t(Value, Left, Right)` or `nil`.

## Skills Demonstrated

- Logic programming (Prolog)
- Recursive definitions and structural recursion
- List processing and pattern matching
- Working with tree data structures
- Thinking declaratively (what is true, not how to compute step-by-step)

## Example Queries

```prolog
?- mymember(3, [1,2,3,4]).
?- myeven(6).
?- myevennumber(X, [1,2,3,4,5,6]).
?- myminlist([5,2,8,1,4], Min).
?- palindrome([r,a,c,e,c,a,r]).
?- leafcount(t(1, t(2, nil, nil), t(3, nil, nil)), Count).
