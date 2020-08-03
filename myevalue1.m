% WRITE YOUR SCRIPT HERE

actual_val = exp(1);
diff = 1;
n = 0;

while diff >= 0.0001
    n = n + 1;
    approx_val = 1/((1 - 1/n) ^ n);
    diff = abs(actual_val - approx_val);
end

fprintf('The built-in value of e is %.4f \n', actual_val);
fprintf('The approximation value of e is %.4f \n', approx_val);
fprintf('The value of n required for such accuracy is %d \n', n);
