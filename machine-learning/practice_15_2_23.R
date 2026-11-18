library(readxl)
role1 <- read_excel("C:/D/Primax_2_23/role1.xlsx")
View(role1)
role2=read.csv(file.choose())
head(role2)
sum(is.na(role2))
complete.cases(role2)
role=role2[,1:25]
complete.cases(role)
str(role)
role$Gender=factor(role$Gender,levels=c(1,2),labels=c("Male","Female"))
role$Age=factor(role$Age,levels=c(1,2,3),labels=c("Below 25","25-35","Above 35"))
role$Edn=factor(role$Edn,levels=c(1,2),labels=c("Professional","Nonprofessional"))
role$Exp=factor(role$Exp,levels=c(1,2,3),labels=c("Below 5","5-15","Above 15"))
str(role)
roles=role[,6:25]
head(roles)
library(psych)
role$WR=role$Q1+role$Q2+role$Q3+role$Q4+role$Q5
role$RC=role$Q6+role$Q7+role$Q8+role$Q9+role$Q10
role$PR=role$Q11+role$Q12+role$Q13+role$Q14+role$Q15
role$GO=role$Q16+role$Q17+role$Q18+role$Q19+role$Q20
role$Total=role$WR+role$RC+role$PR+role$GO
head(role)
rolef=role[,26:30]
summary(role$Total)
role$Level=cut(role$Total,c(0,65.5,80,100),labels=c("Low","Moderate","High"))

#Sampling distribution
repexp=replicate(10000,mean(rexp(100,0.25)))
mean(repexp) 
sd(repexp)
hist(repexp,freq=FALSE,breaks=10,col="66",xlab="Mean values",main="Histogram density curve")
lines(density(repexp), col="blue", lwd=2)

#Test for Normality
hist(role$Total,freq=F)
plot(density(role$Total))
qqnorm(role$Total)
qqline(role$Total)
shapiro.test(role$Total)

#Inferential analysis
#t test for Single Mean
help(t.test)
t.test(role$Q2,mu=3,alternative = "greater")
sd(role$Q2)

#Independent t-test
var.test(role$Total~role$Gender)
t.test(role$Total~role$Gender,var.equal=T)

#One way Anova
boxplot(role$Total~role$Age)
aa=aov(role$Total~role$Age)
summary(aa)
aaa=aov(role$PR~role$Age)
summary(aaa)
install.packages("agricolae")
library( "agricolae")
pp=duncan.test(aaa,"role$Age")
pp
plot(duncan.test(aaa,"role$Age"))
aa=aov(role$Total~role$Age)
summary(aa)
pp=duncan.test(aa,"role$Age")
pp
plot(duncan.test(aa,"role$Age"))

#Two Way Anova
ab=aov(role$Total~role$Age*role$Gender)
summary(ab)

#Paired t-test
t.test(role$WR,role$GO,paired = T)

#Correlatiom
cor(role$WR,role$GO)
cor(rolef[,-5])
install.packages("Hmisc")
library(Hmisc)
rcorr(as.matrix(rolef[-5]), type="pearson")

#Nonparametric test
wilcox.test(role$Q11,mu=3)
median(role$Q11)

wilcox.test(role$WR~role$Edn)
wilcox.test(role$RC~role$Edn)
wilcox.test(role$PR~role$Edn)
wilcox.test(role$GO~role$Edn)
library(psych)
describe.by(role$WR,role$Edn)


wilcox.test(role$WR,role$RC,paired=T)
wilcox.test(role$WR,role$GO,paired=T)

kruskal.test(role$WR~role$Exp)
describe.by(role$WR,role$Exp)

kruskal.test(role$RC~role$Exp)
describe.by(role$RC,role$Exp)

kruskal.test(role$PR~role$Exp)
describe.by(role$PR,role$Exp)

kruskal.test(role$GO~role$Exp)
describe.by(role$GO,role$Exp)


describeBy(role$GO,role$Exp)


help(friedman.test)
friedman.test(as.matrix(rolef[-5]))
median(role$WR)
median(role$RC)
median(role$PR)              
median(role$GO)


