# Lists, Matrices, and Data Frames
# Hannah Grace McNulty
# # 1/29/2026

##########################################################################

#create a matrix from a vector

my_vec<- 1:12

#filling with columns, row argument (nrow=4)
m<- matrix(data = my_vec, nrow =4)

#by filling through other direction (byrow=T)
m<- matrix(data = my_vec, ncol =3, byrow =T)
m

#matricies cannot be mixed with boolean and value variables


#lists: (atomic vectors that can hold variables of diff types)
my_list <- list(1:10, matrix(1:8,nrow = 4, byrow=T), letters[1:3], pi)
print(my_list) #string name

#indexing a list
mylist[1] #pulls the first vector in the list
str(my_list[1])

#my_list[1] + 1 (wont run- non-numeric argument to binary operator)

my_list[[1]] #double brackets asks for object within list element
x<- my_list[[1]]
str(x)

#index into a matrix

my_list[[2]]
my_list[2] #diff return as line above

my_list[[2]][1,2] #returns row 1, col 2, of 2nd thing in list (matrix)
#secondary brackets finds location within the matrix, [rows, cols]
#this asks: What is in list 2, position 1,1?



#naming lists

my_list2<- list(tester=FALSE,little_m=matrix(1:9, nrow=3)) 
#will not print with double brackets around the number of list item -- uses names
print(my_list2)

#named objects in lists:

print(my_list2$little_m) #dollar sign after list name specifies list item
my_list2$little_m[2,3] #don't need double brackets if using name to index
#this asks: from list2, under the little m matrix, find the value in position 2,3


#looking at emplty place indexing

my_list2$little_m[1,] #gives full first row
#pulls the whole first row when second location is left blank in the brackets

my_list2$little_m[4] #if you don't include column (as a ',') r will treat the matrix as a vector
#flattens out the 2-d vector unless that position is left blank like above.
#R treats this like a vector


#unlist
unrolled<- unlist(my_list2)
unrolled #flattens all list components into a named list, true is boolean and reduced to 0
unrolled[1] #pulls first value from that unrolled vector

#unpacking complex lists

#make sure that ggplot2 is installed, then invoke in script 
library(ggplot2)

#create random vars
y_var<- runif(10)
x_var<- runif(10)

#regress 
my_model<- lm(y_var~x_var)

#plot my model
qplot(x=x_var, y=y_var) 

#explore structure
print(my_model)

str(summary(my_model))

#extracting pvals -- after getting the summary of my_model, you can index out certain things (pval)
summary(my_model)$coefficients["x_var", "Pr(>|t|"]

u<- unlist(summary(my_model)) #unlisting to extract p values


print(u)

pval<-u$coefficients2 #indexing the info from the full summary 
#so we are just looking at the coefficients data
###this asks What are the values under the coefficient name 
pval #the pvalue

#data frames

 #define variables
var_a<- 1:12
var_b<-rep(c("A","B", "C"),4)
var_c<- runif(12)

#creating a data frame from vecs 9variables
df<- data.frame(var_a,var_b,var_c)
df

#view  structure summary of df
str(df)

#access things in df

df$var_b
#can also treat like matrix - may not be the best way
df[1,1]

#best way:
df$var_a[1] #first elmt in var_a

#expanding the data frame

#contains the things we add to df in the next step
###expanding the data frame
new_data<-list(var_a = 13, var_b="D", var_c=0.77)
new_data

#appending data
df2<-rbind(df,new_data)
df2


#look at only a little bit of the whole frame
head(df2) #beginning values
tail(df2) # final values
View(df2) #pulls up the data in a new tab like an excel spreadsheet

#add a new column to a dataframe
df2
nvar <- rnorm(13)
nvar
print(df2)

#using cbind (adding the column after definign what is in it)
new_var<- rnorm(13)
df3<- cbind(df2,new_var) #using column bind function
#now this data frame has 4 columns
print(df3)
str(df3)


#using assignment operator
char_var<- rep("T",13)
df3$charV<- char_var
head(df3) #new column of the letter T in data frame 3


## reading and writing data frames
#know where the data is stored - create a data folder in repository

getwd() #finds where your current working directory is

#writing data frames
write.csv(df3,"/Users/hannahmcnulty/Documents/github/McNultyBio_6100/my_dataframe.csv") 
#include the subfolder before the file name to place in subfolder
##

data<-read.csv("/Users/hannahmcnulty/Documents/github/McNultyBio_6100/my_dataframe.csv", header = T, sep=",")
data$var_a


