# Aim of the Experiment: To calculate cook's distance and thus find the influntial 
# points in the data.

# Step1 : Import the data
data <- read_csv("Downloads/Hitters.csv")
head(data)
summary(data)
names(data)
str(data)

# Step2 : Remove the null values in the data
sum(is.na(data))
data=na.omit(data)
sum(is.na(data))

# Step3 : Multiple Linear Regression
model=lm(data$Salary~., data = data)
summary(model)
model
# We see that our baseline model has an adjusted r square of 0.5106

# Step4 : Diagnostis Plots
par(mfrow=c(2,2))
plot(model)

# The diagnostic plots shows some outliers and in the plot of residuals vs leverage 
# we observe that some of them have significant leverage
# Therefore if we want to remove these ouliers we will expect a better fit to the
# model
# Cooks distance is used to filter out any values which is greater than 3 times the 
# mean

cooksD <- cooks.distance(model)
influential <- cooksD[(cooksD > (3 * mean(cooksD, na.rm = TRUE)))]
influential
# We observe that there are 18 players who have Cooks distance greater than 3 times
# the mean
# We now remove these 18 players and re run the model to check whether the model is a 
# better fit before that we run the below code to find out the influential and 
# outlier point

names_of_influential=names(influential)
outliers=data[names_of_influential,]
outliers

# To fit a linear model without the outiers we use the anti_join command in dplyr
hitters_without_outliers=data%>%anti_join(outliers)
model2=lm(Salary~.,data=hitters_without_outliers)
model2
summary(model2)
# We observe that adjusted r square is 0.6445 whereas the model with outiers had 
# adjusted r square 0.5106 
# Thus the accuracy of the model has improved significantly using Cooks distance

# We plot the diagnostic plots for the new model
par(mfrow=c(2,2))
plot(model2)

# We observe that the residual plots have greatly improved and there are no points 
# with significant leverage thus after removing the outliers we find that the model 
# will be a better fit
