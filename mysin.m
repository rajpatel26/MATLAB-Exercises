% WRITE HERE YOUR FUNCTION FOR EXERCISE 3
% marking id = 5476 %

function mysin(p1,p2)
 
 colour_choice = menu('Choose your colour','red','blue','green');
 style_choice = menu('Choose your style for points','circle','star');
 
 switch colour_choice
     case 1
         colour = 'red';
     case 2
         colour = 'blue';
     case 3
         colour = 'green';
     otherwise
         colour = '';
 end
 
 switch style_choice
     case 1
         style = 'o';
     case 2
         style = '*';
     otherwise
         style = '';
 end
 
 choices = strcat(colour,style,'-');
 plt1 = (0:2*pi/(p1-1):2*pi);
 plt2 = (0:2*pi/(p2-1):2*pi);

 subplot(2,1,1);
 plot(plt1, sin(plt1), choices);
 title([num2str(p1), ' points'])

 grid on

 subplot(2,1,2);
 plot(plt2, sin(plt2), choices);
 title([num2str(p2), ' points'])

 grid on
 
end

