clc;
close all;
clear all;
%----------For High pass constant-k Filter--------------%

% shows error in publishing when we have to take inputs.
% Uncomment the below C ,L and f lines for Input from user.
C = input('Enter the Value of Capacitance in micro Farad:- ');
L = input('Enter the Value of Inductance in milli Henry:- ');
f = input('Enter the value of Frequency in Giga Hertz: -');
% Here is f is not needed , we need the frequency for when we want to find
% Image Impedance

%C = 20; L = 5;
C = C * (10^(-6));
L = L * (10^(-3));
f = f * (10)^9;
omega = 2*pi*f;
%-------------Cutoff Frequency-------------%
omega_c = 1/(4*L*C)^(1/2);
%disp('Value of omega_c');
%disp(omega_c);
%disp('range of w');
w = linspace(0,3*omega_c,1000);


%--------------Propogation Factor-------------%
% e_gamma = 1 + z1/(2*z2) + (z1/z2  + z1^2/(2*z2)^2)^(1/2) on solving in
% terms of omega and omega_c we get:-
e_gamma = zeros(1,length(w));
for k = 1 : length(w)
    e_gamma(k) = 1 - 2*((omega_c^2)/w(k)^2) +((2*omega_c/w(k))*(((omega_c^2/w(k)^2) - 1)^(1/2)));
end
propogation_constant = log(e_gamma);
alpha = real(propogation_constant);
beta = imag(propogation_constant);
%--------------Plot-----------------%
figure(1);
p = plot(w,abs(alpha),w,abs(beta),'r');
p(1).LineWidth = 2;
p(2).LineWidth = 2;
disp(p);
xline(omega_c,'-','\omega_c');
legend('\alpha','\beta','\omega_c');
title('\alpha and \beta  VS \omega of a constant-k High pass filter');
xlabel('\omega');
ylabel('\alpha,\beta');

