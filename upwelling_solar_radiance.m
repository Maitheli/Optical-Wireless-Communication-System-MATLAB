%For NEP,
%The first of these terms is the ambient light background shot noise. 
%To calculate this noise term we first calculate the upwelling solar radiance [watts/(m2-sr)] (sr is steradian) by
%  Lsol = (E*R*Lfac*exp(-K*D))/pi
% E = downwelling irradiance (watts/M2),
% R = underwater reflectance of the downwelling
% irradiance,
% Lfac= factor describing the directional dependence of the underwater radiance,
% K = diffuse attenuation coefficient, and
% D = depth. 

% values calculated at wavelength of 532nm.

% Lfac, describes the ratio of radiance observed at a specific viewing angle as compared to
% looking straight down (viewing angle 180°). 
% Lfac at a viewing angle of 180° is 1, 
% looking horizontally(90°) is 2.9, 
% and looking up (0°) is 333 for a depth of 30 m

close all;

E = 1440;
R = 1.25/100;
Lfac = [1 2.9 333];
K = [0.02, 0.8];
D = zeros(100,1);
Lsol = zeros(100,1);
colorstring = 'kbgrym';
i = 1;
l = 1;
while(i <= 2)
    j=1;
    while(j <= 3)
        for k = 1:100
          D(k) = k-1; 
          Lsol(k) = (E*R*(Lfac(j))*(exp(-(K(i)*D(k)))))/pi;
        end
        plot(D, Lsol, 'Color', colorstring(l));
        xlabel('D in metres');
        ylabel('upwelling solar radiance(watts/(m2-sr)');
        title('equation for upwelling solar radiance');
        hold on;
        j = j+1;
        l = l+1;
    end
    i = i+1;
end




