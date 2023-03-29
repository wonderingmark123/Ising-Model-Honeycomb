function spin = initSpinsDiluted(numSpinsPerDim, p,P_amp)
%INITSPINS Initialize a configuration of spins with impurity.
%   spin = initSpinsImpurity(numSpinsPerDim, p) returns a configuration of spins
%   with |numSpinsPerDim| spins along each dimension and a proportion |p|
%   of them pointing upwards. |spin| is a matrix of +/- 1's and 0 s.
%   The distribution between 1 and 0 is depending on the P_amp.

%   Copyright 2017 The MathWorks, Inc.

spin = sign(p - rand(numSpinsPerDim, numSpinsPerDim));
DilutedPoints = randperm(numel(spin),round(numel(spin).*P_amp) );

spin(DilutedPoints) = 0;
