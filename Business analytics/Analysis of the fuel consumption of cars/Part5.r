# import libraries
library(caTools)
library(ROCR) # ROCR package should be installed in version 1.0-7

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

# running the logistic regression model
mpgLog = glm(mpg01 ~ Horsepower + Displacement..cu..In.. + Weight + Cylinders ,
             data = mpgTrain,
             family = binomial)
summary(mpgLog)

mpgLog2 = glm(mpg01 ~ Horsepower + Displacement..cu..In.. + Weight ,
             data = mpgTrain,
             family = binomial)
summary(mpgLog2)


# make prediction on the test data
predictTest = predict(mpgLog2, type="response", newdata = mpgTest)

# confusion matrix
confMat = table(mpgTest$mpg01, predictTest>0.5)
confMat
TN = confMat[1.1]
FP = confMat[1,2]
FN = confMat[2,1]
TP = confMat[2,2]
cat("accuracy =", (TN+TP)/(TN+TP+FP+FN))
cat("specifity =", (TN)/(TN+FP))
cat("sensitivity =", (TP)/(TP+FN))

# ROC calculations
ROCRpred = prediction(predictTest, mpgTest$mpg01)
AUC = as.numeric(performance(ROCRpred, "auc")@y.values)
cat("AUC =", AUC)

# plot ROC curve
ROCRpref = performance(ROCRpred, "tpr", "fpr")
plot(ROCRpref, colorize = TRUE, print.cutoffs.at = seq(0.1,1,0.1),text.adj = c(-0.2, 1.7))
