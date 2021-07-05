
% It = Io exp(-Kz)
% where Io = the original light irradiance (watts),
% It, = the transmitted irradiance, and
% z = the vertical path length.
% K = diffused light attenuation coefficient

close all; 

%K ranges from 0.02 (clearest ocean) to 0.8 (turbid coastal waters) 1/m
K = [0.02, 0.8];
x = zeros(300,1);
It = zeros(300,1);
Io = [1 2 10 50 100];
k=1;
while k<=2
    j=1;
    while j<=5
        for i = 1:300
          x(i) = i-1; 
          It(i) = Io(j)*(exp(-(K(k)*x(i))));
        end
        plot(x, It);
        xlabel('x in metres');
        ylabel('transmitted radiance It in MWatts');
        title('equation for attenuation by diffused light');
        hold on;
        j = j + 1;
    end
    k = k+1;
end

