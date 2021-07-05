% The NEP of the solar background shot noise is given by
% Pbg_sn = ((2*q*Pbg*BWen*F)/S)^0.5
% where q = electronic charge,
% S = radiant sensitivity of the detector(amps/watt),
% radiant sensitivity amount to which an object reacts upon receiving photons, especially visible light
% radiant sensitivity = photocurrent/incident light level
% Pbg = Optical power of background,
% BWen = Effective noise bandwidth = (pi*BW)/2, and
% F =excess noise factor = 1 for photodiode.

close all;

q = 1.6e-19; %in coloumbs
BW = 1550e-9;
BWen = (pi*BW)/2;
F = 1;
S = 0.3;
% S = 300 mA/W at 405nm
% Reference [1] :  SIMPSON, JIM ANTO., Underwater Communications System using LEDs and Photodiodes with Signal Processing Capability
Pbg = zeros(100,1);
Pbg_sn = zeros(100,1);
for k = 1:100
    Pbg(k) = (k-1)*(10^(-8));
    Pbg_sn(k) = sqrt((2*q*Pbg(k)*BWen*F)/S);
end
figure();
plot(Pbg, Pbg_sn);
xlabel('Optical power of background(watts)');
ylabel('solar background shot noise(watts)');
title('equation for solar background shot noise');

% ---------------------------------------------------------------------------------------------------------------------------- %

% The NEP of the signal shot noise is given by
% Psig_sn = ((2*q*Psig*BWen*F)/S)^0.5
% where Psig = Optical power of signal

Psig = zeros(100,1);
Psig_sn = zeros(100,1);
for k = 1:100
    Psig(k) = (k-1)*(10^(-6));
    Psig_sn(k) = sqrt((2*q*Psig(k)*BWen*F)/S);
end
figure();
plot(Psig, Psig_sn);
xlabel('Optical power of signal(watts)');
ylabel('signal shot noise(watts)');
title('equation for signal shot noise');

% ---------------------------------------------------------------------------------------------------------------------------- %

% The NEP of the dark current shot noise is given by
% Pdark_sn = ((((2*q*Idark*(Gdet^2)*F) + (2*q*Idc))*BWen)^0.5)/(S*Gdet)
% where Idark = multiplied dark current,
% Gdet= detector current gain, and
% Idc = non-multiplied dark current

Idc = 1.226e-9; % in amperes
Idark = 1.226e-10; % in amperes
% Reference [2] : Sermsak Jaruwatanadilok, Underwater Wireless Optical Communication Channel Modeling and Performance Evaluation using Vector Radiative Transfer Theory
Gdet = zeros(100,1);
Pdark_sn = zeros(100,1);
for k = 1:100
    Gdet(k) = (k-1)*(10^(5));
    Pdark_sn(k) = ((((2*q*Idark*(Gdet(k)^2)*F) + (2*q*Idc))*BWen)^0.5)/(S*Gdet(k));
end
figure();
plot(Gdet, Pdark_sn);
xlabel('detector current gain');
ylabel('dark current shot noise(watts)');
title('equation for dark current shot noise');

% ---------------------------------------------------------------------------------------------------------------------------- %

% The NEP of the preamplifier noise is given by
% Pamp_n = ( In_amp*((BWen)^0.5) )/(S*Gdet)
% where In_amp= preamplifier current noise density

In_amp = 1e-9; 
Pamp_n = zeros(100, 1);
for k = 1:100
    Pamp_n(k) = (In_amp*(sqrt(BWen)))/(S*Gdet(k));
end
figure();
plot(Gdet, Pamp_n);
xlabel('detector current gain');
ylabel('preamplifier noise(watts)');
title('equation for preamplifier noise');

% ---------------------------------------------------------------------------------------------------------------------------- %

%Total NEP = NEP_f

NEP_f = zeros(100, 1);
for k = 1:100
    NEP_f(k) = sqrt( (Pbg_sn(k)^2) + (Psig_sn(k)^2) + (Pdark_sn(k)^2) + (Pamp_n(k)^2) );
end
figure();
plot(Gdet, NEP_f);
xlabel('detector current gain');
ylabel('noise equivalent power(watts)');
title('final equation for noise equivalent power');

% ---------------------------------------------------------------------------------------------------------------------------- %
