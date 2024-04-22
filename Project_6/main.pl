%Marim Abbas
%Project 6
%CSCI 3210-001
%Dr Dong 


% Problem 1: Checking to see if a value is stored within a list 

mymember(_, [_]) :- false.            %Checking to see if the list is empty, return false if it is        
mymember(X, [X|_]).                   
mymember(X, [_|T]) :- mymember(X, T). % Recursively checks the rest of the list for the value

% Problem 2: Checking to see if a value is either even or odd 

myeven(0).                                    %base case because zero is even
myeven(X) :- X > 0, X1 is X - 2, myeven(X1).  %recursively subtract 2 and check if result is even

% Problem 3: Checking and counting the even numbers in a list
 
myevennumber(0, []).                                                    %Base case: empty list will have zero even numbers 
myevennumber(X,[H|T]) :- 0 is H mod 2, myevennumber(X2,T), X is X2 + 1. %Seeing whether the head is even and then incrementing and checking the next number
myevennumber(X,[_|T]) :- myevennumber(X2,T), X is X2.                   %If the next number is not even, continue moving in the list 

% Problem 4: Checking a list to see the minimum value in the list

myminlist([X], X). 
myminlist([Head|Tail], Min) :- %Comparing and Checking both the head and tail part of the list to have one set to Min
    myminlist(Tail, TailMin), %Comparing the next elements to see which of them are lower
    (Head < TailMin -> Min = Head ; Min = TailMin). %Comparison between these to see which value is lower
 
 
% Problem 5: Checking to see if a list is a palindrome (the list can be re-written the same from the front and back.

palindrome([]). :- true.                                   %If the list doesn't contain anything then it is a palindrome
palindrome([_]). :- true.                                  %If the list only contains a single element then it will also be considered a palindrome
palindrome([Element|Element_next]) :- append(Middle, [Element], Element_next), palindrome(Middle).  %checks for palindrome by matching ends and recursing on the middle


% Problem 6: Counting the number of leaf nodes in a binary tree.

leafcount(nil,0).                                    %base case
leafcount(t(_,nil,nil),1).     
leafcount(t(_, Side_left, Side_right), All) :- leafcount(Side_left, Left_counter), leafcount(Side_right, Right_counter), All is Left_counter + Right_counter. %Recusively sums leaf counts from left and right subtree
