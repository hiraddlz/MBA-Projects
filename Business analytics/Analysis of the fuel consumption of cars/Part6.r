# import libraries
library(caTools)
library(rpart)
library(rpart.plot)

Auto = read.csv("Final Cars Data.csv", stringsAsFactors = T)


# Creating mpg01 variable
mpg01 <- rep(0, length(Auto$Combined.Mpg))
mpg01[Auto$Combined.Mpg > median(Auto$Combined.Mpg)] <- 1
Auto <- data.frame(Auto, mpg01)

df <- Auto[ -c(1:3, 5:6, 10) ]

# split the dataset
set.seed(1000)
split = sample.split(df$mpg01, SplitRatio = 0.7)
mpgTrain = subset(df, split==TRUE)
mpgTest = subset(df, split==FALSE)

# -----PART A------

# running the classification tree model
classTreeModel=rpart(mpg01 ~ Price + RPM + Horsepower + Displacement..cu..In.. + Weight + Cylinders ,
             data = mpgTrain,
             method="class")
# Plot the tree
prp(classTreeModel)


predictCART = predict(classTreeModel, newdata = mpgTest)

# confusion matrix with 0.5 threshold
confMat = table(mpgTest$mpg01, predictCART[,2]>0.5)
confMat
TN = confMat[1.1]
FP = confMat[1,2]
FN = confMat[2,1]
TP = confMat[2,2]
cat("accuracy =", (TN+TP)/(TN+TP+FP+FN))
cat("specifity =", (TN)/(TN+FP))
cat("sensitivity =", (TP)/(TP+FN))

# Plot ROC curve
library(ROCR)
predictROC = predict(classTreeModel, newdata = mpgTest)
pred = prediction(predictROC[,2], mpgTest$mpg01)
perf = performance(pred, "tpr", "fpr")
plot(perf)

# AUC calculation
AUC = as.numeric(performance(pred, "auc")@y.values)
cat("AUC =", AUC)


# -----PART B------


# running the Regression Tree model
regTreeModel=rpart(Combined.Mpg ~ Price + RPM + Horsepower + Displacement..cu..In.. + Weight + Cylinders ,
             data = mpgTrain)


# Plot the tree
prp(regTreeModel)

TreeModel.Pred = predict(regTreeModel, newdata = mpgTest)
TreeModel.SSE = sum((TreeModel.Pred - mpgTest$Combined.Mpg)^2)
TreeModel.SSE

# Parameter selection
# K-fold Cross-Validation

library(caret)
library(e1071)
# Define how many folds we want
numFolds = trainControl(method="cv",
                        number= 10)

# possible values for cp parameter
cpGrid = expand.grid(.cp = seq(0, 0.01, 0.001))

# Cross-Validation Results
tr = train(Combined.Mpg ~ Price+RPM+Horsepower+Displacement..cu..In..+Weight+Cylinders,
           data=mpgTrain,
           method="rpart",
           trControl=numFolds,
           tuneGrid=cpGrid,
           na.action = na.omit)
tr

# Selecting the best tree
best.tree = tr$finalModel
prp(best.tree)

best.tree.pred = predict(best.tree,
                         newdata = mpgTest)
best.tree.SSE = sum((best.tree.pred - mpgTest$Combined.Mpg)^2)
best.tree.SSE

