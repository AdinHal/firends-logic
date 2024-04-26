% Define days
day(saturday).
day(sunday).

% Define weather
weather(sunny).
weather(rainy).
weather(cloudy).

% Define activities
activity(lake) :- weather(sunny).
activity(bike) :- weather(sunny); weather(cloudy).
activity(theather) :- weather(rainy); weather(cloudy).

% Friends preferences
join(albert) :- not activity(bike,saturday), not(weather(sunny),day(sunday))
join(basti) :- not activity(theather).
join(cris) :- day(sunday), not join(albert).
join(daniela) :- not(activity(theather), day(sunday)).
join(eric) :- false. % "Sorry, I neither like theater nor riding bicycles, and I'm busy on Sunday
join(franziska) :- not(join(daniela),join(george)).
join(george) :- not activity(lake).