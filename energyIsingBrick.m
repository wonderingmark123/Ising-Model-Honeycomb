function Emean = energyIsingBrick(spin, J)
%ENERGYISING Mean energy per spin.
%   Emean = ENERGYISING(spin, J) returns the mean energy per spin of the
%   configuration |spin|. |spin| is a matrix of +/- 1's. |J| is a scalar.

%   Copyright 2017 The MathWorks, Inc.
sumOfNeighbors = 0;
for linearIndex = length(spin)
    [row, col]  = ind2sub(size(spin), linearIndex);

    % Find its nearest neighbors

    above = mod(row - 1 - 1, size(spin,1)) + 1;
    below = mod(row + 1 - 1, size(spin,1)) + 1;
    left  = mod(col - 1 - 1, size(spin,2)) + 1;
    right = mod(col + 1 - 1, size(spin,2)) + 1;

    if mod(row+col,2) == 0
        sumOfNeighbors = sumOfNeighbors + ...
                        sum([spin(above,col);
                            spin(row,left);
                            spin(below,col)]);
    else
        sumOfNeighbors =  sumOfNeighbors + ...
                        sum([spin(above,col);
                            spin(row,right);
                            spin(below,col)]);
    end
end

Em = - J * spin .* sumOfNeighbors;
E  = 0.5 * sum(Em(:));
Emean = E / numel(spin);
