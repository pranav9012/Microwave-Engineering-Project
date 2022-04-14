clc;
close all;
clear all;
%----------Quesiton 7 -----------------%

% shows error in publishing when we have to take inputs.
% Uncomment the below z1 and z2 lines for Input from user.
z1 = input('Enter the value of z1:- ');
z2 = input('Enter the value of z2:- ');

%z1 = 100; z2 = 3.6;
%-------- ABCD parameters in terms of z1 and z2-----%
A = 1 + z1/(2*z2);
B = z1 + (z1^(2))/(4*z2);
C = 1/z2;
D = 1 + z1/(2*z2);
disp("The ABCD matrix is :- ")
T = [A , B ; C , D];
disp(T)
%------------Z parameters of the given T Network---------------%
z11 = z1/2 + z2;  z22 = z1/2 + z2;
z12 = z2;  z21 = z2;

%---------------Image Impedance-------------%
ZiT = (((z11 - z12)*2*z12)*(z11/(2*z12)+0.5))^(0.5);
disp('Image impedance is :- ');
disp(ZiT);
%----------------Propogation Constant----------%
e_gamma = z11/z12 + ((z11/z12)^(2) - 1)^(0.5);
disp('Propogation factor is :- ');
disp(e_gamma);

