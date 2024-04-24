% Parameters
N = 512;            % Number of samples
fs = 1000;          % Sampling frequency (Hz)
t = (0:N-1)/fs;     % Time vector

% Original signal (sum of sinusoids)
frequencies = [50, 150, 250];  % Frequencies of sinusoids (Hz)
amplitudes = [1, 0.5, 0.2];    % Amplitudes of sinusoids
x = zeros(1, N);
for i = 1:length(frequencies)
    x = x + amplitudes(i) * cos(2*pi*frequencies(i)*t);
end

% Compute DTFT of the original signal
X = fft(x);

% Time expansion factor
alpha = 2;      % Expand the signal by a factor of 2

% Expanded signal
t_expanded = alpha * t;
x_expanded = zeros(1, length(t_expanded));
for i = 1:length(frequencies)
    x_expanded = x_expanded + amplitudes(i) * cos(2*pi*frequencies(i)*t_expanded);
end

% Compute DTFT of the expanded signal
X_expanded = fft(x_expanded);

% Plot original and expanded signals in the time domain
figure;
subplot(2,1,1);
plot(t, x);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(2,1,2);
plot(t_expanded, x_expanded);
title('Expanded Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Plot DTFT magnitude spectra of original and expanded signals
f = (-N/2:N/2-1) * fs/N; % Frequency vector
X_mag = fftshift(abs(X)); % Magnitude spectrum of original signal
X_expanded_mag = fftshift(abs(X_expanded)); % Magnitude spectrum of expanded signal

figure;
subplot(2,1,1);
plot(f, X_mag);
title('Magnitude Spectrum of Original Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
subplot(2,1,2);
plot(f, X_expanded_mag);
title('Magnitude Spectrum of Expanded Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
