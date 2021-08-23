format shortg 
st = clock   % storing starting time 
disp(st(1,6)); % Displaying the time taken in ms 

et = clock      % Storing ending time 
disp(st(1,6));   % Displaying the time taken in ms 
tt=et-st;     % Difference between the starting and the ending time
fprintf ('time taken:'); % This difference give the total time taken
disp(tt);  % Displaying the time taken for encryption or decryption 
