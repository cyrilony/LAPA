clear all
clearvars -global
close all
format shorte

% Define variables
nx = 20;
ny = 20;

% Create the solution matrix V
V = zeros(nx, ny);

% Create mesh grid
[X, Y] = meshgrid([1:nx], [1:ny]);

% Max number of iterations
numSim = 300; 

pauseTime = 0.01;

% Creating loop for iteration, solution matrix and variables.
for iSim = 1:numSim
    for ix = 1:nx  
      for iy = 1:ny 
            % Check boundary conditions
        if iy==1
                V(ix,iy) = 1;  % BC to 1 on the left side
         elseif iy==ny
                V(ix,iy) = 0;  % BC to 0 on the right side
        elseif ix == 1  % BC to 0 for bottom
                V(ix, iy) = V(ix+1, iy);
        elseif ix == nx  % BC to 0 for top
                V(ix, iy) = V(ix-1, iy);
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