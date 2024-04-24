% Define the sequence x[n]
n = -50:50;
x = sqrt(2).^n .* heaviside(n);
N = length(x); % Length of the sequence
N
% Compute the DTFT X(e^jw)
X = zeros(1, N);
w = linspace(-3*pi, 3*pi, N);
for k = 1:N
    for n = 1:N
        X(k) = X(k) + x(n) * exp(-1j * w(k) * n);
    end
end

n = -50:50
% Plot the sequence x[n]
subplot(2, 1, 1);
plot(n, x, 'LineWidth', 2);
xlabel('n');
ylabel('x[n]');
title('Sequence x[n]');
grid on;

% Plot the magnitude of X(e^jw)
subplot(2, 1, 2);
plot(w, abs(X), 'LineWidth', 2);
xlabel('Frequency (\omega)');
ylabel('Magnitude');
title('Magnitude of X(e^{j\omega})');
grid on;
ylim([0, max(abs(X)) * 1.2]);