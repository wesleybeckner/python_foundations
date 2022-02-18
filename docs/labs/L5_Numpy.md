<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/labs/L5_Numpy.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Lab 5: Practice with Numpy

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com

<br>

---

<br>

In this lab we will continue to practice with numpy

<br>

---





```python
import pandas as pd
import numpy as np
```

## 🧮 L5 Q1 

Get the common items between these two arrays

```
a = np.array([1,2,3,2,3,4,3,4,5,6])
b = np.array([7,2,10,2,7,4,9,4,9,8])
```


```python
# cell for Q1
a = np.array([1,2,3,2,3,4,3,4,5,6])
b = np.array([7,2,10,2,7,4,9,4,9,8])
```

## 🧮 L5 Q2

Now, get the positions where elements of `a` and `b` match

```
a = np.array([1,2,3,2,3,4,3,4,5,6])
b = np.array([7,2,10,2,7,4,9,4,9,8])
```


```python
# cell for Q2
a = np.array([1,2,3,2,3,4,3,4,5,6])
b = np.array([7,2,10,2,7,4,9,4,9,8])
```

## 🧮 L5 Q3

Get all the items that are between 5 and 10 in `b`

```
b = np.array([7,2,10,2,7,4,9,4,9,8])
```


```python
# cell for Q3
b = np.array([7,2,10,2,7,4,9,4,9,8])
```

## 🧮 L5 Q4

Read the url as a 2D array rather than a 1D array by omitting the `species` field (the last column; hint: check parameter `usecols`)

```
url = 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
iris_1d = np.genfromtxt(url, delimiter=',', dtype=None)
```


```python
# cell for Q4
url = 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
iris_data = np.genfromtxt(url, delimiter=',', dtype=None)
iris_data.shape
```

    /usr/local/lib/python3.7/dist-packages/ipykernel_launcher.py:3: VisibleDeprecationWarning: Reading unicode strings without specifying the encoding argument is deprecated. Set the encoding, use None for the system default.
      This is separate from the ipykernel package so we can avoid doing imports until





    (150,)



## 🧮 L5 Q5

Now insert np.nan in 20 random positions in the 2D `iris_data` using `random.randint`


```python
# cell for Q5
```

## 🧮 L5 Q6

Now find the total number and position of missing values in `iris_data`

Note: NumPy designed nan so that nan == nan returns False, but nan != nan returns True.

```
np.nan == np.nan
## False
np.nan != np.nan
## True

```

> This is because equivalence between missing or invalid values is not well defined. In practice, this behavior prevents silent bugs from creeping into your program.

In order to see which elements of bot are nan, you can use `np.isnan()` function.


```python
# cell for Q6
```

## 🧮 L5 Q7

Filter the rows of `iris_data` that has `petallength (3rd column) > 1.5` and `sepallength (1st column) < 5.0`


```python
# cell for Q7
```

## 🧮 L5 Q8

Select the rows of `iris_data` that do not have any `nan` values


```python
# cell for Q8
```

## 🧮 L5 Q9

compute the mean, median, and standard deviation of `sepallength`

url = 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
iris = np.genfromtxt(url, delimiter=',', dtype='object')
sepallength = np.genfromtxt(url, delimiter=',', dtype='float', usecols=[0])


```python
# cell for Q9
url = 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
iris = np.genfromtxt(url, delimiter=',', dtype='object')
sepallength = np.genfromtxt(url, delimiter=',', dtype='float', usecols=[0])
```

## 🧮 L5 Q10

normalize sepallength so that all values occur between 0 and 1

(_hint: (observation - min / (max - min))_)


```python
# cell for Q10
```

## 🧮 L5 Q11

calculate the 95 percentile score of `sepallength` using `np.percentile`


```python
# cell for Q11
```

Complete additional exercises if you wish at [machinelearningplus](https://www.machinelearningplus.com/python/101-numpy-exercises-python/)
