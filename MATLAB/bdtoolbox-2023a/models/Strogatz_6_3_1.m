function sys = Strogatz_6_3_1()
    % Strogatz_6_3_1  Example 6.3.1 from Strogatz's textbook
    % The two-dimensional nonlinear system
    %   x' = -x + x^3
    %   y' = -2y
    % implemented for the Brain Dynamics Toolbox.
    %
    % Example:
    %   sys = Strogatz_6_3_1();     % construct the system struct
    %   gui = bdGUI(sys);                 % open the Brain Dynamics GUI
    %
    % Author
    %   Stewart Heitmann (2022)
    %
    % Reference
    %   Steven H Strogatz (1994) Nonlinear Dynamics and Chaos. Westview Press. 

    % Copyright (C) 2022 Stewart Heitmann
    % All rights reserved.
    %
    % Redistribution and use in source and binary forms, with or without
    % modification, are permitted provided that the following conditions
    % are met:
    %
    % 1. Redistributions of source code must retain the above copyright
    %    notice, this list of conditions and the following disclaimer.
    % 
    % 2. Redistributions in binary form must reproduce the above copyright
    %    notice, this list of conditions and the following disclaimer in
    %    the documentation and/or other materials provided with the
    %    distribution.
    %
    % THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    % "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    % LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
    % FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    % COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    % INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    % BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    % LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    % CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    % LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    % ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    % POSSIBILITY OF SUCH DAMAGE.

    % Handle to our ODE function
    sys.odefun = @odefun;
    
    % ODE parameter definitions
    sys.pardef = [
        struct('name','c', 'value',2, 'lim',[0 10])
        ];
    
    % ODE variable definitions
    sys.vardef = [
        struct('name','x', 'value',0.75, 'lim',[-2 2])
        struct('name','y', 'value',0.75, 'lim',[-1 1])
        ];

    % Latex (Equations) panel
    sys.panels.bdLatexPanel.title = 'Equations'; 
    sys.panels.bdLatexPanel.latex = { 
        '$\textbf{Strogatz Example 6.3.1}$'
        ''
        'The nonlinear system'
        '$\dot x = -x + x^3$'
        '$\dot y = -c y$'
        'where c=2.'
        ''
        '$\textbf{Reference}$'
        'Steven H Strogatz (1994) Nonlinear Dynamics and Chaos. Westview Press.'
        };

    % Time Portrait panel 
    sys.panels.bdTimePortrait = [];

    % Phase Portrait panel
    sys.panels.bdPhasePortrait.nullclines = 'on';
    sys.panels.bdPhasePortrait.vectorfield = 'on';
      
    % Default time span (optional)
    sys.tspan = [0 5];
    sys.tstep = 0.1;

    % Specify the relevant ODE solvers (optional)
    %sys.odesolver = {@ode45,@ode23};
    
    % ODE solver options (optional)
    sys.odeoption.RelTol = 1e-6;        % Relative Tolerance
end

% The ODE function.
% The variables Y and dYdt are both (2x1) vectors.
function dY = odefun(t,Y,c)
    % incoming state variables
    x = Y(1);
    y = Y(2);

    % dynamical equations
    dx = -x + x^3;
    dy = -c*y;

    % return dYdt
    dY = [dx; dy];
end
