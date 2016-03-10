function clustering = modularity(A, k)
m = nnz(A)/2;
wsize = size(A);
d = zeros(1,wsize(1));
for i = 1:wsize(1)
    d(i) = sum(A(i,:));
end
B = A - d*d'/(2*m);
[x, ~] = eig(B);
a = size(x);
V = x(:,a(1)-k+1:a(1));
clustering = kmeans(V, k,'Replicates',3);
end
