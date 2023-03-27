function spin = initSpinsImpurity(numSpinsPerDim, p,Amp,P_amp)
%INITSPINS Initialize a configuration of spins with impurity.
%   spin = initSpinsImpurity(numSpinsPerDim, p,Amp,P_amp) returns a 
%   configuration of spins with |numSpinsPerDim| spins along each dimension 
%   and a proportion |p| of them pointing upwards. |spin| is a matrix of 
%   +/- 1's and +/- Amp s. The distribution between 1 and Amp is depending
%   on the P_amp.
%   Copyright 2017 The MathWorks, Inc.

spin = sign(p - rand(numSpinsPerDim, numSpinsPerDim));

Imp =logical (sign(P_amp - rand(numSpinsPerDim, numSpinsPerDim))+1);
spin(Imp) = spin(Imp) .* Amp;