import numpy as np
from scipy.fft import fft, fftshift
import matplotlib.pyplot as plt

""" Time-discrete signal """
f = 10
fs = 5*f  # sampling freq. >= 2 max signal freq. (according to Nyquist theorem)
phase = (1/3)*np.pi
t = np.array([i*(1/fs) for i in range(fs+1)])
x = np.sin(2*np.pi*f*t + phase)

plt.figure()
plt.plot(t, x, '--o')
plt.title("Sine wave with f = {:2.0f}".format(f) + ' Hz')
plt.xlabel("Time (s)", fontsize=12)
plt.ylabel("Amplitude", fontsize=12)

""" Perform the DFT through the use of the FFT algorithm """
fig, axs = plt.subplots(3, figsize=(4, 6), sharey=True)
fig.subplots_adjust(hspace=0.5)  # adjust the spacing

N = 2**5
delta = fs/N
freqs = np.array([(-N/2 + i)*delta for i in range(N)])
X = fftshift(fft(x, N))
#
axs[0].plot(freqs, abs(X), '-')
axs[0].set_title("Double-sided FFT with N = %2.0f" % N + ' points')
axs[0].set_xlabel('Frequency (Hz)')
axs[0].set_ylabel('Amplitude')
axs[0].set_xlim([freqs[0], freqs[-1]])
axs[0].set_ylim([0, 25])

N = 2**7
delta = fs/N
freqs = np.array([(-N/2 + i)*delta for i in range(N)])
X = fftshift(fft(x, N))
#
axs[1].plot(freqs, abs(X), '-')
axs[1].set_title("Double-sided FFT with N = %2.0f" % N + ' points')
axs[1].set_xlabel('Frequency (Hz)')
axs[1].set_ylabel('Amplitude')
axs[1].set_xlim([freqs[0], freqs[-1]])
axs[1].set_ylim([0, 25])

N = 2**9
delta = fs/N
freqs = np.array([(-N/2 + i)*delta for i in range(N)])
X = fftshift(fft(x, N))
#
axs[2].plot(freqs, abs(X), '-')
axs[2].set_title("Double-sided FFT with N = %2.0f" % N + ' points')
axs[2].set_xlabel('Frequency (Hz)')
axs[2].set_ylabel('Amplitude')
axs[2].set_xlim([freqs[0], freqs[-1]])
axs[2].set_ylim([0, 25])

fig.tight_layout()
