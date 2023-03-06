#!/usr/bin/env python
# coding: utf-8

# ### 1. Create this dictionary:
# **{0: 0, 1: 1, 2: 8, 3: 27, 4: 64}
#  using a dictionary comprehension.**

# In[1]:


dict_1={}
for i in range (5):
    dict_1[i]=i*i*i
    
print(dict_1)


# ### 2. if the length of a word is even print "even!"

# In[10]:


st = 'Print every word in this sentence that has an even number of letters'
list_1=st.split(" ")

def word_lengths(element):
    
        count=0
        for chara in element:
            count+=1
            
        
        return count  

for i in range(len(list_1)):
        #word_length(element)
        element=list_1[i]
        if word_lengths(element)%2 == 0:
        #print(len(list[i]))
           list_1[i]='even'
print(list_1)


# ### 3. Generate Password: 17 characters , minimum 1 Uppercase, 1 lowercase, 1 digits and 2 minimun special characters

# In[12]:


import random
import string
for i in range(1):
    lower=string.ascii_lowercase
for i in range(1):
    digit=string.digits
for i in range(1):
    upper=string.ascii_uppercase
for i in range(2):
    specialchar = string.punctuation
password= lower+ upper+ digit + specialchar
newpass= random.sample(password,17)
password_final="".join(var)
print(password_final)


# ### 4. you are given a list which is [6, 15, 5, 3, 5, 14, 3, 202, 34, 235, 555, 6]. You have to sort it such that the seventh element is greatest of all, second element is greater than last element and second last element is not greater than sum of 8 and sixth element

# In[5]:


list_1=[6,15,5,3,5,14,3,202,34,235,555,6]

maximum=max(list_1)
indice=list_1.index(maximum)
list_1[indice],list_1[6] = list_1[6], list_1[indice]

if list_1[1]<list_1[-1]:
    list_1[1],list_1[-1]=list_1[-1],list_1[1]
    
print(list_1) 
indice=0

while (list_1[-2]>list_1[7] + list_1[5]):
    if indice!=1 and indice!=6:
        list_1[indice],list_1[-2]=list_1[-2],list_1[indice]
        
print(list_1)


# ### 5. Write a program that prints the integers from 1 to 100. But for multiples of three print "Fizz" instead of the number, and for the multiples of five print "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".

# In[ ]:


for i in range(1,101):
    if i%3==0 and i%5==0:
        print("FizzBuzz")
    elif i%5 == 0:
        print("Buzz")
    elif i%3 == 0 :
        print("Fizz")
    else:
        print(i)


# ### 6. Write a program that accepts a sentence and calculate the number of letters and digits. Suppose the following input is supplied to the program.

# In[ ]:


str1 = input("Enter the sentence: ")
letters=0
digits=0
for i in str1:
    if str.isalpha(i):
        letters+=1
    elif str.isdigit(i):
        digits += 1
print("alphabets:",letters)
        
print("digits:",digits)


# ### 7. Exercise: Write a program which takes 2 digits, X,Y as input and generates a 2-dimensional array. The element value in the i-th row and j-th column of the array should be i*j
# 
# [[0, 0, 0, 0, 0],
#  [0, 1, 2, 3, 4],
#  [0, 2, 4, 6, 8]
#  ..............]]

# In[ ]:


import numpy as np
rows=int(input("Enter number of rows: "))
column=int(input("Enter no of columns: "))
array=np.empty(rows*column,dtype = 'int64').reshape(rows,column)
for i in range(0,rows):
    for j in range(0,column):
        array[i][j]=(rows*column)
    
print(array)


# ## 8. For this challenge,
# Create a bank account class that has two attributes:
# 
# owner balance and two methods:
# 
# deposit withdraw As an added requirement, withdrawals may not exceed the available balance.
# 
# Instantiate your class, make several deposits and withdrawals, and test to make sure the account can't be overdrawn.

# In[ ]:


class Bank:
    def __init__(self,person,balance):
        self.person=person
        self.balance=balance
    def deposit(self,amount):
        self.balance += amount
        print("curr :" ,self.balance)
    def withdraw(self,amount):
        if(amount<self.balance):
            self.balance -= amount
        else:
            print("Insufficient balance")
        print("curr: ",self.balance)
Bankacc = Bank("Roshni", 2000)
print(Bankacc.balance)
Bankacc.deposit(1000)
Bankacc.withdraw(500)
Bankacc.withdraw(3000)
        


# In[ ]:




