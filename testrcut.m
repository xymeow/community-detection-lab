function testrcut(A)
W = A;
wsize = size(W);
D = zeros(wsize);
for i = 1:wsize(1)
    D(i,i) = sum(W(i,:));
end

L = D - W;
[x, ~] = eig(L);

ksize = 10;
kstart = 1;
sumdist = zeros(1,kstart+ksize);
for k=kstart:kstart+ksize
    r = zeros(1,k);
    clusize = zeros(1,k);
    V = x(:, 1:3);
    [clustering,~,~,sumd] = kmeans(V, k);
    for i = 1:wsize(1)
        r(clustering(i)) = max(r(clustering(i)),sumd(i,clustering(i)));
    end
    for j = 1:k
        clusize(j) = length(find(clustering == j));
    end
    sumdist(k) = sum(r.*clusize)/sum(clusize)/k;
end
plot(sumdist);
end