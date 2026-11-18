#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
df=pd.read_csv("diabetes.csv")
display(df)


# In[3]:


df.head()


# In[ ]:





# In[7]:


from sklearn.model_selection import train_test_split, GridSearchCV 
x = df.drop(['Outcome'],axis=1) 
y = df.Outcome
test_size = 0.2

x_train, x_test, y_train, y_test = train_test_split(x,y,test_size=test_size,random_state=42)


# In[8]:


from sklearn.tree import DecisionTreeClassifier
DTC = DecisionTreeClassifier()


# In[9]:


#With k-fold
from sklearn.model_selection import cross_val_score
accuraccies = cross_val_score(estimator = DTC, X= x_train, y=y_train, cv=55)
print("Average Accuracies: ",np.mean(accuraccies))
print("Standart Deviation Accuracies: ",np.std(accuraccies))


# In[11]:


DTC.fit(x_train,y_train) 
print("Decision Tree Score: ",DTC.score(x_test,y_test))
DTCscore = DTC.score(x_test,y_test)


# In[17]:


#without k-fold
from sklearn.tree import DecisionTreeClassifier
DTC = DecisionTreeClassifier()


# In[ ]:


from sklearn.model_selection import cross_val_score

