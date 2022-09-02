clc
clear
close all;

% Parameter Setup
Fs = 1000;                    % Sampling frequency
Fn = Fs/2;                    % Nyquist Frequency
T = 1/Fs;                     % Sample time
L = 1000;                     % Length of signal
t = (0:L-1)*T;                % Time vector
NFFT = 2^nextpow2(L);         % Next power of 2 from length of y

% Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
x = 0.7*sin(2*pi*50*t) + sin(2*pi*400*t); % Original signal
y = x + 2*randn(size(t));                 % Sinusoids plus noise

% Signal Corrupted with Zero-Mean Random Noise
figure(1)
plot(Fs*t(1:50),y(1:50))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('time (milliseconds)')

%% FFT - 1
Y = fft(y,NFFT)/L;                     % Normalized Fourier Transform Of Data
f = linspace(0, 1, NFFT/2+1)*Fn;       % Frequency Vector (For ‘plot’ Call)

% plot
figure(2)
plot(f, 2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t)_1')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
grid on

%% FFT - 2
FT_Signal = fft(y)/L;                  % Normalized Fourier Transform Of Data
Fv = linspace(0, 1, fix(L/2)+1)*Fn;    % Frequency Vector (For ‘plot’ Call)
Iv = 1:length(Fv);                     % Index Vector (Matches ‘Fv’)

% plot
figure(3)
plot(Fv, abs(FT_Signal(Iv))*2)
title('Single-Sided Amplitude Spectrum of y(t)_2')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
grid on