clear
format long
TotalSamples=length(audioread('notify.wav'));
channel = 2;
t=[1:1:TotalSamples];
t1=[1:1:TotalSamples/channel];
clear x Fs
[x,Fs]=audioread('notify.wav', 'double');
figure(4);
plot(t,x(t));
grid on

X = fft(x, TotalSamples);
f = Fs/TotalSamples .* (0:TotalSamples-1);
X = abs( X(1:TotalSamples) ) ./ (TotalSamples/2);
%X = 20 * log10(X); % turn spec logarithmic
figure(7);
plot(f,X);
grid on;