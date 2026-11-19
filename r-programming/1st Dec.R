# Cooks Distance 

# Cooks Distance is an estimate of influence of a data point which takes into account 
# both the leverage and residual of each observation 
# it can be considered as a summary of how much a regression model changes when 
# the ith observation is removed

data <- read_csv("Downloads/Hitters.csv")
head(data)
summary(data)
names(data)
str(data)

# Calculating z-score in R (3 methods)

# Single Vector
data <- c(8, 7, 7, 10, 13, 14, 15, 16, 18) 
z_scores <- (data-mean(data))/sd(data)
z_scores
plot(z_scores, type="o", col="red")
# Single Column in a DataFrame
data<- data.frame(A = c(2, 5, 6, 7, 9, 13),
                  B = c(24, 20, 13, 15, 19, 20),
                  C = c(15, 5, 7, 18, 14, 10))
z_scores <- (data$B-mean(data$B))/sd(data$B)
z_scores
# Every Column in a DataFrame
sapply(data, function(data) (data-mean(data))/sd(data))
