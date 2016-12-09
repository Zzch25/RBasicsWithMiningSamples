#Zachary Job
#10/14/15

library(class)

#Guard against uncleaned runs
rm(list=ls())

#Definitions for selecting data
dataSet <- iris
trimMi1 = 1
szRow <- nrow(dataSet)
szCol <- ncol(dataSet)
sampleSz = 5
labelLoc = 5
l0 = 1
l1 = 2
l2 = 5
l3 = 10
diff0 = 0
diff1 = 0
diff2 = 0
diff3 = 0
iters = 50

for(j in 1:iters)
{
	samples <- sample(szRow,as.integer((1 - (1 / sampleSz)) * szRow))

	#get the data and set some final variables
	testIris <- dataSet[-samples,]
	testSz = nrow(testIris)
	testNames = testIris[,szCol]
	trainIris = dataSet[samples,]

	#show the data
	writeLines("\n::TEST::")
	print(testIris)
	writeLines("\n::TRAINING::")
	print(trainIris)

	#Actual data
	writeLines("\n::ACTUAL::")
	print(testNames)

	#Perform the algorithm and display for 1
	result0 <- knn(trainIris[,-labelLoc],testIris[,-labelLoc],trainIris[,labelLoc],l0)
	writeLines("\n")
	sprintf("::RESULTS %d::", l0)
	print(result0)

	#Perform the algorithm and display for 1
	result1 <- knn(trainIris[,-labelLoc],testIris[,-labelLoc],trainIris[,labelLoc],l1)
	writeLines("\n")
	sprintf("::RESULTS %d::", l1)
	print(result1)

	#Perform the algorithm and display for 1
	result2 <- knn(trainIris[,-labelLoc],testIris[,-labelLoc],trainIris[,labelLoc],l2)
	writeLines("\n")
	sprintf("::RESULTS %d::", l2)
	print(result2)

	#Perform the algorithm and display for 1
	result3 <- knn(trainIris[,-labelLoc],testIris[,-labelLoc],trainIris[,labelLoc],l3)
	writeLines("\n")
	sprintf("::RESULTS %d::", l3)
	print(result3)

	#Count up the differences
	for(i in 1:testSz)
	{
		if(identical(testNames[i], result0[i]) == FALSE)
		{	
			diff0 = diff0 + 1
		}
		if(identical(testNames[i], result1[i]) == FALSE)
		{	
			diff1 = diff1 + 1
		}
		if(identical(testNames[i], result2[i]) == FALSE)
		{	
			diff2 = diff2 + 1
		}
		if(identical(testNames[i], result3[i]) == FALSE)
		{	
			diff3 = diff3 + 1
		}
	}
}

writeLines("\n\n::DIFFERENCES::")
sprintf(">>>>>Iterations: %d", iters)

sprintf("K %d -> %f", l0, ((100/testSz)*(testSz-(diff0/iters))))
sprintf("K %d -> %f", l1, ((100/testSz)*(testSz-(diff1/iters))))
sprintf("K %d -> %f", l2, ((100/testSz)*(testSz-(diff2/iters))))
sprintf("K %d -> %f", l3, ((100/testSz)*(testSz-(diff3/iters))))

#Clean
rm(list=ls())