cor(role$WR,role$RC,method="spearman")
cor(role$WR,role$PR,method="spearman")



install.packages("Hmisc")
library(Hmisc)
rcorr(as.matrix(rolef[-5],), type="spearman")


table(role$Level)
prop.table(table(role$Level))
chisq.test(c(38,72,40),p=rep(1/3,3))


chisq.test(table(role$Gender,role$Level))
table(role$Gender,role$Level)
addmargins(table(role$Gender,role$Level))
prop.table(table(role$Gender,role$Level))
addmargins(prop.table(table(role$Gender,role$Level)))


#Linear Regression
data(women)
women
fit <- lm(weight ~ height, data=women)
summary(fit)
plot(women$height,women$weight,xlab="Height (in inches)",ylab="Weight (in pounds)")
abline(fit)
cor(women$weight,women$height)
beta111=3.45*sd(women$height)/sd(women$weight)


#Multiple Regression
data(package="psych")
state.x77
states=as.data.frame(state.x77[,c("Murder",
                                  "Population","Illiteracy","Income","Frost")])
class(states)
fit1 <- lm(Murder ~ Population + Illiteracy 
           + Income + Frost,data=states)
summary(fit1)

fit2 <- lm(Murder ~ Population + Illiteracy ,data=states)
summary(fit2)

anova(fit1,fit2)
AIC(fit1)
AIC(fit2)


rsquare=cor(states$Murder,predict(fit2))^2 
rsquare

#Finding standardized regression coefficients
names(states)
cc=cor(states[,1:3])
Streg=solve(cc[2:3,2:3])%*%cc[1,2:3]
Streg

b1=0.0002242*sd(states$Population/sd(states$Murder))
b1
b2=4.08*sd(states$Illiteracy/sd(states$Murder))
b2

install.packages("QuantPsyc")
library(QuantPsyc)
lm.beta(fit2)

ss=scale(states[,1:3])
af=lm(ss[,1]~ss[,2]+ss[,3])
af

AIC(fit1)
AIC(fit2)
#Prediction values
newMult = data.frame(Population=c(1000,2000),
                     Illiteracy=c(1.52,2.5))
cbind(newMult,predict(fit2,newMult,interval="confidence", level = 0.95))


#Generalized linear Model
#Logistic Regression
mydata =read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(mydata)
dim(mydata)
table(mydata$admit)
glmoutput=glm(admit~gre+gpa+factor(rank),
              data=mydata,family=binomial)
summary(glmoutput)
coef(glmoutput)
exp(coef(glmoutput))
testdata =data.frame(rank=c(1, 2, 3, 4), 
                     gre=mean(mydata$gre),
                     gpa=mean(mydata$gpa))
testdata$prob <- predict(glmoutput, 
                         newdata=testdata, 
                         type="response")
testdata$prob
testdata

#Poission Regression
download.file("https://www.jstatsoft.org/index.php/jss/article/downloadSuppFile/v027i08/DebTrivedi.rda.zip","DebTrivedi.rda.zip")
unzip("DebTrivedi.rda.zip")
load("DebTrivedi.rda")
names(DebTrivedi)
dt1 <- DebTrivedi[, c(1, 6:8, 13, 15, 18)]
dim(dt1)
names(dt1)
table(dt1$ofp)
pois <- glm(ofp ~hosp+health+numchron+gender+school+privins, data = dt1, family = poisson)
summary(pois)
exp(coef(pois))
table(DebTrivedi$health)

#Checking Reliability
job=read.csv(file.choose())
head(job)
job1=job[,6:25]
class(job1)
library(psych)
psych::alpha(job1)
alpha(job1)
KMO(job1)
cortest.bartlett(job1)

#Principal Component Analysis
library(psych)
help(fa.parallel)
#PCA Method
#dev.new()
#par(mfrow=c(1,1))
fa.parallel(job1,fa="pc", n.iter=100,
            show.legend=FALSE, 
            main="Scree plot with parallel analysis")
#par(mfrow=c(1,1))
pc2<- principal(job1, nfactors=5)
pc2

