<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/labs/L4_Pandas.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Lab 5: Practice Visualization

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com<br>

---

<br>

In this lab we will make some nifty data visualizations!

<br>

---





```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import random
from sklearn.linear_model import LinearRegression
```

## 📊 L5 Q1 

Create a bar plot of the following pokemon with their healthpoints


```python
pokemon = ['Charmander', 'Pikachu', 'Squirtle', 'Bulbasaur']
hp = [10, 12, 8, 16]
```

## 📊 L5 Q2

Create the same bar plot with error bars using the provided list `variance`


```python
np.random.seed(1)
pokemon = ['Charmander', 'Pikachu', 'Squirtle', 'Bulbasaur']
hp = [10, 12, 8, 16]
variance = [i * random.random()*.25 for i in hp]
```

## 📊 L5 Q3

You have worker shift performance data. Each `shift` list contains 10 samples of how many kilograms of product were produced in a shift. Create a boxplot of this worker data. Each shift should be a separate block



```python
np.random.seed(7)
shift_one = [round(i) for i in np.random.normal(16, 3, 10)]
shift_two = [round(i) for i in np.random.normal(21, 3, 10)]
shift_three = [round(i) for i in np.random.normal(16, 3, 10)]
shift_four = [round(i) for i in np.random.normal(16, 3, 10)]
```

## 📊 L5 Q4 

Create a scatter plot of x vs y


```python
# we can throttle the error rate
err = .5
random.seed(42)

# our data has a KNOWN underlying functional form (log(x))
def func(x, err):
    return np.log(x) + err * random.randint(-1,1) * random.random()
x = np.arange(20,100)
y = [func(t, err) for t in x]
```

## 📊 L5 Q5

Compute the mean and standard deviation of weights grouped by fruit then display the result as a bar chart with error bars



```python
fruit = pd.Series(np.random.choice(['apple', 'banana', 'carrot'], 10))
weights = pd.Series(np.linspace(1, 10, 10))
print(weights.tolist())
print(fruit.tolist())
```

    [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
    ['apple', 'carrot', 'banana', 'banana', 'apple', 'banana', 'banana', 'banana', 'carrot', 'banana']


## 📊 L5 Q6

Make a scatter plot of `X_train` vs `y_train`. On the same plot, add a dotted line representation of the linear model estimated from `X_train` and `y_train` (you can use `X_seq` and `y_seq` to do this)


```python
random.seed(42)

X_train = random.sample(list(x), 30)
indices = [list(x).index(i) for i in X_train]
y_train = [y[i] for i in indices]

# solve the slope and intercept of our 1-degree polynomial ;)
model = LinearRegression()
model.fit(np.array(X_train).reshape(-1,1), y_train)

# create some x data to plot our functions
X_seq = np.linspace(min(X_train),max(X_train),300).reshape(-1,1)
y_seq = model.predict(X_seq)
```
