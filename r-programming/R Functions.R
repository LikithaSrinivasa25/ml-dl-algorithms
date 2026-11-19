# Function can be defined with any number of named arguments
# The arguments specify the components to be used in the function
# Arguments can be of any type (e.g., vectors, data.frames, lists…)

# Creating and executing a function
Myfirstfn<-function(x) {x+x}
Myfirstfn(10)

# Create a function a*b+c where a=5, b=3, c=11
Function1=function(a,b,c) {a*b+c}
Function1(5,3,11)

Function1(a=5,b=3,c=11)

Function2=function(a,b) {a^2+b^2}
Function2(5,3)

Function3=function(a,b,c) {a^3+b^3-c^2}
Function3(4,10,15)

# Print x raised to the power y x=10,y=4
Function4=function(x,y) {x^y}
Function4(10,4)

# set seed function
set.seed(200)
x=rnorm(250)
x

# Max and Min functions
max(1.2,3.4,-7.8)
max(c(1.2,3.4,-7.8))
min(1.2,3.4,-7.8)
min(c(1.2,3.4,-7.8))

# Some more functions
abs(-4)
abs(c(-1,-2,-3,4,5))
sqrt(4)
sqrt(c(4,9,16,25))
sum(c(2,3,5,7))
prod(c(2,3,5,7))
round(1.23)
round(1.83)
ceiling(1.83)
floor(1.83)
log(10)
log10(10)
log(9,base=3)

x2=c(1.6,2.8,9.6)
print(trunc(x2))
round(45642.6896,2)
trunc(45642.6896,2)
x3=12.864
round(x3,2)
cos(x3)
sin(x3)
tan(x3)
exp(x3)

# Statistical Functions
v=c(10,20,30)
v=mean(v)
v
b=c(10,20,30)
median(b)
range(b)
sum(b)

# Statistical functions like rnorm,qnorm,rbinom and so on
# Strings in R
t='I love pizza'
t
y="Hello"
y
nchar(y)

# Change case to upper and lower
toupper(t)
tolower(t)

# Extract parts of string
r=substring("programming",3,5)
r

# Create a vector of strings 
# Try the nchar command
i=c("R Programming",'red','blue')
nchar(i)
substr(i,3,6)

# To find the patterns in x-grep function
str1=c("abc",'abdef',"lpabcrq")
pattern="abc"
grep(pattern,str1)

str12=c("abc64",'abdef',"lpabcrq")
pattern12="abc64"
grep(pattern12,str12)

# Paste Function

# Substitute function 
# It finds a pattern and replaces it with the new text
stringg="This is year is 2021 and last year was 2021"
stringg
sub("2021","2022",stringg)

