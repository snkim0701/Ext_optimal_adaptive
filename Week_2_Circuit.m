
%% Week_2

syms x y a
f = a*x + 2*y;
g =2*x +y;
eqn =[f == 5, g == 4];
S =solve(eqn,x,y);
S.x
S.y
subs(S.x,a,2)

%% 
syms x y a
A =[a 2; 2 1];
B = [ 5;4];
X =A\B
X(1)
X(2)
subs(X(1),a,2)

%% Case-1 ,..resistors..
clear all; clc
syms R1 R2 R3 is
A =[(1/R1 + 1/R2)  -1/R2; -1/R2  (1/R2 + 1/R3)];
B=[is; 0]
x = A\ B;
vA = x(1)
vB = x(2)
pretty(vA)

%% Case-2 ,... resistors
clear all; clc
syms R is
A =[2.5/R   -0.5/R    -2/R; -0.5/R  3/R   -0.5/R ; -2/R  -0.5/R  3.5/R];
B=[is; 0; 0]
x = A\ B;
vA = x(1)
vB = x(2)
vC = x(3)
pretty(vA)

%% Case -3 Inductance

 syms t  iL vL
 iL = 10*exp(-500*t) * sin(2000*t);
 L = 0.0025;
 vL = L*diff(iL, 't')
 tt = 0:0.00001:0.004;
 iLtt = subs(iL,t,tt);
 vLtt = subs(vL,t,tt);
 subplot(2,1,1)
 plot(tt,iLtt, 'b','LineWidth',2) ; grid on
 %
 title('the inductane current')
 subplot(2,1,2)
 plot(tt,vLtt, 'b','LineWidth',2); grid on
 title('the inductance voltage')

%% Case -4 Capacitance 

 syms t  iC vC
 vC = 10*exp(-500*t) * sin(2000*t);
 C = 0.0025;
 iC = C*diff(vC, 't')
 tt = 0:0.00001:0.004;
 vCtt = subs(vC,t,tt);
 iCtt = subs(iC,t,tt);
 subplot(2,1,1)
 plot(tt,vCtt, 'b','LineWidth',2) ; grid on
 title(' the capacitance voltage')
 subplot(2,1,2)
 plot(tt,iCtt, 'b','LineWidth',2); grid on
 title('the capacitance current')

%% case-5 capacitor and resistor

clear all;clc
syms Vc(t)  Vs
R = 100;
C = 0.1;

T = R*C;  % time constant
Vs = sin(2*5*pi*t);

Vc = dsolve( diff(Vc(t)) == -T*Vc(t)+ Vs, Vc(0) ==0);

% for comparison

tt = 0:0.001:1;
Vstt = subs(Vs,t,tt);
Vctt = subs(Vc,t,tt);


subplot(2,1,1)
 plot(tt,Vstt, 'b','LineWidth',2) ; grid on
 title(' the source voltage')
 subplot(2,1,2)
 plot(tt,Vctt, 'b','LineWidth',2); grid on
 title('the capacitance voltage')



