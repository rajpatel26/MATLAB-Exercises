% WRITE YOUR FUNCTION HERE

function parts = waferstore(p,q,cp)
    if length(p) == length(q) && length(q) == length(cp)
       parts = struct('partno',num2cell(p),'quantity',num2cell(q),'costper',num2cell(cp));
       fprintf('%d %.2f\n',[p;q.*cp]);
    else
       fprintf('You entered vectors of different sizes, vectors needs to be same size');
    end
end
