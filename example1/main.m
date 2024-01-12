% Fractional Differential Equations Solver using Predictor-Corrector Method
% 
% This script implements a predictor-corrector scheme for solving systems of
% fractional-order differential equations. 
% 
% The approach is based on the method described in the paper by Bhalekar and Daftardar-Gejji:
% "A predictor-corrector scheme for solving nonlinear delay differential
% equations of fractional order." (J. Fract. Calc. Appl. 2011, 1, 1–9).
% The method involves predicting the future state of a system and then 
% correcting this prediction, taking into account the fractional order of
% the derivatives and the time delay in the system.
%
% Author: Fang Zhu
%

% Clear the command window and workspace
clc; clear;

% Initialize parameters
alpha = 0.97; % % Fractional derivative order
k = 1; % Number of states to predict simultaneously
T = 100; % Total prediction time length
N = 10000; % Total number of prediction time steps
h = T/N; % Prediction step size
tau = 2; % Time delay

% Initial state, dimension k * 1
g = 0.5;
gg = g; % State values for t < 0
yvalues = zeros(N, k); % Store historical states

% Prediction loop
for n = 0:N-1
    % Compute predicted value
    yp = g;
    for j = 0:n
        tj = j*h;
        bj = ((h^alpha)/alpha)*((n+1-j)^alpha - (n-j)^alpha);
        
        % Retrieve previous state
        if j == 0
            yj = g;
        else
            yj = yvalues(j);
        end
        
        % Adjust for time delay
        if (tj - tau) <= 1e-9
            yyj = gg;
        else
            yyj = yvalues(j-tau/h);
        end
        yp = yp + (1/gamma(alpha)) * bj * fde_system(tj, yj, yyj);
    end
    
    tn1 = (n+1)*h;
    tn = n*h;
    
    % Adjust for time delay
    if (tn1 - tau) <= 1e-9
        yyn1 = gg;
    else
        yyn1 = yvalues(1+n-tau/h);
    end
    
    % Correction step
    yn1 = g + ((h^alpha)/gamma(alpha+2)) * fde_system(tn1, yp, yyn1);
    
    for j = 0:n
        tj = j*h;
        % Calculate coefficients for correction
        if j == 0
            aj = n^(alpha+1) - (n-alpha)*(n+1)^alpha;
        elseif j == n+1
            aj = 1;
        else
            aj = (n-j+2)^(alpha+1) + (n-j)^(alpha+1) - 2*(n-j+1)^(alpha+1);
        end
        
        % Retrieve previous state
        if j == 0
            yj = g;
        else
            yj = yvalues(j);
        end
        
        % Adjust for time delay
        if (tj - tau) <= 1e-9
            yyj = gg;
        else
            yyj = yvalues(j-tau/h);
        end

        yn1 = yn1 + ((h^alpha)/gamma(alpha+2)) * aj * fde_system(tj, yj, yyj);
    end

    % Update and store result
    yvalues(n+1) = yn1;

    % Display iteration progress
    if mod(n, 200) == 0
        disp(['Current iteration: ', num2str(n)]);
    end
end

% Store results
results = [g;yvalues];

% Save results to a file
save results1;