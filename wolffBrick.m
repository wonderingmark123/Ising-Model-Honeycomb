function spin = wolffBrick(spin, kT, J ,numIters)
%METROPOLIS The Metropolis algorithm.
%   spin = METROPOLIS(spin, kT, J) runs the Metropolis algorithm on a
%   configuration of spins with an coupling coefficient |J| at a
%   temperature |kT|. |spin| is a matrix of +/- 1's.
%   numIters is the number of iteration  for this simulation. Default value
%   is 2^8 * numel(spin)
prob = 1. - np.exp(-2*J/kT );


if nargin < 4
numIters = 2^8 * numel(spin);
end

for iter = 1 : numIters
    % Pick a random spin
    linearIndex = randi(numel(spin));
    [row, col]  = ind2sub(size(spin), linearIndex);
    cluster = [[row,col]];
        for elem = cluster
            if rand() >= prob   
            end
        end
        for elem = cluster
            self.spins[elem[0]][elem[1]] *= -1
        end
    % Find its nearest neighbors
    
    above = mod(row - 1 - 1, size(spin,1)) + 1;
    below = mod(row + 1 - 1, size(spin,1)) + 1;
    left  = mod(col - 1 - 1, size(spin,2)) + 1;
    right = mod(col + 1 - 1, size(spin,2)) + 1;
    
    if mod(row+col,2) == 0
    neighbors = [      spin(above,col);
        spin(row,left);         
                       spin(below,col)];
    else
        neighbors = [      spin(above,col);
        spin(row,right);         
                       spin(below,col)];
    end
    % Calculate energy change if this spin is flipped
    dE = 2 * J * spin(row, col) * sum(neighbors);
    
    % Boltzmann probability of flipping
    prob = exp(-dE / kT);
    
    % Spin flip condition
    if dE <= 0 || rand() <= prob
        spin(row, col) = - spin(row, col);
    end
end
