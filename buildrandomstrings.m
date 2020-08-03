% WRITE YOUR FUNCTION HERE

function str_arr = buildrandomstrings(n)
  alphabets = 'a':'z';
  len = abs(n);
  word = randi(length(alphabets),[1,len]);
  str_arr = cell(1,len);
  for i = 1:len
    str_arr{i} = alphabets(word(1:i));
  end
  if n < 0
    str_arr = fliplr(str_arr);
  end    
end        
