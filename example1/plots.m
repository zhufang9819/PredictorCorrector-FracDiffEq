% Load the saved results
load results1;

% 'results' is an N*4 matrix, where N is the number of time points
N = size(results, 1);

% Create a time vector
t = linspace(0, 60, N);

% Plot subplots
fig1 = figure;

% Set default font and font size
set(gcf, 'DefaultTextInterpreter', 'latex', 'DefaultAxesFontName', 'Times New Roman', 'DefaultAxesFontSize', 11);


% Plot y(t) - choose color and line width
subplot(1, 2, 1);
plot(t, results, 'LineWidth', 1, 'Color', [0.8500, 0.3250, 0.0980]); % Orange color
title('$y(t)$ vs Time');
xlabel('Time (s)');
ylabel('$y(t)$');

% Plot y(t) versus y(t-\tau) - choose color and line width
subplot(1, 2, 2);
plot(results(201:N), results(1:N-200), 'LineWidth', 1, 'Color', [0, 0.4470, 0.7410]); % Blue color
title('$y(t)$ vs $y(t-\tau)$');
xlabel('$y(t)$');
ylabel('$y(t-\tau)$');

% Set the size of the figure for the subplots
set(fig1, 'Position', [100, 100, 1500, 600]);

% Save the combined figure
saveas(gcf, 'State_And_Phase_Ex1.png');