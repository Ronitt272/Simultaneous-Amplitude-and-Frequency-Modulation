close all
clear all;

%clear all;

%%

 
 R = 50; 
 fc = 540;         % Carrier_frequency
 Tc =1/fc;
 fm = 10;           %Modulating_signal_frequency_
 k =10;             %modulation index of frequency modulation
 Tm = 1/fm;          % time period of Message Signal
 Samples_for_Modulating_signal_frequency_= 256;
 Ts = Tm/Samples_for_Modulating_signal_frequency_ ;
 fs = 1/Ts;
 
 X_axis = 0:Ts:(Tm-Ts);
 
 Message_signal_Samples = 0:Ts:(8*Tm-Ts);
 t=Message_signal_Samples;
 
 Ac =1;
  %%
 M= sin(2*pi*fm*t);  %Message signal
%%
%____________________________________________________________________________________________________ 
 Carrier= Ac.*cos(2*pi*fc*t); % Carrier Signal with unit amplitude
% p1=   10*log10(sum(Carrier.^2)/(50*length(Carrier)))+30; % power check of carrier signal
%____________________________________________________________________________________________________
%% 
m =0.25; % modulation index of amplitude modulation

%%
Error =[];

%% Frequency Modulation

for m = 0:0.01:.95    %varying values of Amplitude Modulation indices

 a= k.*cos(2*pi*fm*t);
 b=2*pi*fc*t;
 c= a-b;
 fm_orig= Ac.*cos(c);

% simultanious modulation
 y_amp=(1+ m.*sin(2*pi*fm*t));
 y3 = y_amp .* fm_orig;
%% 
 %%%%frequency domain calculations
 bin_size = fs/length(M);
 f= -fs/2:bin_size:((fs/2)-bin_size);
 %M_fft = fftshift(abs(fft(M)))/length(M);  %% Message signal frequency Domain amplitude
 P_fft = fftshift(abs(fft(fm_orig)));  %% FM Modulated signal frequency Domain amplitude
 S_fft = fftshift(abs(fft(y3))); %% simultaneous modulated signal frequency Domain amplitude
%% Power Calculation in dBm
%%Power_Spectrum_P = 10*log10((abs(P_fft).^2)/R*1000);
%%Power_Spectrum_S = 10*log10((abs(S_fft).^2)/R*1000);
error_volt = abs(P_fft - S_fft);
power_error = 10*log10((abs(error_volt).^2)/R*1000);
Error = [Error;error_volt];

end
q = transpose(Error);
x=0:0.01:0.95;
y= -fs/2:bin_size:((fs/2)-bin_size);
[X,Y] = meshgrid(x,y);
%C = flipud(X);
figure(1)
surface(X,Y,q)
title('Error between frequency spectrums of FM and simultaneous AM and FM signals for varying amplitude modulation indices (for fc = 540 Hz, fm =10Hz, k= 10 Hz)');
                 xlabel('Modulation Index');
                 ylabel('Freuency');
                 zlabel('Error');
colormap(spring(5))
view(127,20)
%% Calculation of RMS Error
Square=   Error.^2;
Mean_value = sum(Square)/length(x);
RMS_value= sqrt(Mean_value);
RMS_error_dBm= 10*log10((abs(RMS_value).^2)/R*1000);
figure(2)
plot(y,RMS_value);
title('Plot between RMS error at different frequency for varying amplitude modulation indices (for fc = 540 Hz, fm =10Hz, k= 10 Hz)');
xlabel('Frequency');
ylabel('RMS Error');


 
