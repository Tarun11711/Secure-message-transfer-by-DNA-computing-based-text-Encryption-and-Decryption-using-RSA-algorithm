format shortg
st = clock
disp(st(1,6));
[p1, p2, M]=size(c1); % size of cipher text 
nm=zeros(p1,p2); % initialize nm to store the decrypted text values 
 %% RSA Decryption 
for i=1:p1      % Using this for loop to take one character at a time 
    for j=1:p2
qm1=dec2bin(d); % Decimal to Binary conversion of private key 
len1=length(qm1); % Storing the length of private key
nm=1;             
xy=1;             % For repeating the loop we are initializing xy=1 
while(xy<=len1)    
    if(qm1(xy)=='1') % If it is 1 we do the following computing 
       nm=mod(mod((nm^2),n)*c1(i,j),n);
    elseif(qm1(xy)=='0') % If it is 0 we do the following computing 
        nm=(mod(nm^2,n));
    end
     xy=xy+1;    % incrementing the index xy 
end
nm1(i,j)=nm;     % Decrypted RSA value is stored in nm1 
end
end
fprintf("RSA drcrypted values :\n");
disp(nm1);

%% DNA Decryption 
[nm_r, nm_c]=size(nm1); % row and column vector of decrypted text using RSA 
b=zeros(1,8);              
j=8;
q=zeros(nm_r,nm_c/4);% For converting in to 4 digits 2 binary pairs 
z=0;
K=1;
for I=1:nm_r          % Using the for loop for taking the row value and column values 
    for J=1:nm_c
        if z==nm_c     
            z=0;
        end
       if K>nm_c/4
           K=1;
       end
        for k=1:4
              if j==0
                    j=8;
              end
                if nm1(I,z+k)==65 % A (Adenine) Mapping ASCII to DNA then DNA to binary (00) and decryting 
                   b(j)=0;
                   b(j-1)=0;
                elseif nm1(I,z+k)==71 % G (Guanine)(01)
                   b(j)=1;
                   b(j-1)=0;
                elseif nm1(I,z+k)==67 % C (Cytosine) (10)
                   b(j)=0;
                   b(j-1)=1;
                elseif nm1(I,z+k)==84 % T (Thymine) (11) 
                   b(j)=1;
                   b(j-1)=1;
                end
                j=j-2;
        end
        X=bi2de(b); % Binary to Decimal 
        q(I,K)=X; % DNA decrypted value 
         z=z+4;
        K=K+1;
    end
end
fprintf('the Dna decrypted values are : \n ');
disp(q);
OUT=char(q);% Printing the Charaterstics value  of DNA Decrypted 
fprintf('decrypted message : \n ');
disp(OUT);
et = clock
disp(st(1,6));
tt=et-st;
fprintf ('time taken:');
disp(tt);
