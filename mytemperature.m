% WRITE HERE YOUR FUNCTION FOR EXERCISE 6
% marking id = 5476 %

function temp = mytemperature(i,j)
 temp(1,1) = min(i,j);
 temp(2,1) = max(i,j);
 temp(1,2) = (temp(1,1)-32)*(5/9);
 temp(2,2) = (temp(2,1)-32)*(5/9);
 temp = [temp(1,1),temp(1,2);temp(2,1),temp(2,2)];
 temp_conversion(temp);
end

function temp_conversion(conversion_matrix)
 fprintf('  Degree F  Degree C\n');
 disp(conversion_matrix);
end