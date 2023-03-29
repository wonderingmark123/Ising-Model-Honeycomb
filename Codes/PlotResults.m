
subplot 221
plot(kT / kTc, Emean, '.');

% hold on;
% window = (2^-3)*numTemps - 1;
% plot(kT / kTc, movmean(  Emean, window));
% plot(kT / kTc, movmedian(Emean, window));
% hold off;

title('Mean Energy Per Spin vs Temperature');
xlabel('kT / kTc');
ylabel('<E>');
grid on;

subplot 222
plot(kT / kTc, Mmean, '.');
grid on;
title('Magnetization vs Temperature');
xlabel('kT / kTc');
ylabel('M');
subplot 223
plot(kT / kTc, Cv, '.');
grid on;
title('Specfic Heat vs Temperature');
xlabel('kT / kTc');
ylabel('$C_v$','interpreter','latex');
subplot 224
plot(kT / kTc, Chi, '.');
grid on;
title('Susceptibility vs Temperature');
xlabel('k_BT / k_BT_c');
ylabel('$\chi$','interpreter','latex');
