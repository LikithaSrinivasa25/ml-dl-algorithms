
#Decomposition of Time Series

#Generally, we can categorize patterns in time series data into the following two categories:
  
#Structural patterns - also known as the series components.
#There are three main components:
#trend - the series growth overtime
#cycle - repeated events over time that are not equally spaced
#seasonal - repeated events over time that are equally spaced
#Non-structural patterns - also known as the irregular components, which is basically
#any pattern on the series that is not represented by the structural patterns.

#We can express those components using the following notation

#additive structure: Yt=Tt+Ct+St+It
#multiplicative structure: Yt=Tt×Ct×St×It

# AIM : To decompose time series data, with the goal of separating it into its 
#fundamental components: the trend, seasonal patterns, and irregular fluctuations.

## DATASET 1: AirPassengers
#This dataset describes the monthly number of international passengers (in thousands)
#in the US between 1949 and 1960.

# Load required libraries and the data
library(TSstudio)
data("AirPassengers")

# Description of the data
ts_info(AirPassengers)

# visualize the data
ts_plot(AirPassengers,
        title = "Monthly Airline Passenger Numbers 1949-1960",
        Ytitle = "Thousands of Passengers",
        Xtitle = "Year")

# Classical Decomposition
#The classical decomposition (or by its full name - classical seasonal decomposition 
#by moving average) is one of the most common estimation methods of the series components.
#R provides a built-in method for decomposing time
#series with the decompose function from the stats package. 

# Additive Decomposition
d <- decompose(AirPassengers)
str(d)
plot(d)

#We can notice that the random component is not so random. The main reason is
#that the decompose function, by default, uses adaptive calculation for the seasonal
#component(based on additive structure). Decomposition of Multiplicative Time Series
#is shown below.

# Multiplicative Time Series
d_m <- decompose(AirPassengers, type = "multiplicative")
plot(d_m)

#The ts_decompose function from the TSstudio provides an interactive wrapper for the 
#decompose function plot method and enables us to plot, side by side, the decomposition 
#of both additive and multiplicative methods.

ts_decompose(AirPassengers, type = "both")

# DATASET 2: Wages
#This dataset contains monthly values of the average hourly wages (in dollars) for 
#workers in the U.S. apparel and textile products industry for July 1981 through June 1987.

# Load required libraries and data
library(TSA)
data(wages)

# View the data
head(wages)

# Structure of the data
str(wages)

# Dataset Summary Statistics
summary(wages)

# Visualize the data
ts_plot(wages,
        title = "Monthly Wages per Hour 1981-1987",
        Ytitle = "Wages per hour",
        Xtitle = "Year")

# Additive Decomposition
d <- decompose(wages)
str(d)
plot(d)

# Multiplicative Time Series
d_m <- decompose(wages, type = "multiplicative")
plot(d_m)

ts_decompose(wages, type = "both")

# CONCLUSION:
#Here, we have showed the classical seasonal decomposition of time series using 
#both additive and multiplicative structures.
