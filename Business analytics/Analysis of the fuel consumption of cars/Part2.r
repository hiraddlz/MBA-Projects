Auto = read.csv("Final Cars Data.csv", stringsAsFactors = T)
str(Auto)
summary(Auto)

attach(Auto)
cylinders.factor = as.factor(Cylinders)

# Boxplot MPG
plot(cylinders.factor, Combined.Mpg, col="red", varwidth =T, xlab="Cylinders", ylab="MPG")
# Boxplot Fuel system
plot(Fuel.system, Combined.Mpg, col="red", varwidth =T, xlab="Fuel System", ylab="MPG")
# Boxplot Fuel system
plot(Type, Combined.Mpg, col="red", varwidth =T, xlab="Car Type", ylab="MPG")

# Histogram MPG
hist(Combined.Mpg, col=2, breaks =15)

# Pairplot
pairs(Auto)

pairs(~ Combined.Mpg + Displacement..cu..In.. + Horsepower + Weight , Auto)


