%  electrical signal-to-noise ratio (SNR)
% SNR = [{Pt*exp(-cr)*D^2*(cos(phi))} / {((tan(theta))^2)*4*(r^2)*NER}]
% where 
% Pt = transmitter power (in W),
% c = beam attenuation coefficient = 3K,
% D = receiver aperture diameter,
% phi =angle between the optical axis of the receiver and the line-of-sight between the transmitter and receiver
% theta = half angle transmitter beam width,
% r = communications range, and
% NEP = noise equivalent power.

close all

Pt = 0.1;
theta = [((5*pi)/180) ((30*pi)/180)];
D = [10 50];
c = [0.06 2.4]; %K ranges from 0.02 to 0.8 and c = 3*K
phi = [((10*pi)/180) ((30*pi)/180)];
NEP = [4e-13 3.4e-14 3.4e-22];
r = zeros(300,1);
SNR = zeros(300,1);
j=1;
while(j<=3)
    i=1;
    while(i<=2)
        for k = 1:300
          r(k) = (k-1)/3000; 
          A = Pt * (exp(-(c(i)*r(k)))) * (D(i)^2) * cos(phi(i));
          B = ((tan(theta(i)))^2) * 4 * (r(k)^2) * NEP(j); 
          SNR(k) = (A/B)^2;
        end 
        figure();
        plot(r, SNR);
        xlabel('communication range r in metres');
        ylabel('Electrical Signal to Noise Ratio');
        title('SNR equation');
        i = i + 1;  
     end
    j = j+1;
end

