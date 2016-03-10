function clustering=ncut(A, k)
W = A;
wsize = size(W);
D = zeros(wsize);
for i = 1:wsize(1)
    D(i,i) = sum(W(i,:));
end

D2 = pinv(sqrtm(D));
L = D2*(D - W)*D2;
[x, ~] = eig(L);
V = x(:, 1:k);
clustering = kmeans(V, k,'Replicates',3);
end