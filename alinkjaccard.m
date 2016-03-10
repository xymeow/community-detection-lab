function clustering=alinkjaccard (A, k)

Distance = pdist(A,'jaccard');
Z = linkage(Distance, 'average');
clustering = cluster(Z, 'maxclust', k);