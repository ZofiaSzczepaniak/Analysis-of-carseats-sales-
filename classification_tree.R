#ex 1
library(ISLR)
library(rpart)
library(partykit)
df <- data(Carseats)
#print(Carseats)
Carseats.train <- Carseats[1:300,]
Carseats.test <- Carseats[301:400,]
xtrain <- Carseats.train[,2:11]
xtest <- Carseats.test[,2:11]
high <- ifelse(Carseats.train$Sales <= 8, "No", "Yes")
#a)
modControl <- rpart.control(maxdepth=2)
carseat_tree <- rpart(high ~. , xtrain,control=modControl )
#b)
plot(as.party(carseat_tree), type="extended")
#shelveloc - factor indicated of quality of the shelving location for the car seats on each site
#c)
summary(carseat_tree)
#The highest probability of high sales is when the variable shelveloc is good and the prive is lower than 150.
#and this probability is equal to 0.868.

#d)
print("Confusion table for train data:")
pred<- predict(carseat_tree, xtrain, type="class")
conf <- table(high, pred)
print(conf)
#misclassification rate = 18+50/162+18+70+50 = 0.226

#e)
high_test = ifelse(Carseats.test$Sales <= 8, "No", "Yes")
print("Confusion table for test data:")
fir2<- predict(carseat_tree, xtest, type="class")
conf2 <- table(high_test, fir2)
print(conf2)
#misclasification rate = 18+8 / 18+8+48+26 = 0.26
#The rates for train and test datas are similiar, so the model is probably not biased
#The rates also are about 25%, 
#so the misclassification rate is big and maybe we should use the better model.