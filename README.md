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

![image](https://user-images.githubusercontent.com/68660836/227349643-aef5bca8-a973-4de1-b132-84ae58caaed6.png)

# Frequency Modulation Estimation 

<img width="554" alt="image" src="https://user-images.githubusercontent.com/68660836/227356571-66070ce8-0868-42de-b7d1-a40607d39c85.png">


# Power Spectrum

For a given signal, the power spectrum gives a plot of the portion of a signal's power (energy per unit time) falling within given frequency bins. After some mathematical manipulations of Bessel’s equations in order to collect spectral components, one obtains:

![image](https://user-images.githubusercontent.com/68660836/227354177-281b5d97-23b8-4d14-9ec4-d72d24741543.png)

![image](https://user-images.githubusercontent.com/68660836/227354305-f5fd519b-0d29-44de-9736-c22655f94f52.png)

It is evident that there are components at the infinite set of frequencies. The power distribution is centered at the carrier frequency. The crucial thing resulting from the properties of Bessel function is that higher the parameter k, which is the modulation index of Frequency Modulation, the more dispersed is the power distribution. The bandwidth of single-tone angle modulated signal can be estimated by
 
Carson’s rule, which states that appoximately 98 % of the total power is contained in the bandwidth, B, where, B = 2 * (k + 1) * fm
The similar result holds for simultaneous angle and amplitude modulation, therefore, it is possible to approximate the power of spectral component Pn at frequency f = fc + n*fm , n = 0, ±1, ±2, . . .

The first term in square bracket corresponds to pure angle modulation, while the second term is excited by amplitude modulation. This term is responsible for the spectral leakage and power spectrum asymmetry following from sin(∆) term and Bessel function property.



