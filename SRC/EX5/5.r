#Zachary Job
#10/20/15

#Generic init
rm(list=ls())

library(class)
library(cluster)

#Defs - artifact
norm <- function(x)
{
	return((x - min(x)) / (max(x) - min(x)))
}

#Outputs
pdf("plots.pdf")

writeLines("\n=====\n")
#Get and show data

writeLines("Getting dataset...")
getCSV = read.csv(url("http://www.math.smith.edu/sasr/datasets/help.csv"))

#Attribute descriptive values to binary columns
substanceX <- ifelse(getCSV$substance == "alcohol",1,0)
substanceY <- ifelse(getCSV$substance == "cocaine",1,0)
substanceZ <- ifelse(getCSV$substance == "heroin",1,0)
getClust <- cbind(subset(getCSV, select = c(age, female)), substanceX, substanceY, substanceZ)

#perform kmeans cluster
km <- kmeans(getClust,3)

#Output results
print(km)
writeLines("\nPlotting::")
clusplot(cbind(getClust, substanceX, substanceY, substanceZ), km$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)
writeLines("Done")

writeLines("\n=====\n")

#Generic closure
dev.off()
rm(list=ls())