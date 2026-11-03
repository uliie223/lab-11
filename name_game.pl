main :-
    name_game([a,b,c]).

name_game(Letters) :-
    nl,
    write('Hi. This is the Name Game.'),
    nl,
    write('Current letters: '),
    write(Letters),
    nl,
    write('Choose from the following:'),
    nl,
    write('1- Display current set of letters'),
    nl,
    write('2- Add a letter'),
    nl,
    write('3- Add a letter at the top'),
    nl,
    write('4- Add a letter at the bottom'),
    nl,
    write('5- Delete a letter'),
    nl,
    write('6- Delete all letters'),
    nl,
    write('7- Exit'),
    nl,
    write('Enter your choice: '),
    read(Choice),
    handle_choice(Choice, Letters).

handle_choice(1, Letters) :-
    write('Current letters: '),
    write(Letters),
    nl,
    name_game(Letters).

handle_choice(2, Letters) :-
    write('Enter the letter: '),
    read(Letter),
    write('Enter the position: '),
    read(Position),
    insert_at(Letter, Position, Letters, NewLetters),
    name_game(NewLetters).

handle_choice(3, Letters) :-
    write('Enter the letter: '),
    read(Letter),
    NewLetters = [Letter|Letters],
    name_game(NewLetters).

handle_choice(4, Letters) :-
    write('Enter the letter: '),
    read(Letter),
    append(Letters, [Letter], NewLetters),
    name_game(NewLetters).

handle_choice(5, Letters) :-
    write('Enter the letter to delete: '),
    read(Letter),
    delete_one(Letter, Letters, NewLetters),
    name_game(NewLetters).

handle_choice(6, _) :-
    name_game([]).

handle_choice(7, _) :-
    write('Goodbye!'),
    nl.

handle_choice(_, Letters) :-
    write('Invalid choice.'),
    nl,
    name_game(Letters).

insert_at(Letter, 1, List, [Letter|List]).

insert_at(Letter, Position, [Head|Tail], [Head|Result]) :-
    Position > 1,
    NextPosition is Position - 1,
    insert_at(Letter, NextPosition, Tail, Result).

delete_one(_, [], []).

delete_one(Letter, [Letter|Tail], Tail).

delete_one(Letter, [Head|Tail], [Head|Result]) :-
    dif(Letter, Head),
    delete_one(Letter, Tail, Result).
