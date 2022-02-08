clear all
clearvars -global
close all
format shorte

% Define variables
nx = 20;
ny = 20;


delta = 1;

% Create the solution matrix V
V = zeros(nx, ny);

% Create mesh grid
[X, Y] = meshgrid([1:nx], [1:ny]);

% Max number of iterations
numSim = 300; 

pauseTime = 0.01;

% Creating loop for iteration, solution matrix and variables.
for iSim = 1:numSim
    % Loop through the solution matrix
    for ix = 1:nx  % Loop through the x
        for iy = 1:ny  % Loop through the y
            % Check for boundary conditions
            if ix==1
                V(ix,iy) = 1;  % BC to 1 on the left side
            elseif ix==nx
                V(ix,iy) = 1;  % BC to 1 on the right side
            elseif iy == 1  % BC to 0 on the bottom side
                V(ix, iy) = 0;
            elseif iy == ny  % BC to 0 on the top side
                V(ix, iy) = 0;
            else
                V(ix, iy) = (V(ix+1,iy) + V(ix-1,iy) + V(ix,iy+1) + V(ix,iy-1))/4;
            end
        end
    end
   
    
    surf(X,Y,V);

  
    pause(pauseTime);
end

% Create matrix for electric field
[Ex, Ey] = gradient(-V);

% Plot  electric field
figure(2)
quiver(X, Y, Ex, Ey);