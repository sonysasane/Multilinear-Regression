
df <- read.csv("500_Startups.csv")

head(df)
str(df)
levels(df$State)

#check which variable is categorical and convert it into factor

df$State <- factor(df$State, 
                   levels = c("California", "Florida", "New York"), 
                   labels = c(1,2,3))

str(df)

#splitting the data

install.packages("caTools")
library(caTools)
set.seed(123)
split <- sample.split(df$Profit,SplitRatio = 0.8)
split
training_set <- subset(df, split == TRUE)
test_set <- subset(df, split == FALSE)


#applying model
regressor <- lm(data = training_set, formula = Profit ~ .)
summary(regressor)

#predicting
y_predict <- predict(regressor,newdata = test_set)
y_predict

# backward elimination
regressor <- lm(data = df, formula = Profit ~ R.D.Spend + Administration + Marketing.Spend)
summary(regressor)



regressor <- lm(data = df, formula = Profit ~ R.D.Spend +  Marketing.Spend)
summary(regressor)

regressor <- lm(data = df, formula = Profit ~ R.D.Spend )
summary(regressor)








