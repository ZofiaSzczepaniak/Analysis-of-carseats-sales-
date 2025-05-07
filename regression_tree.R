#ex. 2
library(ISLR)
library(rpart)
library(partykit)
Carseats.train <- Carseats[1:300,]
Carseats.test <- Carseats[301:400,]
xtrain <- Carseats.train[,2:11]
xtest <- Carseats.test[,2:11]
#a)
modControl <- rpart.control(maxdepth=2)
carseat_reg_tree <- rpart(Carseats.train$Sales ~ ., xtrain, control=modControl)
#b)
plot(as.party(carseat_reg_tree), type="extended")
#c)
summary(carseat_reg_tree)
#The combination, which gives the larges average unit sales is 
#for good shelveloc and price smaller than 109.5.
#The avergae uni sales value is 11.91.
#d)
pred<- predict(carseat_reg_tree, xtrain)
plot(Carseats.train$Sales, pred, xlim = c(0,15), ylim = c(0,15), xlab = "Exact Sales", ylab= "Fitted Sales")
abline(a=0,b=1)
#e)
RMSE <- sqrt(mean((Carseats.train$Sales - predict(carseat_reg_tree, xtrain))^2, na.rm=TRUE))
print("RMSE for training data: ")
print(RMSE)

#f)
RMSE2 <- sqrt(mean((Carseats.test$Sales - predict(carseat_reg_tree, xtest))^2, na.rm=TRUE))
print("RMSE for test data: ")
print(RMSE2)