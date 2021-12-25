%% In this toy example, let us look at a method of estimating PSD
% Power Spectral Density = PSD

clear all; clc;
%% Time-discrete signal
f = 100;
fs = 10*f; % sampling freq.
t = 0:1/fs:1;
x = cos(2*pi*f*t) + randn(size(t));

%% Perform the DFT through the FFT algo.
N = 2^7; % consider N-point DFT
delta = fs/N;
freqs = (-N/2:N/2-1) * delta;
X = fft(x, N); % N-point DFT

%% PSD Estimate with double-sided FFT
X_swapped = fftshift(X);
PSD = (1/(fs*N)) * abs(X_swapped).^2; % we rely on the double-sided FFT

figure()
plot(freqs, 10*log10(PSD), '--o')
xlabel('Frequency (Hz)')
ylabel('Power (dB)')
hold on
grid on 

%% Take the first (N/2 + 1) points (corres. to 0 Hz + positive freqs) 
X_FirstHalf = X(1:N/2+1); % the first (N/2 + 1) points
freqs_positive = (0:N/2) * delta; % 0 Hz + positive frequencies

%% PSD Estimate with one-sided FFT
PSD_FirstHalf = (1/(fs*N)) * abs(X_FirstHalf).^2;
PSD_FirstHalf(2:N/2) = 2 * PSD_FirstHalf(2:N/2); % 2 times of Part A

figure()
plot(freqs_positive, 10*log10(PSD_FirstHalf), '--*')
grid on
xlabel('Positive Frequency (Hz)')
ylabel('Power / Frequency (dB/Hz)')

%% Check the total power
sum(PSD)
sum(PSD_FirstHalf)
sum(PSD)/sum(PSD_FirstHalf)