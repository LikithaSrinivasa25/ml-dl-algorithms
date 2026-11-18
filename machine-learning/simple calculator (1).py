#!/usr/bin/env python
# coding: utf-8

# In[3]:


a=eval(input("Enter value of a: "))
b=eval(input("Enter value of b: "))
while True:
    print("Press 1 to perform Addition-")
    print("Press 2 to perform Subtraction")
    print("Press 3 to perform Multiplication")
    print("Press 4 to perform Division")
    choice=int(input("\nEnter your choice: "))
    if choice==1:
        print(round(a+b, 2))
    elif choice==2:
        print(round(a-b, 2))
    elif choice==3:
        print(round(a*b, 2))
    elif choice==4:
        print(round(a/b, 2))
    else:
        print("Invalid Choice")
        continue
    n=input("\nPress 'n' if you want to continue, else press 'y':")
    if n=='n':
        break


# In[ ]:





# In[ ]:




