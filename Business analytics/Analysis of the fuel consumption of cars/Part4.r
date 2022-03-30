# import libraries
library(caTools)

Auto = read.csv("Final Cars Data.csv", stringsAsFactors = T)


df <- Auto[ -c(1:3, 5:6, 10) ]
Cor.Auto <- cor(df, use="complete.obs")

# Plot Correlation Matrix
library('corrplot')
corrplot(Cor.Auto, method="color", order="hclust", addCoef.col = "black", tl.col="black", tl.srt=45)

# Linear regression model
model1 = lm(Combined.Mpg ~ Displacement..cu..In.. + Horsepower, data=Auto)
summary(model1)

# split the data into train and test
library(caTools)
set.seed(123)
spl = sample.split(Auto$Combined.Mpg, SplitRatio = 0.7)
Train = subset(Auto, spl == T)
Test = subset(Auto, spl ==F)

# Linear regression model
RegModel = lm(Combined.Mpg ~ Displacement..cu..In.. + Horsepower,
              data = Train)
summary(RegModel)
RegModel.Pred = predict(RegModel, newdata = Test)
RegModel.SSE = sum((RegModel.Pred - Test$Combined.Mpg)^2)
RegModel.SSE
