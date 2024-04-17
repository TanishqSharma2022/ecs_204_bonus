% Define the x data points
x = -30:30;

% Initialize y with zeros
y = zeros(1, 61);

% Randomize y between 40 and 60
idx = (x >= -20) & (x <= -10) ;
y(idx) = randi([1, 20], 1, sum(idx));

period = 10;  % Define the period
idx2 = (x >= -5) & (x <= -5 + period);
y(idx2) = y(idx);
idx3 = (x >= 10) & (x <= 10 + period);
y(idx3) = y(idx);

% Create a discrete plot using stem
figure;
stem(x, y, 'filled');

% Add labels and title
xlabel('n');
ylabel('x[n]');
title('Discrete Plot');

% Get extra space in y-axis
ylim([0, 50]);