rc1 <- principal(job1, nfactors=5, rotate="varimax")
rc1

#Exploratory Factor Analysis
library(psych)
fa.parallel(job1,fa="both", n.iter=100,show.legend=TRUE, main="Scree plots with parallel analysis")
fa=fa(job1, nfactors=5, rotate="none",fm="pa")
fa
fa.varimax=fa(job1, nfactors=5, rotate="varimax",fm="pa")
fa.varimax
install.packages("GPArotation")
library(GPArotation)
fa.promax=fa(job1, nfactors=5, rotate="promax",fm="pa")
fa.promax
names(fa.promax)
fa.promax$loadings

fa.diagram(fa.promax,simple=F)

fa.diagram(fa.varimax,simple=F)

#Structural Equation Modelling
install.packages(c("lavaan","semPlot","lavaanPlot"))

#Path analysis
loyal=read.csv(file.choose())
#loyal=read.csv("semmodels.csv",header=T,sep=",")
install.packages("lavaan")

library("lavaan")
model='
expectation~purchase+perception
satisfaction~expectation+perception
loyalty~satisfaction
'

path=sem(model,data=loyal)
#parTable(path)
summary(path)
fitmeasures(path,fit.measures=c("chisq","pvalue","GFI", "AGFI", "RMSEA", "NFI", "NNFI", "CFI","rmr","tli"))
parameterEstimates(path)
parameterEstimates(path, ci=FALSE,standardized=TRUE)
install.packages("lavaanPlot")
library(lavaanPlot)
lavaanPlot(model = path,  node_options = 
             list(shape = "box", fontname = "Helvetica"), 
           edge_options = list(color = "grey"), 
           coefs = TRUE, covs = TRUE, stars = TRUE)
lavaanPlot(model = path,  node_options = 
             list(shape = "box", fontname = "Helvetica"),
           edge_options = list(color = "grey"), 
           coefs = TRUE, covs = TRUE, stars = TRUE,stand=T)
#lavaanPlot(model=path)
#lavaanPlot(model=path,coefs = TRUE, covs = TRUE)
install.packages("semPlot")
library("semPlot")
semPaths(path,whatLabels="par",layout="tree")
#Unstandardised
semPaths(path,whatLabels="par",layout="spring",residuals=FALSE)
#standardised
semPaths(path,"std", edge.label.cex = 0.5, exoVar = FALSE,exoCov = FALSE)

#confirmatory factor analysis

cfadata=read.csv("cfadata.csv",sep=",",header=T)
enabler=cfadata[2:7]
head(enabler)
library("lavaan")
library(lavaanPlot)
library("semPlot")
modelenab='enabler=~a1+a2+a3+a4+a5+a6'
enab=cfa(modelenab,data=enabler)
fitmeasures(enab,fit.measures=c("chisq","df","pvalue","GFI", "AGFI", "RMSEA", "NFI", "NNFI", "CFI","rmr","tli"))
modificationindices(enab)
modelenab1='enabler=~a1+a2+a3+a4+a5+a6
a1~~a2'
enab1=cfa(modelenab1,data=enabler)
semPaths(enab1,whatLabels="par",layout="tree",residuals=FALSE)
fitmeasures(enab1,fit.measures=c("chisq","df","pvalue","GFI", "AGFI", "RMSEA", "NFI", "NNFI", "CFI","rmr","tli"))
parameterEstimates(enab1,standardized=TRUE)

modelenab2='enabler=~a2+a3+a4+a5+a6'
enab2=cfa(modelenab2,data=enabler)
fitmeasures(enab2,fit.measures=c("chisq","df","pvalue","GFI", "AGFI", "RMSEA", "NFI", "NNFI", "CFI","rmr","tli"))
parameterEstimates(enab2,standardized=TRUE)
lavaanPlot(model = enab2,  node_options = list(shape = "box", fontname = "Helvetica"), edge_options = list(color = "grey"), coefs = TRUE, covs = TRUE, stars = TRUE,stand=F)
lavaanPlot(name="plot",model=enab2,coefs = TRUE, covs = TRUE,stand=T)
