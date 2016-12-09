#Zachary Job
#CS 513
#10/8/15
#=======================

print("Answers to all parts that required a response are found in the script by the appropriately labeled comments")
print("======================================================================")

#Get the table and pick the subsets
getCSV = read.csv(url("http://www.math.smith.edu/sasr/datasets/help.csv"))
getSubset <- subset(getCSV, select = c(id,pcs1,mcs1,substance,racegrp))
dataFrame <- as.data.frame(getSubset)
print("Resulting Data Frame...")
print(dataFrame)
write.csv(dataFrame, file = "dataFrameDownload.csv")

#Calculate the Statistics for mcs1
print("MCS1 Data...")
print(">>Mean")
meanMCS <- mean(dataFrame$mcs1,na.rm=T)
print(meanMCS)
print(">>Max")
print(max(dataFrame$mcs1,na.rm=T))
print(">>Min")
print(min(dataFrame$mcs1,na.rm=T))
print(">>StdDev")
print(sd(dataFrame$mcs1,na.rm=T))

#Generate a substance vs racegroup frequency table
print("Frequency of substance vs racegroup...")
freq <- data.frame (table (dataFrame$racegrp, dataFrame$substance)[,]) 
print(freq)
write.csv(freq, file ="dataFrequencyTable.csv")

#Substitute NA in mcs1 with the mean
print("Substituting mcs1 NA with mean...")
dataFrame$mcs1[is.na(dataFrame$mcs1)] <- meanMCS
print(dataFrame)
write.csv(dataFrame, file ="dataFrameSubstitution.csv")

print("Cleaning...")
rm(list=ls())
