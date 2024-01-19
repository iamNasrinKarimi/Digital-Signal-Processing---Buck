% System 1 coefficients
b1 = 1;      % numerator coefficients
a1 = [zeros(1, 3), 1];   % denominator coefficients (delay of 3)

% Frequency response analysis using freqz
N = 512; % Number of points
[Hz1, W1] = freqz(b1, a1, N, 'whole');

% Plot magnitude response
figure;
subplot(2, 1, 1);
plot(W1/pi, abs(Hz1));
title('Magnitude Response - System 1: y[n] = x[n-3]');
xlabel('Normalized Frequency (\omega/\pi)');
ylabel('|H_1(e^{j\omega})|');
set(gca, 'FontWeight', 'bold');  % Set axis font weight to bold

% Plot phase response
subplot(2, 1, 2);
plot(W1/pi, angle(Hz1)); % unwrap to avoid phase wrapping
title('Phase Response - System 1: y[n] = x[n-3]');
xlabel('Normalized Frequency (\omega/\pi)');
ylabel('Phase (radians)');
set(gca, 'FontWeight', 'bold');  % Set axis font weight to bold


% System 2 coefficients
b2 = [-3/4, 1];          % numerator coefficients
a2 = [1, -3/4, 3/4];      % denominator coefficients

% Frequency response analysis using freqz
[Hz2, W2] = freqz(b2, a2, N, 'whole');

% Plot magnitude response
figure;
subplot(2, 1, 1);
plot(W2/pi, abs(Hz2));
title('Magnitude Response - System 2: y[n] - (3/4)y[n-1] = -(3/4)x[n] + x[n-1]');
xlabel('Normalized Frequency (\omega/\pi)');
ylabel('|H_2(e^{j\omega})|');
set(gca, 'FontWeight', 'bold');  % Set axis font weight to bold

% Plot phase response
subplot(2, 1, 2);
plot(W2/pi, (angle(Hz2))); % unwrap to avoid phase wrapping
title('Phase Response - System 2: y[n] - (3/4)y[n-1] = -(3/4)x[n] + x[n-1]');
xlabel('Normalized Frequency (\omega/\pi)');
ylabel('Phase (radians)');
set(gca, 'FontWeight', 'bold');  % Set axis font weight to bold


% Compare phase of H2(e^jw) with H1(e^jw)
figure;
plot(W1/pi, (angle(Hz1)), 'b', 'LineWidth', 2); % Blue line for H1
hold on;
plot(W2/pi, (angle(Hz2)), 'r', 'LineWidth', 2); % Red line for H2
hold off;
title('Comparison of Phase Responses');
xlabel('Normalized Frequency (\omega/\pi)');
ylabel('Phase (radians)');
legend('H1(e^{j\omega})', 'H2(e^{j\omega})');
set(gca, 'FontWeight', 'bold');  % Set axis font weight to bold