#Check and download + unzip raw data
zipname <- 'HAR.zip'
if (!file.exists(zipname)) download.file(url='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
              destfile ='HAR.zip')
if (!file.exists('UCI HAR Dataset')) unzip(zipname)

#Info
#activity_labels.txt - labels and numbers
#features.txt - features and numbers

#test/train
#subject_test/train.txt - subject identifier
#X_test/train.txt - features (identified by number 1-561)
#Y_test/train.txt - labels (identified by number 1-6)tra

#Get feature names
feature_name <- read.table(file='UCI HAR Dataset/features.txt')
#Get activity label names
label_name <- read.table(file='UCI HAR Dataset/activity_labels.txt')

#Test set
#Read subject
subject_test <- read.table(file='UCI HAR Dataset/test/subject_test.txt')
names(subject_test)<-c('subject')
#Read X
X_test <- read.table(file='UCI HAR Dataset/test/X_test.txt')
#Match feature names with feature columns
names(X_test)<-feature_name[,2]
#Get only variables related to mean and std
q<-names(X_test)
mean_index <- q[grep('mean',names(X_test))]
std_index <- q[grep('std',names(X_test))]
index <- c(mean_index,std_index)

#Read y
y_test <- read.table(file='UCI HAR Dataset/test/y_test.txt')
#Match labels with number
y_test[[2]]<-sapply(y_test[[1]],FUN=function(x) label_name[x,2])
names(y_test)<-c('label_no','label')
#Set levels
levels(y_test$label)<-label_name[,2]

#Combine complete test set
test<- cbind(subject=subject_test$subject,label=y_test$label,X_test[index])
test$set <- 'test'

#Train set
#Read subject
subject_train <- read.table(file='UCI HAR Dataset/train/subject_train.txt')
names(subject_train)<-c('subject')
#Read X
X_train <- read.table(file='UCI HAR Dataset/train/X_train.txt')
#Match feature names with feature columns
names(X_train)<-feature_name[,2]
#Read y
y_train <- read.table(file='UCI HAR Dataset/train/y_train.txt')
#Match labels with number
y_train[[2]]<-sapply(y_train[[1]],FUN=function(x) label_name[x,2])
names(y_train)<-c('label_no','label')
#Set levels
levels(y_train$label)<-label_name[,2]

#Combine complete train set
train<- cbind(subject=subject_train$subject,label=y_train$label,X_train[index])
train$set<-'train'

#Combine test and train
whole <- rbind(test,train)

#Aggregate by subject and label using mean
tidy<-aggregate(.~subject+label,data=whole[,1:81],mean)
tidy<-tidy[order(tidy$subject),]

#Write table
write.table(tidy,file='tidy.txt',row.name=FALSE)
