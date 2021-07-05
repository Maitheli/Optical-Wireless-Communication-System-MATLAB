% BR = BW1og2 (1 + SNR)
% where 
% BR is the bit rate
% BW is the system bandwidth 
% SNR is the electrical signal to noise ratio

BW = [2e5 2e6]; 
SNR = zeros(10,1);
BR = zeros(10,1);
k=1;
while(k<=2)
    for i = 1:10
        j = i-1;
        SNR(i) = 10^j;
        BR(i) = BW(k) * log2(1 + SNR(i));
    end
        plot(SNR, BR);
        xlabel('Electrical Signal to Noise Ratio');
        ylabel('Bit Rate');
        title('Bit Rate equation');
        hold on;
        k = k+1;
end