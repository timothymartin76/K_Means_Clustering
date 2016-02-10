##More kmeans clustering 

require(ggfortify)
require(cluster)

##read in agent file
mydata<- read.csv("agents.csv")

##perform kmeans clustering
m=as.matrix(cbind(mydata$Calls_Handled, mydata$AHT), ncol=2)
cl=(kmeans(m,3))
mydata$cluster=factor(cl$cluster)
centers=as.data.frame(cl$centers)

##plot in ggplot2 
ggplot(data=mydata, aes(x=Calls_Handled, y=AHT, color=cluster )) +
geom_point() +
geom_point(data=centers, aes(x=V1,y=V2, color='Center')) +
geom_point(data=centers, aes(x=V1,y=V2, color='Center'), size=60, alpha=.3, show_guide=FALSE)

##add agent names to points
sp<- ggplot(data=mydata, aes(x=Calls_Handled, y=AHT, color=cluster )) +
geom_point() +
geom_point(data=centers, aes(x=V1,y=V2, color='Center')) +
geom_point(data=centers, aes(x=V1,y=V2, color='Center'), size=60, alpha=.3, show_guide=FALSE)

sp + geom_text(aes(label=CCR_Name), size=3, vjust=0)

##Add column to categorize agents by cluster 
cluster_category<- fortify(kmeans(mydata, 3), data=mydata)

##write to csv file for further analysis if needed
write.csv(mydata, file="cluster_categories.csv")