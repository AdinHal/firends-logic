% Define days and weather conditions
day(saturday).
day(sunday).

weather(sunny).
weather(rainy).
weather(cloudy).

% Define activities based on weather
activity(lake) :- weather(sunny).
activity(bike) :- weather(sunny); weather(cloudy).
activity(theater) :- weather(rainy); weather(cloudy).

% Create choices for each day, weather, and activity
1 { at_day(D) : day(D) } 1.
1 { at_weather(W) : weather(W) } 1.
1 { at_activity(A) : activity(A) } 1.

% Friends joining conditions
join(albert) :- at_day(saturday), not at_activity(bike).
join(albert) :- at_day(sunday), not at_weather(sunny).
join(basti) :- not at_activity(theater).
join(cris) :- at_day(sunday), not join(albert).
join(daniela) :- not (at_day(sunday), at_activity(theater)).
join(eric) :- false.
join(franziska) :- not (join(daniela), join(george)).
join(george) :- not at_activity(lake).

% Display selected day, weather, activity, and which friends join
#show at_day/1.
#show at_weather/1.
#show at_activity/1.
#show join/1.

% Constraint to ensure either Cris or Franziska joins
:- not join(cris), not join(franziska).
