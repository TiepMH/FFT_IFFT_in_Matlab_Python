clear all; clc;
%% Time-discrete signal
f = 10;
fs = 5.55*f; % sampling freq. >= 2 max signal freq. (according to Nyquist theorem)
phase = (1/3)*pi;
t = 0:1/fs:1; % time base
x = sin(2*pi*f*t + phase);

% figure()
% plot(t, x, '--o');
% title(['Sine wave with f = ', num2str(f), ' Hz']);
% xlabel('Time (s)');
% ylabel('Amplitude');

%% Perform the DFT through the use of the FFT algorithm
figure()
subplot(2, 1, 1);
N = 2^7; % consider N-point DFT    
n_range = 0:(N-1); % negative and positive frequencies
X = fft(x, N); % compute DFT using FFT      
%
plot(n_range, abs(X)); % NOTE: we only take the amplitude of X_n      
title(['Double-sided FFT with N = ', num2str(N), ' points']);   
xlabel('0 \leq n \leq N-1')        
ylabel('Amplitude');
xlim([n_range(1), n_range(N)])
ylim([0, 25])

hold on

subplot(2, 1, 2);
N = 2^7; % consider N-point DFT    
delta = fs/N; % freq. resolution
freqs = (-N/2:N/2-1) * delta; % negative and positive frequencies
X = fftshift(fft(x, N)); % compute DFT using FFT      
%
plot(freqs, abs(X)); % NOTE: we only take the amplitude of X_n      
title(['Double-sided FFT with N = ', num2str(N), ' points']);        
xlabel('Frequency (Hz)')        
ylabel('Amplitude');
xlim([freqs(1), freqs(N)])
ylim([0, 25])
