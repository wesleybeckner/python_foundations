<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/exercises/E5_Numpy.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

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

Create a 3x3 array of all True's (booleans)


```python
# cell for Q1
```

## 🧮 L5 Q2

extract all numbers divisible by 3

```
arr = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
```


```python
# cell for Q2
arr = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
```

There is a nifty tool, `np.where()`. The syntax works like `np.where(<where this condition is true> , <return elements from this array>, <otherwise return elements from this aray>)`


```python
# Ex
a = np.arange(10)
np.where(a<5, a, a*10)
```




    array([ 0,  1,  2,  3,  4, 50, 60, 70, 80, 90])



A similar but slightly different tool is `np.argwhere` which will return the indices of the array where the conditional is true


```python
# Ex
np.argwhere(a<5)
```




    array([[0],
           [1],
           [2],
           [3],
           [4]])



## 🧮 L5 Q3

replace all odd numbers in `arr` without changing `arr` (return a new array using `np.where`)


```python
# cell for Q3
arr = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
```

## 🧮 L5 Q4

create the following array without hard coading (i.e. don't write any of the values in your coad)

```
a = np.array([1,2,3])`
# desired output:
#> array([1, 1, 1, 2, 2, 2, 3, 3, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3])
```

Hints:

* [repeat](https://numpy.org/doc/stable/reference/generated/numpy.repeat.html)
* [tile](https://numpy.org/doc/stable/reference/generated/numpy.tile.html)


```python
# cell for Q4
a = np.array([1,2,3])
# desired output:
#> array([1, 1, 1, 2, 2, 2, 3, 3, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3])
```

## 🧮 L5 Q5
get indices where elements in `a` and `b` match.


```python
# cell for Q5
a = np.array([1,2,3,2,3,4,3,4,5,6])
b = np.array([7,2,10,2,7,4,9,4,9,8])
```

## 🧮 L5 Q6

grab numbers between 5 and 10 in `b`


```python
# cell for Q6
b = np.array([7,2,10,2,7,4,9,4,9,8])
```

## 🧮 L5 Q7

swap columns 2 and 3 in `arr`


```python
# cell for Q7
arr = np.arange(9).reshape(3,3)
```

## 🧮 L5 Q8

compute the mean, median, and standard deviation of `sepallength`


```python
# cell for Q8
url = 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
iris = np.genfromtxt(url, delimiter=',', dtype='object')
sepallength = np.genfromtxt(url, delimiter=',', dtype='float', usecols=[0])
```

## 🧮 L5 Q9

normalize sepallength so that all values occur between 0 and 1

(_hint: (observation - min / (max - min))_)


```python
# cell for Q9
```

## 🧮 L5 Q10

calculate the 95 percentile score of `sepallength` using `np.percentile`


```python
# cell for Q10
```

Complete additional exercises if you wish at [machinelearningplus](https://www.machinelearningplus.com/python/101-numpy-exercises-python/)


```python

```
