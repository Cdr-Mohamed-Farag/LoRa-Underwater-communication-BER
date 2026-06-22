%==========================================================================
% Authors: Mohamed farag Elshahat
% Last Modified: March, 2026
% If you use this code or any (modified) part of it in any publication, please cite the paper: M. F. Elshahat, M. R. M. Rizk and S. E. El-Khamy, "Optimizing LoRa for Underwater Acoustic Links: Carrier Frequency and Spreading Factor Trade-Offs," 2025 7th Novel Intelligent and Leading Emerging Sciences Conference (NILES), Giza, Egypt, 2025, pp. 45-49, doi: 10.1109/NILES68063.2025.11232417.
% Contact person email: mohfarag1985@gmail.com ,mohamed.farag21@alexu.edu.eg
%==========================================================================%Add iteration counters:
clear
clc
close all;

SF_7 = 7; 
SF_8 = 8; 
SF_9 = 9; 
SF_10 = 10; 
SF_11 = 11;
SF_12 = 12;   
BW = 1e3 ;
fc = 10e3 ;
Power = 12 ;
message = " Hello:dear World @abcd efg*hij error mirrior UWA channel ca%$ot be detected kmno/Next, the meth[od was fou]nd (pqrs tuv) wxyz MANY 0123&*456 789 !@# $%^ Next, the DC-SS ha &*() +-*/ " ;

%% SNR range
SNRdB = -25:20;
SNR = 10.^(SNRdB/10);
numIterations = 300;
   % Define the parameters for the channel, gains, delays, and Doppler
setup.Ts = 6e-6;                    % Sampling rate of the UWA channel
setup.paths = 22;                   % Number of paths of the UWA channel
setup.delayspread = 1e-3;           % Delay spread of the UWA channel

gain.attenuation = 8;             % Attenuation that occurs during delay spread in dB

delay.mean = 1e-3;                  % Mean of the exponential pdf for delays

doppler.type = 'uniform';           % Type of Doppler effect in the channel
doppler.velocity = 0.2;             % Relative motion between transmitter and receiver

% Simulate the channel
[h, delay_bar, gain_tap] = acousticChannel(setup, gain, delay, doppler);
%Make BER matrices to store results:
BER_SNR7 = zeros(length(SNR), numIterations);

%Loop over iterations:
for iter = 1:numIterations

% Existing SNR BER code
for i = 1:length(SNRdB)
    %% Sampling
    Fs = 30e3 ;
    Fc = 11e3 ;
    %% Transmit Signal
    signalIQ7 = LoRa_Tx(message,BW,SF_7,Power,Fs,Fc - fc) ;
    %disp(['Transmit Power = ' num2str(Sxx) ' dBm'])
    %disp(['Message transmitted = ' char(message)])
    SNR = 10.^(SNRdB(i)/10);
    faded7 =  conv(signalIQ7, h);
    fadedSignal7 = awgn(faded7, SNRdB(i), 'measured');
    
   %% Received Signal
    message_out7 = LoRa_Rx(fadedSignal7,BW,SF_7,2,Fs,Fc - fc,SNR) ;
       %% Message Out
    disp(['Message Received7 = ' char(message_out7)]) 
    %% BER calculation
    % Convert messages to binary representation
    txBinary7 = double(char(message)); % assuming ASCII encoding, 8 bits per character
    rxBinary7 = dec2bin(char(message_out7), 8);
    % Calculate the number of bit errors
    try
    numErrors7 = sum(txBinary7(:) ~= message_out7(:));
    catch
        warning('Arrays have incompatible sizes for this operation.');
        numErrors7 = numErrors7 +1;
        continue;
    end
    % Calculate the Bit Error Rate (BER)
    %totalBits = numel(txBinary7);
    BER_SNR7(i,iter) = numErrors7/length(txBinary7);
end

end
BER_SNR_avg7 = mean(BER_SNR7,2);
BER_SNR8 = zeros(length(SNR), numIterations);

for iter = 1:numIterations

% Existing SNR BER code
for i = 1:length(SNRdB)
    %% Sampling
     Fs = 30e3 ;
    Fc = 11e3 ;
    %% Transmit Signal
    signalIQ8 = LoRa_Tx(message,BW,SF_8,Power,Fs,Fc - fc) ;
    %disp(['Transmit Power = ' num2str(Sxx) ' dBm'])
    %disp(['Message transmitted = ' char(message)])
    SNR = 10.^(SNRdB(i)/10);
    faded8 =  conv(signalIQ8, h);
    fadedSignal8 = awgn(faded8, SNRdB(i), 'measured');
   %% Received Signal
    message_out8 = LoRa_Rx(fadedSignal8,BW,SF_8,2,Fs,Fc - fc,SNR) ;
       %% Message Out
    disp(['Message Received8 = ' char(message_out8)])  
    %% BER calculation
    % Convert messages to binary representation
    txBinary8 = double(char(message)); % assuming ASCII encoding, 8 bits per character
    rxBinary8 = dec2bin(char(message_out8), 8);
    % Calculate the number of bit errors
    try
    numErrors8 = sum(txBinary8(:) ~= message_out8(:));
    catch
        warning('Arrays have incompatible sizes for this operation.');
        numErrors8 = numErrors8 +1;
        continue;
    end
    % Calculate the Bit Error Rate (BER)
    %totalBits = numel(txBinary8);
    BER_SNR8(i,iter) = numErrors8/length(txBinary8);
end
end


BER_SNR_avg8 = mean(BER_SNR8,2);

BER_SNR9 = zeros(length(SNR), numIterations);

for iter = 1:numIterations

% Existing SNR BER code
for i = 1:length(SNRdB)
    %% Sampling
    Fs = 30e3 ;
    Fc = 11e3 ;
    %% Transmit Signal
    signalIQ9 = LoRa_Tx(message,BW,SF_9,Power,Fs,Fc - fc) ;
    %disp(['Transmit Power = ' num2str(Sxx) ' dBm'])
    %disp(['Message transmitted = ' char(message)])
    SNR = 10.^(SNRdB(i)/10);
    faded9 =  conv(signalIQ9, h);
    fadedSignal9 = awgn(faded9, SNRdB(i), 'measured');
   %% Received Signal
    message_out9 = LoRa_Rx(fadedSignal9,BW,SF_9,2,Fs,Fc - fc,SNR) ;
       %% Message Out
    disp(['Message Received9 = ' char(message_out9)])
    %% BER calculation
    % Convert messages to binary representation
    txBinary9 = double(char(message)); % assuming ASCII encoding, 8 bits per character
    rxBinary9 = dec2bin(char(message_out9), 8);
    % Calculate the number of bit errors
   try
    numErrors9 = sum(txBinary9(:) ~= message_out9(:));
    catch
        warning('Arrays have incompatible sizes for this operation.');
        numErrors9 = numErrors9 +1;
        continue;
    end
    % Calculate the Bit Error Rate (BER)
    %totalBits = numel(txBinary9);
    BER_SNR9(i,iter) = numErrors9/length(txBinary9);
end
end


BER_SNR_avg9 = mean(BER_SNR9,2);


%Plot averaged results:
figure(1);
semilogy(SNRdB, BER_SNR_avg7, 'r-*');
hold on;
semilogy(SNRdB, BER_SNR_avg8, 'g-^');
hold on;
semilogy(SNRdB, BER_SNR_avg9, 'b-+');

grid on;
axis([-25 20 1e-7 1e0])
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('BER vs. SNR');
