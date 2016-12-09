#Zachary Job
#10/20/15

#Generic init
rm(list=ls())

library(kknn)
library(class)

#Defs
norm <- function(x)
{
	return((x - min(x)) / (max(x) - min(x)))
}

#Outputs
pdf("plots.pdf")

#####5.1
writeLines("\n5.1=====\n")

#Init data
x <- c(7, 10, 13, 21, 28, 28, 35, 43, 44, 50)
y <- c(57, 62, 63, 71, 78, 88, 89, 90, 94, 98)

#Set data
hMat <- cbind(x, y)
hDist <- dist(as.matrix(hMat))
hC <- hclust(hDist, "average")

#Show data
writeLines("Matrix::")
print(hMat)
writeLines("Distribution::")
print(hDist)
writeLines("\nPloting::")
plot(hC)
writeLines("Done\n")

#####5.2
writeLines("5.2=====\n")

#Get and show data
writeLines("Getting dataset...")
getCSV = read.csv(url("http://www.math.smith.edu/sasr/datasets/help.csv"))
getCSV$substance <- lapply(getCSV$substance,function(x) if(is.character(x)|is.factor(x)) gsub("heroin",0,x) else x)
getCSV$substance <- lapply(getCSV$substance,function(x) if(is.character(x)|is.factor(x)) gsub("cocaine",1,x) else x)
getCSV$substance <- lapply(getCSV$substance,function(x) if(is.character(x)|is.factor(x)) gsub("alcohol",2,x) else x)
getCSV$substance <- as.numeric(getCSV$substance)
getClust <- subset(getCSV, select = c(substance,age,female))
getClust <- na.omit(getClust)
writeLines("Uncomment line under statement to print elems...")
#print(getClust)

#Work on data, also.. found the new and awesome omit and scale functions.. yey
km <- kmeans(getClust, 3)
aggregate(getClust, by=list(km$cluster),FUN=mean)
kClust <- data.frame(getClust, km$cluster)

#Output results
writeLines("\nPlotting::")
plot(kClust)
writeLines("Done")

#####5.3
writeLines("\n5.3=====\n")

#Initialization
trimMi1 = 1
sampleSz = 5
labelLoc = 5
l0 = 5
diff0 = 0
#normalize iris into dataSet
dataSet <- as.data.frame(cbind(lapply(iris[1:4], norm), iris[5]))
szRow <- nrow(dataSet)
szCol <- ncol(dataSet)

#generate samples
samples <- sample(szRow,as.integer((1 - (1 / sampleSz)) * szRow))

#get the data and set some final variables
testIris <- dataSet[-samples,]
testSz = nrow(testIris)
testNames = testIris[,szCol]
trainIris = dataSet[samples,]

#show the data
writeLines("::TEST::")
writeLines("Uncomment below statement to see data...")
#print(testIris)
writeLines("\n::TRAINING::")
writeLines("Uncomment below statement to see data...")
#print(trainIris)

#Actual data
writeLines("\n::ACTUAL::")
print(testNames)

#Perform the algorithm and display for 1
Species <- testIris$Species
sl <- testIris$Sepal.Length
sw <- testIris$Sepal.Width
pl <- testIris$Petal.Length
pw <- testIris$Petal.Width
result0 <- kknn(Species~sl+sw+pl+pw,trainIris[,-labelLoc],testIris[,-labelLoc],trainIris[,labelLoc],l0)
writeLines("")
sprintf("::RESULTS %d::", l0)

print(result0$fit)

#Count up the differences
for(i in 1:testSz)
{
	if(identical(testNames[i], result0$fit[i]) == FALSE)
	{
		diff0 = diff0 + 1
	}
}

writeLines("\nResults...")
sprintf("K %d -> %f", l0, (100/testSz) * (testSz - diff0))

#Generic closure
dev.off()
rm(list=ls())