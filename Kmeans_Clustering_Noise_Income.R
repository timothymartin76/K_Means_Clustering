k.data1<- read.csv(file.choose(), header=TRUE, sep=',')
View(k.data1)
head(k.data1)

#####Plot the data
plot(k.data1)


####Perform Kmeans clustering with two clusters
k.data1.3means <-kmeans(k.data1, centers = 3)


####Show the centers
k.data1.3means$centers


####Show the clusters
k.data1.3means$cluster


####Plot the groups
plot(k.data1[k.data1.3means$cluster == 1, ],
col = "red",
xlim=c(min (k.data1[,1] ), max( k.data1 [,1])),
ylim=c(min (k.data1[,2] ), max( k.data1[,2]))
)
points(k.data1[k.data1.3means$cluster == 2, ],
col = "blue")
points(k.data1[k.data1.3means$cluster == 3, ],
col = "seagreen")


####Plot the centers of the clusters
points(k.data1.3means$centers, pch=2, col="green")
