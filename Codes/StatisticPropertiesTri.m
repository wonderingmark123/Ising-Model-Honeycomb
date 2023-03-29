function [E,M,Cv,Chi] = StatisticPropertiesTri(spin,kT,J,testingIter,testingPerEnergy)
if nargin < 5;testingPerEnergy = numel(spin);end
if nargin < 4;testingIter = 1e2 ;end
Energy = zeros(testingIter,1);
Magnetization = zeros(testingIter,1);


for testidex = 1: testingIter
    spin = metropolisTri(spin, kT,J, testingPerEnergy);
    Energy(testidex)        = energyIsingTri(spin, J);
    Magnetization(testidex) = magnetizationIsing(spin);
end


E   = mean(Energy);
M   = mean(Magnetization);
Cv  = 1./kT.^2*(mean(Energy.^2) - E.^2);
Chi = 1./kT *(mean(Magnetization.^2) - M.^2 );
end