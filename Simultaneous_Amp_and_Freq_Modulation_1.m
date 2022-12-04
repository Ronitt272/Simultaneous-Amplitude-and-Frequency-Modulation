clear all;
close all;


%%

 
 R = 1;
 fc = 85; % Carrier_frequency_
 fs = fc*10;
 dt=1/fs;
 t = 0:dt:1-dt;
      
 fm = 10;                   %Modulating signal frequency
 delta_f =35;
 k = delta_f/fm;             %modulation index of frequency modulation
xt= cos(2*pi*fm*t);
M=xt; %% message signal
%augment_for_cosine = 2*pi* (fc+ ( i*fm ) )*t;

FM = zeros(1,length(t));
%% Frequency Modulation
for i=-8000:8000
    j = besselj(i,k);
    augment_for_cosine = 2*pi* (fc+ ( i*fm ) )*t;
    
    FM_temp =j.* cos(augment_for_cosine);
    FM = FM+FM_temp;
end
y = FM;

 
 
 %% Performing Amplitude Modulation on FM signal to obtain simultaneous modulated signal
 m =0.50; % modulation index of amplitude modulation
 %y_amp =  amplitude_modulation(fm,m, t);
 y_amp=(1+ m.*sin(2*pi*fm*t));  %performing amplitude modulation
 y3 = y_amp .* y;             %superimposing AM on the earlier generated FM signal
 %%
 figure(1)
 subplot(2,1,1) ;
 plot(t,M,'r',t,y,'b');
 %ylim([-Ac+.10,Ac+.10]);
 title('Frequency Modulation')
 xlabel('Time (s)');
 ylabel('Amplitude');
 legend('Message Signal','Frequency Modulated Signal');
 
 subplot(2,1,2) ; 
    plot(t,M,'r',t,y3,'k');%grid on; ylim([-Ac-.5,Ac+.5]);
    title('Simultaneous Amplitude and Frequency Modulation')
     xlabel('Time (s)');
     ylabel('Amplitude');
     legend('Message Signal','simultaneous Amplitude and Frequency modulated signal'); 
 
%% frequency domain calculations
 f= -fs/2:1:fs/2-1;
 M_fft = fftshift(fft(M))/length(M);  %% Message signal frequency Domain amplitude
 P_fft = fftshift(fft(y))/length(y);  %% FM Modulated signal frequency Domain amplitude
 S_fft = fftshift(fft(y3))/length(y3); %% simultaneous AM and FM modulated signal frequency Domain amplitude
 
 
%% Power Calculation in dBm
Power_Spectrum_M = 10*log10((abs(M_fft).^2)/R*1000);  %Message signal power spectrum
Power_Spectrum_P = 10*log10((abs(P_fft).^2)/R*1000);  %Frequency Modulated signal power spectrum
Power_Spectrum_S = 10*log10((abs(S_fft).^2)/R*1000);  %simultaneous Frequency and Amplitude modulated signal power spectrum

%% 
 figure(2)
 subplot(3,1,1) ;
                 plot(f,Power_Spectrum_M,'r'); ylim([-80,20]);
                 title('Power Spectrum Representation of Message signal');
                 xlabel('Frequency (Hz)');
                 ylabel('Magnitude in dBm');                 
                 grid on;
                 hold on;
 subplot(3,1,2) ;
                 plot(f,Power_Spectrum_P,'b');ylim([-80,20]);
                 title('Power Spectrum Representation of the Frequency Modulated signal');
                 xlabel('Frequency (Hz)');
                 ylabel('Magnitude in dBm');
                 grid on;
                 hold on;
 
 subplot(3,1,3) ;
                 plot(f,Power_Spectrum_S,'k');ylim([-80,20]);
                 title('Power Spectrum Representation of the simultaneous Amplitude and Frequency modulated signal');
                 xlabel('Frequency (Hz)');
                 ylabel('Magnitude in dBm'); 
                 grid on;
%_________________________________________________________________________________________________________________ 
 %%                
           figure(3)
 subplot(3,1,1) ;
                 plot(f,abs(M_fft),'r');
                 title('Frequency Domain Representation of the Message Signal');
                 xlabel('Frequency (Hz)');
                 ylabel('Magnitude');                 
                 grid on;
                 hold on;
 subplot(3,1,2) ;
                 plot(f,abs(P_fft),'b');
                 title('Frequency Domain Representation of the Frequency Modulated signal');
                 xlabel('Frequency (Hz)');
                 ylabel('Magnitude');
                 grid on;
                 hold on;
 
 subplot(3,1,3) ;
                 plot(f,abs(S_fft),'k');
                 title('Frequency Domain Representation of the simultaneous Amplitude and Frequency Modulated signal');
                 xlabel('Frequency (Hz)');
                 ylabel('Magnitude'); 
                 grid on;       
 
%% Error between frequency spectrum of FM_original and FM_simultaneous_modulation
freq_spectrum_Error = abs(abs(P_fft) - abs(S_fft));
power_spectrum_Error = abs(Power_Spectrum_P - Power_Spectrum_S);
figure(4)

subplot(2,1,1);
                 plot(f,freq_spectrum_Error,'b');
                 title('Absolute Error between frequency spectrums of FM and simultaneous modulated signals');
                 xlabel('Frequency (Hz)');
                 ylabel('Error_Magnitude');
                 grid on;
                 hold on;
                 
subplot(2,1,2);
                 plot(f,power_spectrum_Error,'b');
                 title('Absolute Error between power spectrums of FM and simultaneous modulated signals');
                 xlabel('Frequency (Hz)');
                 ylabel('Error_Magnitude');
                 grid on;
                 hold on;


