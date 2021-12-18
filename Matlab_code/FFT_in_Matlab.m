clear all; clc;
%% Time-discrete signal
f = 10;
fs = 5*f; % sampling freq. >= 2 max signal freq. (according to Nyquist theorem)
phase = (1/3)*pi;
t = 0:1/fs:1; % time base
x = sin(2*pi*f*t + phase);

figure()
plot(t, x, '--o');
title(['Sine wave with f = ', num2str(f), ' Hz']);
xlabel('Time (s)');
ylabel('Amplitude');

%% Perform the DFT through the use of the FFT algorithm
figure()
subplot(3, 1, 1);
N = 2^5; % consider N-point DFT    
delta = fs/N; % freq. resolution
freqs = (-N/2:N/2-1) * delta; % negative and positive frequencies
X = fftshift(fft(x, N)); % compute DFT using FFT      
%
plot(freqs, abs(X)); % NOTE: we only take the amplitude of X_n      
title(['Double-sided FFT with N = ', num2str(N), ' points']);   
xlabel('Frequency (Hz)')        
ylabel('Amplitude');
ylim([0, 25])

hold on

subplot(3, 1, 2);
N = 2^7; % consider N-point DFT    
delta = fs/N; % freq. resolution
freqs = (-N/2:N/2-1) * delta; % negative and positive frequencies
X = fftshift(fft(x, N)); % compute DFT using FFT      
%
plot(freqs, abs(X)); % NOTE: we only take the amplitude of X_n      
title(['Double-sided FFT with N = ', num2str(N), ' points']);        
xlabel('Frequency (Hz)')        
ylabel('Amplitude');
ylim([0, 25])

subplot(3, 1, 3);
N = 2^9; % consider N-point DFT    
delta = fs/N; % freq. resolution
freqs = (-N/2:N/2-1) * delta; % negative and positive frequencies
X = fftshift(fft(x, N)); % compute DFT using FFT    
%
plot(freqs, abs(X)); % NOTE: we only take the amplitude of X_n      
title(['Double-sided FFT with N = ', num2str(N), ' points']);        
xlabel('Frequency (Hz)')        
ylabel('Amplitude');
ylim([0, 25])
