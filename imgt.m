% reading the image 
A=imread('C:\Users\sandt\Downloads\ps2_pic.jpg');
og=size(A);
% showing the image 
imshow(A)

size(A)

% d is 1D array of the image 
d=reshape(A,1,[]);

%%%%%%%%%%%%%%%%%%
%# create binary string - the 4 forces at least 4 bits
d = dec2bin(d,8);

%# convert back to numbers (reshape so that zeros are preserved)
out = str2num(reshape(d',[],1))'
%%%%%%%%%%%%%%%%%%%%%%%%%%

m = out 

% Declaring a random message signal 
% Using randi
%m = randi([0,1],1,16)

% converting 0's to -1
m = 2*m - 1;

% lets convert it to its electrical version
ta = 0.1     %pulse duration 0.1s
dt = ta/500;  % sampling period
t = dt:dt:ta*size(m, 2); 

s = m(ceil(t/ta));
stem(t, s);
s1=s>0
stem(t,s1)
title("Message signal")

fc = 1e4    %10kHz
modulated = s .* cos(2*pi*fc*t);


plot(t,modulated)
hold on
received = awgn(modulated, 10);
plot(t,received)
title("Message signal")
hold off

c = cos(2*pi*fc*t);
demod = received.*c;

% conv function is for summing all values in  a window
% of time from a given instant. multiply it with dt and
% we get our integrated version.
demod = conv(demod, dt*ones(1, ta/dt), 'same');
stem(t, demod)

hist(demod)
title("Received signal")
%note that the signal received is not perfect
% hence we will do some slight thresholding
demod = demod > 0;
stem(t, demod);
title("Demodulated signal")

% refer to digital.mlx
% to extract individual values we sample
% starting from the first sample at ta/2 we take a gap of ta until the end.
sampling_times = ta/2:ta:ta*size(m, 2)

% in actual vector s, the time 't' corresponds to the index t/dt.
m_reconstructed = s(floor(sampling_times/dt))

% note that the message is -1 for 0. we can simply threshold it again
m_reconstructed = m_reconstructed > 0

m_recons_reshaped = reshape(m_reconstructed,[size(A,1)*size(A,2),8])

final_1d = join(m_recons_reshaped,"")

final_2d = reshape(final_1d,[size(A,1),size(A,2)])

imshow(final_2d)