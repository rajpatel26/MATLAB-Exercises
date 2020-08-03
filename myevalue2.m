% WRITE YOUR SCRIPT HERE

n = 0;
actual_val = exp(1);
approx_val = 1/factorial(n);
diff = 1;


while diff >= 0.0001
    n = n + 1;
    approx_val = approx_val + 1/factorial(n);
    diff = abs(actual_val - approx_val);
end

fprintf('The built-in value of e is %.4f \n', actual_val);
fprintf('The approximation value of e is %.4f \n', approx_val);
fprintf('The value of n required for such accuracy is %d \n', n);
