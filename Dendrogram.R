mydata2<- read.csv(file.choose(), header=TRUE, sep=',')

View(mydata2)

####Perform cluster analysis and save the results in an object
cluster2<- hclust(dist(mydata2[-1]))

####Plot the dendrogram
plot(cluster2, labels=mydata2$CMBD)

####Add rectangles to identify 5 clusters
rect.hclust(cluster2, 5)
