# Anti_join command in dplyr

# This command is used for getting all rows in one dataframe that do not have a matching 
# value in the other dataframe 
# eg: Create two dataframes in the following matter

library(dplyr)
df1 <- data.frame(team=c('A', 'B', 'C', 'D', 'E'),
                  points=c(12, 14, 19, 24, 36))

df2 <- data.frame(team=c('A', 'B', 'C', 'F', 'G'),
                  points=c(12, 14, 19, 33, 17))

# The anti_join function will return all the rows in the first dataframe which do not 
# have a matching member in the second dataframe
# Perform anti_join using 'team' column
anti_join(df1,df2,by='team')
 
# Eg2: Consider using anti_join  with multiple columns
df1 <- data.frame(team=c('A', 'A', 'A', 'B', 'B', 'B'),
                  position=c('G', 'G', 'F', 'G', 'F', 'C'),
                  points=c(12, 14, 19, 24, 36, 41))

df2 <- data.frame(team=c('A', 'A', 'A', 'B', 'B', 'B'),
                  position=c('G', 'G', 'C', 'G', 'F', 'F'),
                  points=c(12, 14, 19, 33, 17, 22))

# We can use the anti_join() function to return all rows in the first data frame 
# that do not have a matching team and position in the second data frame:
# Perform anti join using 'team' and 'position' columns
anti_join(df1, df2, by=c('team', 'position'))
