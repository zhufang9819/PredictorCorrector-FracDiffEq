% Load the saved results
load results;

% 'results' is an N*4 matrix, where N is the number of time points
N = size(results, 1);

% Create a time vector
t = linspace(0, 160, N);

% Plot subplots
figure;

% Set default font and font size
set(gcf, 'DefaultTextInterpreter', 'latex', 'DefaultAxesFontName', 'Times New Roman', 'DefaultAxesFontSize', 11);

% Plot y_1(t) - choose color and line width
subplot(2, 2, 1);
plot(t, results(:, 1), 'LineWidth', 1, 'Color', [0.8500, 0.3250, 0.0980]); % Orange color
title('$y_1(t)$ vs Time');
xlabel('Time (s)');
ylabel('$y_1(t)$');

% Plot y_2(t) - choose color and line width
subplot(2, 2, 2);
plot(t, results(:, 2), 'LineWidth', 1, 'Color', [0, 0.4470, 0.7410]); % Blue color
title('$y_2(t)$ vs Time');
xlabel('Time (s)');
ylabel('$y_2(t)$');

% Plot y_3(t) - choose color and line width
subplot(2, 2, 3);
plot(t, results(:, 3), 'LineWidth', 1, 'Color', [0.4660, 0.6740, 0.1880]); % Green color
title('$y_3(t)$ vs Time');
xlabel('Time (s)');
ylabel('$y_3(t)$');

% Plot y_4(t) - choose color and line width
subplot(2, 2, 4);
plot(t, results(:, 4), 'LineWidth', 1, 'Color', [0.4940, 0.1840, 0.5560]); % Purple color
title('$y_4(t)$ vs Time');
xlabel('Time (s)');
ylabel('$y_4(t)$');

% Save the subplot figure
saveas(gcf, 'State_Variables_Subplots_Ex3.png');

% Plot a combined graph in a new window
figure;

% Set font and font size
set(gcf, 'DefaultTextInterpreter', 'latex', 'DefaultAxesFontName', 'Times New Roman', 'DefaultAxesFontSize', 11);

% Plot all y(t) - use different colors and line widths
plot(t, results(:, 1), 'LineWidth', 1, 'Color', [0.8500, 0.3250, 0.0980]); % Orange color
hold on; % Hold the current figure for plotting additional lines
plot(t, results(:, 2), 'LineWidth', 1, 'Color', [0, 0.4470, 0.7410]); % Blue color
plot(t, results(:, 3), 'LineWidth', 1, 'Color', [0.4660, 0.6740, 0.1880]); % Green color
plot(t, results(:, 4), 'LineWidth', 1, 'Color', [0.4940, 0.1840, 0.5560]); % Purple color

title('Comparison of $y_1(t)$, $y_2(t)$, $y_3(t)$, and $y_4(t)$');
xlabel('Time (s)');
ylabel('Values');
legend('$y_1(t)$', '$y_2(t)$', '$y_3(t)$', '$y_4(t)$', 'Interpreter', 'latex', 'Location', 'best', 'FontName','Times New Roman','FontSize',14); % Add a legend
hold off;

% Save the combined figure
saveas(gcf, 'Combined_State_Variables_Ex3.png');
