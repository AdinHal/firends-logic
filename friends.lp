% Define possible days for the activity
day(saturday).
day(sunday).

% Define possible weather conditions
weather(sunny).
weather(rainy).
weather(cloudy).

% Define activities
activity(lake).
activity(bike).
activity(theater).

% Define activity eligibility based on weather
weather_activity(sunny, lake).
weather_activity(sunny, bike).
weather_activity(rainy, theater).
weather_activity(cloudy, bike).
weather_activity(cloudy, theater).

% Select one day to organize the activity
1 { at_day(D) : day(D) } 1.

% Select one weather condition for each possible day
1 { at_weather(D, W) : weather(W) } 1 :- at_day(D).

% Assign activities to days based on the weather condition
1 { at_activity(W, A, D) : activity(A), weather_activity(W, A) } 1 :- at_day(D), at_weather(D, W).

% Customize the output to show "weather activity day" format
#show chosen/3.
chosen(W, A, D) :- at_weather(D, W), at_activity(W, A, D).