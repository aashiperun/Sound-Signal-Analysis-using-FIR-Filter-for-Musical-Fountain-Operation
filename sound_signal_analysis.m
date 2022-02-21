clc
clear all
load handel.mat
 
clear a;
a = arduino('COM4', 'Uno');
 
[y,Fs] = audioread('audio.mp3',[1*10^6, 3*10^6]);
t = ((0:1:length(y)-1)/Fs)';
 sound(y, Fs);
subplot(4,1,1)
plot(t,y)
xlabel('time')
ylabel('amplitude')
title('Audio Signal')
 
Length_audio=length(y);
df=Fs/Length_audio;
frequency_audio=-Fs/2:df:Fs/2-df;
FFT_audio_in=fftshift(fft(y))/length(fft(y));
 
N=66;
W=0.5;
w=window(@hamming,N+1);
subplot(4,1,2);
plot(1:N+1,w)
xlabel('frequency')
ylabel('amplitude')
title('Hamming Window')
 
[b1,a1]=fir1(N,W,'high',w);
[h1,w1]=freqz(b1,a1,256);
v=filter(b1,1,FFT_audio_in);
subplot(4,1,3)
plot(abs(h1));
xlabel('frequency')
ylabel('amplitude')
title('Hamming Window with High Pass Filter')
 
subplot(4,1,4)
plot(abs(fft(v)));
xlim([0 1.5*10^6])
xlabel('frequency')
ylabel('amplitude')
title('Frequency Spectrum of x(t)after filtering')
 
while(1)
if abs(fft(v))>0
    writeDigitalPin(a, 'D11', 1);
   writeDigitalPin(a, 'D9', 1);
 pause(2)
   writeDigitalPin(a, 'D9', 0);
else
    writeDigitalPin(a, 'D12', 1);
   writeDigitalPin(a, 'D8', 1);
    pause(2)
   writeDigitalPin(a, 'D8', 0);
end
end
