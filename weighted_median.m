function [C] = weighted_median(img)
K = [0 1 1 1 0; 1 2 2 2 1; 1 2 4 2 1; 1 2 2 2 1; 0 1 1 1 0];
C = img*0;
reg = zeros(1,sum(K(:)));
B = padarray(img,[2 2],'replicate');
for i=3:size(B,1)-2
for j=3:size(B,2)-2
n = 1;
for k=-2:2
for l=-2:2
for m=1:K(k+3,l+3)
reg(n) = B(i+k,j+l);
n = n + 1;
end
end
end
C(i-2,j-2) = median(reg);
end
end