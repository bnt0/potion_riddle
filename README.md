# Solver for the Potion Riddle

A Prolog program to solve Snape's potion puzzle from the first Harry Potter book.

I used the [SWI-Prolog environment](http://www.swi-prolog.org/) during the implementation.


## Usage
1. Ensure SWI-Prolog is installed. SWI-Prolog is a package on most major Linux distributions.
2. Run `swipl -f main.pl` 
3. Get the solution
```
?- solution(X).
X = [poison, wine, ahead, poison, poison, wine, back] .

```


## Notes
As solving the riddle relies on seeing the bottles, and the book doesn't disclose enough information,
this solver relies on the drawing included in the [Pottermore](https://www.pottermore.com/) game.

![Illustration from Pottermore/StackExchange](https://i.stack.imgur.com/CcMPV.png "Clue three relies on seeing the bottles.")
