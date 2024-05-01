% Define days
day(saturday).
day(sunday).

% Define weather
weather(sunny).
weather(rainy).
weather(cloudy).

% Define activities
activity(lake).
activity(bike).
activity(theater).

% Activities based on weather conditions
weather_activity(sunny, lake).
weather_activity(sunny, bike).
weather_activity(rainy, theater).
weather_activity(cloudy, bike).
weather_activity(cloudy, theater).

% Define friends
friend(albert).
friend(basti).
friend(cris).
friend(daniela).
friend(eric).
friend(franziska).
friend(george).

% Selection rules
1 { at_day(D) : day(D) } 1.
1 { at_weather(D, W) : weather(W) } 1 :- at_day(D).
1 { at_activity(W, A, D) : activity(A), weather_activity(W, A) } 1 :- at_day(D), at_weather(D, W).

% Albert's preferences
can_join(albert, A, D) :-activity(A), day(D), A != bike, D != saturday, not weather(sunny), D != sunday.
join(albert, A, D) :- can_join(albert, A, D), at_activity(W, A, D).

% Basti's preferences
can_join(basti, A, D) :- activity(A), A != theater, day(D).
join(basti, A, D) :- can_join(basti, A, D), at_activity(_, A, D).

% Criss preferences
join(cris, A, D) :- at_day(D), D = sunday, at_activity(_, A, D), not join(albert, A, D).

% Daniela
can_join(daniela, A, D) :- activity(A),  day(D), A != theater, D != sunday.
join(daniela, A, D) :- can_join(daniela, A, D), at_activity(_, A, D).

% Eric's preferences
can_join(eric, A, D) :- activity(A),  day(D), A != theater, A != bike, D != sunday.
join(eric, A, D) :- can_join(eric, A, D), at_activity(_, A, D).

% Franziska's preferences
can_join(franziska, A, D) :- activity(A), day(D), not join(daniela, A, D), not join(george, A, D).
join(franziska, A, D) :- can_join(franziska, A, D), at_activity(_, A, D).

% George's preferences
can_join(george, A, D) :- activity(A), day(D), A != lake.
join(george, A, D) :- can_join(george, A, D), at_activity(_, A, D).

% ensure either Franziska or Cris is present
:- not join(franziska, _, D), not join(cris, _, D), at_day(D).

#show chosen/4.
chosen(W, A, D, Friend) :- at_weather(D, W), at_activity(W, A, D), join(Friend, A, D).