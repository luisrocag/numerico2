fa = @(t) ones(size(t));
fb = @(t) zeros(size(t));
fc = @(t) -10*t;
h=1/24; a=0; b=1; x_a=1; x_b=2;
tt = a:h:b;n=size(tt,2);
vect_a = fa(tt); vect_b = fb(tt); 
vect_c = fc(tt);
diag_ii = (-2/h^2 + vect_b(2:n));
diag_sup = (1/h^2 + 1/(2*h)*vect_a(2:n-1));
diag_inf = (1/h^2 - 1/(2*h)*vect_a(3:n));
mat_A = diag(diag_ii) + diag(diag_sup,1) ...
        +diag(diag_inf,-1);
mat_B = vect_c(2:n);
mat_B(1)  -=(1/h^2 - 1/(2*h)*vect_a(1))*x_a; 
mat_B(n-1)-=(1/h^2 + 1/(2*h)*vect_a(n-1))*x_b;