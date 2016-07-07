# community-detection-lab
My course lab
实现了5种社区发现算法
**1. GN算法**
GN算法是一种分裂型的社区发现算法，我在本实验中的实现大概如下：
`1. 计算各边的betweenness`
`2. 去除betweenness值最高的边`
`3. 计算该图的连通片`
`4. 判断连通片的数目compsize，若小于k，转1`

**2. alink-jaccard算法**
alink－jaccard是一种层次聚类方法，它使用jaccard相似度作为节点间的"距离"，再使用聚类算法，初始时每个节点为一个cluster，每次迭代将cluster间节点距离平均值最小的两个cluster合并，直到剩下k个cluster为止。

**3. rcut算法**
rcut是基于谱聚类的一种方法，可以把社区发现的问题转换成求矩阵特征向量，再在特征向量上使用kmeans算法。
定义矩阵$D$为图的度矩阵，$W$为图的邻接矩阵，则拉普拉斯矩阵$L = D - W$ 求这个矩阵的特征向量，把它按从小到大的顺序排列，取前k个特征向量，在上面使用kmeans算法得到聚类结果。

**4. ncut算法**
实现方法基本同rcut，只是这里定义的拉普拉斯矩阵为$D^{-1/2}(D-W)D^{-1/2}$

**5. modularity算法**
modularity算法在这里的实现方法类似谱聚类的方法，这里定义$B=A-\frac{dd^T}{2m}$,$A$为图的邻接矩阵，$d$为顶点度数向量，即$d_i = degreeof(node_i)$，$m$为图的边数，这里可以用`A矩阵的非零元素数目/2`来获得。
该算法求$B$矩阵的特征向量，选择其中最大的k个向量来做kmeans算法。
