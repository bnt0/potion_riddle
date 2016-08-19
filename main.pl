% HELPER AXIOMS

% seven potions, numbered 1 to 7, left to right.
potions   :- [1,2,3,4,5,6,7].
potion(X) :- member(X, potions).

% a poition can be of exactly one kind
wine(X)   :- \+ poison(X), \+ ahead(X),  \+ back(X).
poison(X) :- \+ wine(X),   \+ ahead(X),  \+ back(X).
back(X)   :- \+ wine(X),   \+ ahead(X),  \+ poison(X).
ahead(X)  :- \+ wine(X),   \+ poison(X), \+ back(X).

% Information from the riddle

% Danger lies before you, while safety lies behind,
% Two of us will help you, whichever you would find,
% One among us seven will let you move ahead,
exactly_one_ahead :- findall(X, (potion(X), ahead(X)), Z),
                     length(Z, 1).

% Another will transport the drinker back instead,
exactly_one_back :- findall(X, (potion(X), back(X)), Z),
                    length(Z, 1).

% Two among our number hold only nettle wine,
exactly_two_wine :- findall(X, (potion(X), wine(X)), Z),
                    length(Z, 2).

% Three of us are killers, waiting hidden in line.
exactly_three_poison :- findall(X, (potion(X), poison(X)), Z),
                        length(Z, 3).

% Choose, unless you wish to stay here for evermore,
% To help you in your choice, we give you these clues four:

% First, however slyly the poison tries to hide
% You will always find some on nettle wine’s left side;
poison(X) :- potion(X), wine(X+1).

% Second, different are those who stand at either end,
% But if you would move onwards, neither is your friend;
ahead(1) :- fail.
ahead(7) :- fail.
wine(1)   :- potion(1), back(7) ; poison(7).
wine(7)   :- potion(7), back(1) ; poison(1).
poison(1) :- potion(1), back(7) ; wine(7).
poison(7) :- potion(7), back(1) ; wine(1).
back(1)   :- potion(1), wine(1) ; poison(1).
back(7)   :- potion(7), wine(7) ; poison(7).

% Third, as you see clearly, all are different size,
% Neither dwarf nor giant holds death in their insides;
smallest(2).
biggest(6).
wine(X)  :- smallest(X), \+ back(X), \+ ahead(X).
wine(X)  :- biggest(X), \+ back(X), \+ ahead(X).
back(X)  :- smallest(X), \+ wine(X), \+ ahead(X).
back(X)  :- biggest(X), \+ wine(X), \+ ahead(X).
ahead(X) :- smallest(X), \+ back(X), \+ wine(X).
ahead(X) :- biggest(X), \+ back(X), \+ wine(X).

% Fourth, the second left and the second on the right
% Are twins once you taste them, though different at first sight.
wine(2)   :- wine(6).
ahead(2)  :- ahead(6).
poison(2) :- poison(6).
back(2)   :- back(6).
wine(6)   :- wine(2).
ahead(6)  :- ahead(2).
poison(6) :- poison(2).
back(6)   :- back(2).


%%
exactly_one_ahead.
exactly_one_back.
exactly_two_wine.
exactly_three_poison.
