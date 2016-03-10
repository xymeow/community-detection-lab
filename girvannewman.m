function clustering = girvannewman(A,k)
[c, compsize] = components(A);
while length(compsize) < k
    [~, Ebc] = betweenness_centrality(A);
    [maxn, itemp] = max(Ebc);
    [~, j] = max(maxn);
    i = itemp(j);
    A(i,j)=0;
    A(j,i)=0;
    [c, compsize] = components(A);
end
clustering = c;
end
