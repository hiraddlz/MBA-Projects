Auto = read.csv("Final Cars Data.csv", stringsAsFactors = T)
Auto = subset(Auto, Cylinders>=4 & Cylinders<=8)


# Boxplot MPG
boxplot(Combined.Mpg~Cylinders, 
        data = Auto,
        col="orange",
        border= "brown",
        varwidth =T,
        xlab="Cylinders",
        ylab="MPG")

one.way = aov(Combined.Mpg~Cylinders,
              data = Auto)
