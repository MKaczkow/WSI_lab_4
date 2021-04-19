/*	
Author: Maciej Kaczkowski
Date: 8-15.04.2021
*/


/* simple spatial relations between houses */
right_of(X, Y) :- X is Y+1.
left_of(X, Y) :- right_of(Y, X).

next_to(X, Y) :- right_of(X, Y).
next_to(X, Y) :- left_of(X, Y).

einstein_riddle(Street, FishOwner, WaterDrinker) :-

	/* initiate data structure */
    Street = [
           house(1, Nationality_1,  Color_1,     Pet_1,   Drink_1,    Smoke_1),
           house(2, Nationality_2,  Color_2,     Pet_2,   Drink_2,    Smoke_2),
           house(3, Nationality_3,  Color_3,     Pet_3,   Drink_3,    Smoke_3),
           house(4, Nationality_4,  Color_4,     Pet_4,   Drink_4,    Smoke_4),
           house(5, Nationality_5,  Color_5,     Pet_5,   Drink_5,    Smoke_5)],


    /* coded conditions */
    /* 			Nationality 	Colour 		Pet 		Drink 		Smoke 		*/
    member(house(_, 	british,	red,		_,		_,		_		), Street),
    member(house(_, 	swedish,	_,		dogs,		_,		_		), Street),
    member(house(_, 	danish,		_,		_,      	tea,		_ 		), Street),
    member(house(_,	_,		green,		_,      	coffee,		_		), Street),
    member(house(_, 	_,		_,		birds,  	_,		no_filter	), Street),
    member(house(_, 	_,		yellow,		_,      	_,         	cigar     	), Street),
    member(house(_, 	_,		_,		_,      	beer,		mentol		), Street),
    member(house(_, 	german,		_,		_,      	_,		pipe		), Street),

    /* spatial conditions */
    member(house(3, 	_,		_,		_,      	milk,       	_		), Street),
    member(house(1, 	norwegian,	_,		_,      	_,          	_ 		), Street),

    member(house(A, 	_,		green,		_,      	_,		_ 		), Street),
    member(house(B, 	_,		white,		_,      	_,          	_		), Street),
    left_of(A, B),	

    member(house(C, 	_,		_,		_,      	_,          	light 		), Street),
    member(house(D, 	_,		_,		cats,   	_,          	_		), Street),
    next_to(C, D),

    member(house(E, 	_,		_,		horses,  	_,          	_		), Street),
    member(house(F, 	_,		_,		_,      	_,          	cigar	 	), Street),
    next_to(E, F),

    member(house(G, 	norwegian,	_,		_,      	_,		_		), Street),
    member(house(H, 	_,		blue,		_,      	_,		_		), Street),
    next_to(G, H),

    member(house(I, 	_,		_,		_,      	_,		light		), Street),
    member(house(J, 	_,		_,		_,		water, 		_ 		), Street),
    next_to(I, J),


    /* unkown variables */
    member(house(_, 	FishOwner,	_,		fish,  		_,  		_		), Street),
    member(house(_, 	WaterDrinker,	_,		_,		water,		_		), Street).
