;Marim Abbas
;Project 4
;02/28/2024
;CSCI 3210-001
;Dr. Dong
;In this project, we are required to write functions in the Scheme langauge using recursive and non-recursive functions

#lang racket

; #1 area(r)
; non-recursive funtion that gives the radius of a circle by using one parameter and multpying 3.14 by r^2

(define (area r)
  (* 3.14 (* r r )))


; #2 power(A,B)
;takes in A and B as (two) parameters and returns A^B power (A must be positive and B can be either)

(define (power A B)
  (if (= B 0)
      1
      (if(> B 0)
         (if (<= A 0)
             0
          (* A (power A (- B 1))))
          (/ 1 (power A (- B))))))


; #3 countZero(list)
; a recursive function that returns the number of value zeros in a simple list of numbers

(define (countZero list)
  (cond
   [(null? list)0]
   [(= (car list) 0)
    (+ 1 (countZero(cdr list)))]
   [else
    (countZero(cdr list))]
   )
  )


; #4 reverse(list)
; a recursive function that returns the reverse of its simple list parameter

(define (reverse l_list)
  (cond
    [(null? l_list) '()]
    [(null? l_list) '()]
    (reverse '(1 2 3 4))[(append (reverse (cdr l_list)) (list (car l_list)))]
    ))

     
    ; #5 palindrome(list)
    ; a recursive function that returns true if the simple list reads the same forward and backward; otherwise its false

(define (palindrome list)
  (cond
    [(< (length list)2)#t]
    [(not (equal? (car list) (palindrome (cdr list)))) #f]
    [ (drop-right list 1) (palindrome (cdr list))]
    [ else #t]
    ))


    ; #6 merge(firstNameList,lastNamelist)
    ;a recursive function receives a simple list of first names and a simple list of last hames, and merges two lists into one

    (define (merge firstNameList lastNamelist)
      (if(or(null? firstNameList) (null? lastNamelist)) '()
         (cons (list (car firstNameList) (car lastNamelist))
               (merge (cdr firstNameList) (cdr lastNamelist))
               )))
