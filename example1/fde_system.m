function [d1] = fde_system(t, y, yy)
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
    d1 = (2.*yy)./(1 + yy.^9.65) - y;
end

