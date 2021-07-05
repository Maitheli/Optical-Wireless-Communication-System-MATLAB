% The optical power on the detector is given by
% Pbg = ((pi^2)*(D^2)*(FOV^2)*lambda*Lsol)/16
% where D = diameter of the collecting optics,
% FOV = field of view of the system in radians,
% lambda = wavelength bandpass, and
% Lsol = upwelling solar radiance

close all;

D = [0.1 0.5]; %in meters
FOV = [((10*pi)/180) ((30*pi)/180)];
lambda = 1550e-9; %in nano meters
Lsol = zeros(2000, 1); %in watts/(m2-sr)
Pbg = zeros(2000, 1);
i=1;
while(i<=2)
    j=1;
    while(j<=2)
        for k = 1:2000
          Lsol(k) = k-1; 
          Pbg(k) = ((pi^2)*(D(i)^2)*(FOV(j)^2)*lambda*Lsol(k))/16;
        end
        plot(Lsol, Pbg);
        xlabel('upwelling solar radiance(watts/(m2-sr)');
        ylabel('optical power on the detector(watts)');
        title('equation for optical power on the detector');
        hold on;
        j = j+1;
    end   
    i=i+1;
end

