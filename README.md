# Simultaneous-Amplitude-and-Frequency-Modulation
• Implemented an IEEE Research paper titled, ‘Angle Modulation Indices Measurement in the Presence of Amplitude Modulation’.

• The paper presented an automated measurement of the phase/frequency indices of angle modulation in the frequency domain on the condition that a signal source is simultaneously angle and amplitude modulated by the same phase shifted harmonic signals.

• Implemented the research paper on MATLAB as well as Simulink.

• The research paper was implemented on MATLAB by first generating simple Frequency Modulated signals and then performing amplitude modulation on these FM signals to ultimately obtain the Simultaneous Amplitude and Frequency Modulated signals.

• A spectral analysis of these signals was performed by generating their Frequency and Power Spectrums, and comparing the same to those of simple Frequency Modulated signals.

• Further spectral analysis was performed by showing the variation of the squared deviation between the power spectrum of the Frequency Modulated Signals and the power spectrum of the simultaneous Amplitude and Frequency Modulated signals that were generated, for varying values of Amplitude Modulation indices. 

• The research paper was implemented on Simulink by designing a block model of Frequency Modulated Waves and Simultaneous Amplitude and Frequency Modulated Waves

•The power spectrum was then displayed with the help of a digital transfer function.

# Amplitude Modulation Estimation

<img width="646" alt="image" src="https://user-images.githubusercontent.com/68660836/227356942-0806acdb-cbe3-4218-8ab6-7dc082f9f81c.png">


# Frequency Modulation Estimation 

<img width="554" alt="image" src="https://user-images.githubusercontent.com/68660836/227356571-66070ce8-0868-42de-b7d1-a40607d39c85.png">


# Power Spectrum

For a given signal, the power spectrum gives a plot of the portion of a signal's power (energy per unit time) falling within given frequency bins. After some mathematical manipulations of Bessel’s equations in order to collect spectral components, one obtains:

![image](https://user-images.githubusercontent.com/68660836/227354177-281b5d97-23b8-4d14-9ec4-d72d24741543.png)

![image](https://user-images.githubusercontent.com/68660836/227354305-f5fd519b-0d29-44de-9736-c22655f94f52.png)

It is evident that there are components at the infinite set of frequencies. The power distribution is centered at the carrier frequency. The crucial thing resulting from the properties of Bessel function is that higher the parameter k, which is the modulation index of Frequency Modulation, the more dispersed is the power distribution. The bandwidth of single-tone angle modulated signal can be estimated by Carson’s rule, which states that appoximately 98 % of the total power is contained in the bandwidth, B, where, B = 2 * (k + 1) * fm

The similar result holds for simultaneous angle and amplitude modulation, therefore, it is possible to approximate the power of spectral component Pn at frequency f = fc + n*fm , n = 0, ±1, ±2, . . .

The first term in square bracket corresponds to pure angle modulation, while the second term is excited by amplitude modulation. This term is responsible for the spectral leakage and power spectrum asymmetry following from sin(∆) term and Bessel function property.

![image](https://user-images.githubusercontent.com/68660836/227357257-9f37fe69-39ed-4a43-81ad-2d40062eb1d1.png)

Due to the additional components generated from the Amplitude Modulation counterpart, we can see that a particular asymmetry has been introduced to the power spectrum of the simultaneous Amplitude and Frequency Modulation signal.

# Frequency Spectrum Measurement

- The project has been implemented on MATLAB and Simulink, so in order to implement the frequency spectrum of the Simultaneous Amplitude and Angle Modulated signal generated, we make the use of ‘fft’ function available on MATLAB to calculate the Discrete Fourier Transform values associated with each value of frequency.
- For obtaining the same on Simulink, we generate the required signal, and make use of a buffer and a spectrum analyzer to generate the Fourier spectrum of the simultaneously modulated signal so formed.

# Power Spectrum Measurement

- Since the project has been implemented on MATLAB, the power spectrum has been measured using the knowledge of logarithms as well the ‘fft’ function available on MATLAB to calculate the Fast Fourier Transform. Through the outputs as well as code shared, we see that the power spectrum is calculated such that the y-axis contains values in dbm and the x-axis contains the range of frequency for which we are calculating the power spectrum.
- For obtaining the same on Simulink, we first generate the time varying simultaneously Amplitude and Frequency modulated signal, and then we make use of a buffer and a spectrum analyzer to obtain the frequency spectrum. After that, we choose a logarithmic scale to finally obtain the power spectrum of the simultaneously amplitude and frequency modulated wave.

# Results 

Through the use of the various functions and tools available on MATLAB and Simulink, we were able to perform a detailed study of how the technique of carrying out Amplitude Modulation of the already frequency modulated signals by the same phase shifted signals results into Frequency and Power Spectrum of it’s own that have their own unique properties. Some interesting points of difference between FM and Simultaneous FM and AM waves are:

1.) The frequency as well as Power Spectrum of FM modulated wave are symmetric about the carrier frequency. Whereas, in the case of Simultaneous FM and AM wave, the frequency as well as the Power Spectrum are not symmetric about the carrier frequency.

2.) In the time varying form of Simultaneous Frequency and Amplitude Modulation signal generated, we can see the presence of an Amplitude Modulation envelope. Whereas, we cannot witness any such envelope in the case of the general Frequency Modulated Wave.



