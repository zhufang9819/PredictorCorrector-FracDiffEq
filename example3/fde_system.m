function [result] = fde_system(t, y, yy)
    % FDE_SYSTEM - Function representing a system of fractional order differential equations
    % 
    % This function defines a system of fractional order differential equations
    % which is used in a predictor-corrector scheme for solving nonlinear delay
    % differential equations of fractional order.
    % 
    % The function takes three inputs:
    %   t - The current time step
    %   y - The current state vector
    %   yy - The state vector at a previous time step (delayed state)
    % 
    % The output is a vector representing the derivative of the state vector.
    % 
    % Reference:
    % Bhalekar, S.; Daftardar-Gejji, V. A predictor-corrector scheme for solving nonlinear delay 
    % differential equations of fractional order. J. Fract. Calc. Appl. 2011, 1, 1–9.
    %
    % Author: Fang Zhu

    % Calculations based on the current and delayed states
    tt = y(1)/(1 + 0.0005*yy(4)^3);
    d1 = 10.5 - tt;
    d2 = tt - y(2);
    d3 = y(2) - y(3);
    d4 = y(3) - 0.5*y(4);

    % Resulting derivative vector
    result = [d1, d2, d3, d4];
end
