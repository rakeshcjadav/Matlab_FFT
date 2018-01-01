%plot(abs(fft(audioread('music.wav'))));
format long
clear
file = 'kubbi-pathfinder.wav';
%file = 'bakri.mp3';
TotalSamples=length(audioread(file));
[x,Fs]=audioread(file);
offset = 0.040;
samplesperframe=[1, offset*Fs];
n = 1;%TotalSamples/samplesperframe(2);

fid = fopen('out.txt', 'wt+');
k = 1;
c = 0;
for nItr = 1:n
    currentsample=[k+(nItr-1)*samplesperframe(2), nItr*samplesperframe(2)+c];
    [y,Fs]=audioread(file, currentsample);
    N = currentsample(2) - currentsample(1);
    for l = 1:N
        p(l) = y(l);
    end
p;
    Y = fft(p, N);
   nItr;
   k = k-1;
   c = c-1;
    Y = abs( Y(1:N) ) ./ (N/2);
    f = Fs/N .* (0:N-1);  Y(Y==0) = eps; % avoiding log(0) --> >> help eps
  Y = 20 * log10(Y); % turn spec logarithmic
    
    Y% = Y(1:N) .* 100.0
   % ymin = min(Y);
   % ymax = max(Y);
   % fprintf(fid, '%12.8f', Y);
   %  fprintf(fid, '\n');
   % fprintf(fid, 'n: %d, min : %12.8f, max : %12.8f\n', nItr, ymin, ymax);
  % A = Y(0:20);
 %  print A
    plot(f,Y);
    grid on;
    pause(0.040);
end
fclose(fid);
% plot(f,Y);
% grid on;

% you can limit the spec to nyquist-frequency by calculatin up to N/2 points
