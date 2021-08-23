clc
clear all
close all
format shortg
st = clock
disp(st(1,6));
X='WIRELESS AND MOBILE COMMUNICATION';
[m n]=size(X); % Storing the size of the text in  m rows and n columns ( here it is 1,16) 
[p1 p2]=size(X);
L='';          % Empty string (temporary variable used to store the DNA representation of each charater)
z=0;           
%% DNA Encryption 
Y=zeros(m,n*4); % Actual DNA encrypted value 
for i=1:n
        q=X(1,i); % Taking and reading each character one by one from the plain text 
        q=q-0;    % Converting it into the ASCII value 
        b=bitget(q,8:-1:1); % Getting the Binary bits for the each character input of q
         if(z==n*4) % For each character we map it with 4 DNA characters( text size * 4) 
             z=0;
         end
        for p=1:2:8  % DNA mapping 
            if(b(p)==0)&&(b(p+1)==0) 
                L=strcat('A',L);      % A (Adenine) (if 00 then assign A) 
            elseif(b(p)==0)&&(b(p+1)==1)
                L=strcat('C',L);       % C (Cytosine) (01 = C)
            elseif(b(p)==1)&&(b(p+1)==0)
                L=strcat('G',L);         % G (Guanine)(10 = G)
            elseif(b(p)==1)&&(b(p+1)==1)
                L=strcat('T',L);       % T (Thymine) (11 =T )
            end
        end
         L=reverse(L);   % As the string appending is done from left to right , we are reversing it to obtain the correct order 
         for k=1:4
            Y(m,z+k)=L(k); % Copies converted DNA characters into Y 
         end
         L=erase(L,L);  % Earasing L to take the next character in the text 
         z=z+4;  % Index for Y , which tells how many characters we appended and it will stopped once max lit i.e text size* 4 reaches 
end
fprintf('the Dna encrypted values are\n ');
disp(Y);
fprintf('the DNA encrypted text is\n');
disp(char(Y));
%% RSA Encrytion 

%% Generating the Public and private key
p=13;
q=17;
n=p*q;
phi=(p-1)*(q-1);
val=0;
cd=0;
while(cd~=1 | val==0)
n1=randi(n,1,1);
e=randi([2 n1],1,1);
 val=isprime(e);
 cd=gcd(e,phi);
 end
val1=0;
d=0;
while(val1~=1);
d=d+1;
val1=mod(d*e,phi);
end
fprintf('\nPublic key is (%d,%d)',e,n);
fprintf('\nPrivate key is (%d,%d)\n',d,n);

%% Starting the process of RSA encrytion 
c1=zeros(p1,p2*4); % Storing the DNA encrypted cipher text 
for i=1:p1
    for j=1:p2*4
    m=Y(i,j);
    diff=0;
    if(m>n);
        diff=m-n+1;
    end
    m=m-diff;
qm=dec2bin(e);% Decimal to binary conversion of public key e 
len=length(qm);
c=1;
xz=1;
while(xz<=len)  
    if(qm(xz)=='1')
      c=mod(mod((c^2),n)*m,n);
    elseif(qm(xz)=='0')
        c=(mod(c^2,n));
    end
    xz=xz+1;
end
c1(i,j)=c;

    end
end
fprintf('the RSA encrypted values are\n ');
disp(c1);
fprintf('the encrypted text is : \n ');
disp(char(c1));
et = clock
disp(st(1,6));
tt=et-st;
fprintf ('time taken:');
disp(tt);
