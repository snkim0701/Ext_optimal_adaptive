

%% 
syms x
f= x+3;
g= x^2 * exp(-x^2)
h = sin(cos(x))
subs(f,x,1)
subs(g,x,1)
subs(h,x,pi)
sin(1)

y = 2*(x+3)^2 /(x^2 + 6*x +9);
simplify(y)

%% comparison to numerical expression
clear all; clc
x = -5:0.01:5;

for i = 1:size(x,2);
        f(i) = 2*(x(i)+3)^2 /(x(i)^2 + 6*x(i) +9);
end
plot(f)

%% %% Solve Algebraic Equations 
clear all; clc
% One symbolic variables
syms x
solve(x+3 ==0)
solve(x^2 +3*x +2 ==0)

%% 
clear all; clc
syms x a b c
solve(a*x+b==0)
S =solve(a*x^2 + b*x +c ==0)
pretty(S)

%% multivariables
syms x y
f = x + 2*y;
g =2*x +y;
eqn =[f == 5, g == 4];
S =solve(eqn,x,y);
S.x
S.y


%%  undefined linear equations
syms x y a
f = a*x + 2*y;
g =2*x +y;
eqn =[f == 5, g == 4];
S =solve(eqn,x,y);
S.x
S.y
subs(S.x,a,2)

%% non-linear equation
clear all;clc
syms V V0 R C T
f = V-V0*exp(-T/(R*C));
%f = Q*R-T;
S = solve(f==0,R)

%% derivatives
clear all;clc
syms x

diff(x^3)
diff(x^3 + 1/x)
diff(exp(-x^2))
diff(sin(x))
diff(sin(cos(x)))

%% first order  scalar ,homogenous 

clear all;clc
syms x(t) a x0
S =dsolve(diff(x) == -a*x ,x(0) == x0)


%% first order scalr , inhomogeneous 

clear all;clc
syms x(t) a x0
S =dsolve(diff(x) == -a*x + sin(t) ,x(0) == x0)

Temp=subs(S,a,0.01)
% Temp = subs(Temp,x0,1)
fplot(subs(Temp,x0,1)); grid on
axis([0 100 -2 4])
%%
clear all;clc
syms V(t) R C V0
S =dsolve(diff(V) == -1/(R*C)*V + sin(t) ,V(0) == V0)

