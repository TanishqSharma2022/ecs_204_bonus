% Define the x data points
x = -15:15;

% Initialize y with zeros
y = zeros(1, 31);

period = 10;  % Define the period


% Randomize y between 40 and 60
idx = (x >= -5) & (x <= -5+period) ;
y(idx) = randi([1, 20], 1, sum(idx));


% Create a discrete plot using stem
figure;
stem(x, y, 'filled');

% Add labels and title
xlabel('n');
ylabel('x[n]');
title('Discrete Plot');

% Get extra space in y-axis
ylim([0, 25]);
