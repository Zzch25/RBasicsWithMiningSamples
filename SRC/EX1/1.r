#Zachary Job
#CS 513
#9/24/15
#=======================

print("Answers to all parts that required a response are found in the script by the appropriately labeled comments")
print("======================================================================")

#2.1
x = c(1, 2, 3)
y = c(11, 12, 13, 14, 15, 16)

#2.2
addxy = x + y
print(addxy)

#2.3
#R takes the x vector and adds each element against the opposing vector y. 
#X is repeatedly added once done adding its three elements the first time

#2.4
lname = c('J', 'o', 'b')

#2.5
fname = c('Z', 'a', 'c', 'h', 'a', 'r', 'y')

#2.6
sid = c(1, 0, 3, 6, 2, 2, 2, 9)

#2.7
#The vector is of three elements of type char. This instance uses ACSII.
#ACSII is a character representation system
invisible(length(lname))
invisible(typeof(lname))

#2.8
myinfo = c(fname,lname)
myinfo = c(myinfo, sid)

#2.9
print(paste(myinfo, collapse = ""))

#2.10
#The length is 18 and again it is of type char. Again this instance uses ASCII.
invisible(length(myinfo))
invisible(typeof(myinfo))

#2.11
myinfo = myinfo [! myinfo %in% fname]

#2.12
print(paste(myinfo, collapse = ""))

#2.13
First = c("fname1", "fname2")
Last = c("lname1", "lname2")
ID = c(1111, 2222)
roster = data.frame(First, Last, ID)

#2.14
print(roster)

#2.15
write.csv(roster, file = "CS513HW2OUT0.csv")

#2.16
print("Note, I didn't find the ports to enable for R traffic to get the csv however it worked on my ubuntu instance")
print("The R error on my machine was useless but it appears to indicate this being the issue")
getCSV = read.csv(url("http://www.math.smith.edu/sasr/datasets/help.csv"))
print(getCSV)

#2.17
rm(list=ls())