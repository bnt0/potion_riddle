use_module(library(lists)).

% Danger lies before you, while safety lies behind,
% Two of us will help you, whichever you would find,
% One among us seven will let you move ahead,
% Another will transport the drinker back instead,
% Two among our number hold only nettle wine,
% Three of us are killers, waiting hidden in line.
% Choose, unless you wish to stay here for evermore,
%
% To help you in your choice, we give you these clues four:
% First, however slyly the poison tries to hide
% You will always find some on nettle wine’s left side;
% Second, different are those who stand at either end,
% But if you would move onwards, neither is your friend;
% Third, as you see clearly, all are different size,
% Neither dwarf nor giant holds death in their insides;
% Fourth, the second left and the second on the right
% Are twins once you taste them, though different at first sight.

% Represent each potion as an element of a list
% Each element of the list is the type of the potion, one of the following:
% ahead: (1)
% back: (1)
% wine: nettle wine (2).
% poison: (3)

% A list is valid if it contains the correct number of each of these potions
is_valid(PotionList) :- 
    permutation([ahead, back, wine, wine, poison, poison, poison], PotionList).

% 1st clue: left from nettle wine is always poison
%   "First, however slyly the poison tries to hide
%    You will always find some on nettle wine’s left side;"
clue1([poison, wine|Rest]) :- 
    clue1(Rest).
clue1([Potion|Rest]) :-
    Potion \= wine,
    clue1(Rest).
clue1([]).

% 2nd clue: first and last in list are different, and not ahead.
%   "Second, different are those who stand at either end,
%    But if you would move onwards, neither is your friend;"
clue2([First|Rest]) :-
    append(_, [Last], Rest),
    First \= Last,
    First \= ahead,
    Last  \= ahead.

