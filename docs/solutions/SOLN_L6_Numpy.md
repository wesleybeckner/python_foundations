<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/solutions/SOLN_L5_Numpy.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

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

print(set([i for i in a if i in b]))

# or

np.intersect1d(a,b)
```

    {2, 4}





    array([2, 4])



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

np.argwhere(a==b)
```




    array([[1],
           [3],
           [5],
           [7]])



## 🧮 L5 Q3

Get all the items that are between 5 and 10 in `b`

```
b = np.array([7,2,10,2,7,4,9,4,9,8])
```


```python
# cell for Q3
b = np.array([7,2,10,2,7,4,9,4,9,8])

b[(b > 5) & (b < 10)]
```




    array([7, 7, 9, 9, 8])



## 🧮 L5 Q4

Read the url as a 2D array rather than a 1D array by omitting the `species` field

```
url = 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
iris_1d = np.genfromtxt(url, delimiter=',', dtype=None)
```


```python
# cell for Q4
url = 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
iris_data = np.genfromtxt(url, delimiter=',', dtype=None, usecols=[0,1,2,3])
iris_data.shape
```




    (150, 4)



## 🧮 L5 Q5

Now insert np.nan in 20 random positions the 2D `iris_data`


```python
# cell for Q5
iris_data[np.random.randint(0, iris_data.shape[0], size=20),
          np.random.randint(0, iris_data.shape[1], size=20)] = np.nan
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
print(np.argwhere(np.isnan(iris_data)).shape[0])
print(np.argwhere(np.isnan(iris_data)))
```

    20
    [[  7   1]
     [ 39   3]
     [ 40   0]
     [ 56   0]
     [ 56   1]
     [ 57   3]
     [ 59   2]
     [ 63   3]
     [ 65   3]
     [ 69   3]
     [ 75   0]
     [ 86   0]
     [ 87   1]
     [ 95   1]
     [ 97   2]
     [113   3]
     [118   0]
     [124   0]
     [127   1]
     [129   2]]


## 🧮 L5 Q7

Filter the rows of iris_2d that has `petallength (3rd column) > 1.5` and `sepallength (1st column) < 5.0`


```python
# cell for Q7
iris_data[(iris_data[:, 0] < 5) & (iris_data[:, 2] > 1.5)]
```




    array([[4.8, 3.4, 1.6, 0.2],
           [4.8, 3.4, 1.9, 0.2],
           [4.7, 3.2, 1.6, 0.2],
           [4.8, 3.1, 1.6, 0.2],
           [4.9, 2.4, 3.3, nan],
           [4.9, 2.5, 4.5, 1.7]])



## 🧮 L5 Q8

Select the rows of `iris_data` that do not have any `nan` values


```python
# cell for Q8
iris_data[(np.argwhere(~np.isnan(iris_data)))]
```




    array([[[5.1, 3.5, 1.4, 0.2],
            [5.1, 3.5, 1.4, 0.2]],
    
           [[5.1, 3.5, 1.4, 0.2],
            [4.9, 3. , 1.4, 0.2]],
    
           [[5.1, 3.5, 1.4, 0.2],
            [4.7, 3.2, 1.3, 0.2]],
    
           ...,
    
           [[5.9, 3. , 5.1, 1.8],
            [4.9, 3. , 1.4, 0.2]],
    
           [[5.9, 3. , 5.1, 1.8],
            [4.7, 3.2, 1.3, 0.2]],
    
           [[5.9, 3. , 5.1, 1.8],
            [4.6, 3.1, 1.5, 0.2]]])



## 🧮 L5 Q9

compute the mean, median, and standard deviation of `sepallength`

```
url = 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
iris = np.genfromtxt(url, delimiter=',', dtype='object')
sepallength = np.genfromtxt(url, delimiter=',', dtype='float', usecols=[0])
```


```python
# cell for Q9
url = 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
iris = np.genfromtxt(url, delimiter=',', dtype='object')
sepallength = np.genfromtxt(url, delimiter=',', dtype='float', usecols=[0])

print(sepallength.mean())
print(np.median(sepallength))
print(np.std(sepallength))
```

    5.843333333333334
    5.8
    0.8253012917851409


## 🧮 L5 Q10

normalize sepallength so that all values occur between 0 and 1

(_hint: (observation - min / (max - min))_)


```python
# cell for Q10
(sepallength - np.min(sepallength)) / (np.max(sepallength) - np.min(sepallength))
```




    array([0.22222222, 0.16666667, 0.11111111, 0.08333333, 0.19444444,
           0.30555556, 0.08333333, 0.19444444, 0.02777778, 0.16666667,
           0.30555556, 0.13888889, 0.13888889, 0.        , 0.41666667,
           0.38888889, 0.30555556, 0.22222222, 0.38888889, 0.22222222,
           0.30555556, 0.22222222, 0.08333333, 0.22222222, 0.13888889,
           0.19444444, 0.19444444, 0.25      , 0.25      , 0.11111111,
           0.13888889, 0.30555556, 0.25      , 0.33333333, 0.16666667,
           0.19444444, 0.33333333, 0.16666667, 0.02777778, 0.22222222,
           0.19444444, 0.05555556, 0.02777778, 0.19444444, 0.22222222,
           0.13888889, 0.22222222, 0.08333333, 0.27777778, 0.19444444,
           0.75      , 0.58333333, 0.72222222, 0.33333333, 0.61111111,
           0.38888889, 0.55555556, 0.16666667, 0.63888889, 0.25      ,
           0.19444444, 0.44444444, 0.47222222, 0.5       , 0.36111111,
           0.66666667, 0.36111111, 0.41666667, 0.52777778, 0.36111111,
           0.44444444, 0.5       , 0.55555556, 0.5       , 0.58333333,
           0.63888889, 0.69444444, 0.66666667, 0.47222222, 0.38888889,
           0.33333333, 0.33333333, 0.41666667, 0.47222222, 0.30555556,
           0.47222222, 0.66666667, 0.55555556, 0.36111111, 0.33333333,
           0.33333333, 0.5       , 0.41666667, 0.19444444, 0.36111111,
           0.38888889, 0.38888889, 0.52777778, 0.22222222, 0.38888889,
           0.55555556, 0.41666667, 0.77777778, 0.55555556, 0.61111111,
           0.91666667, 0.16666667, 0.83333333, 0.66666667, 0.80555556,
           0.61111111, 0.58333333, 0.69444444, 0.38888889, 0.41666667,
           0.58333333, 0.61111111, 0.94444444, 0.94444444, 0.47222222,
           0.72222222, 0.36111111, 0.94444444, 0.55555556, 0.66666667,
           0.80555556, 0.52777778, 0.5       , 0.58333333, 0.80555556,
           0.86111111, 1.        , 0.58333333, 0.55555556, 0.5       ,
           0.94444444, 0.55555556, 0.58333333, 0.47222222, 0.72222222,
           0.66666667, 0.72222222, 0.41666667, 0.69444444, 0.66666667,
           0.66666667, 0.55555556, 0.61111111, 0.52777778, 0.44444444])



## 🧮 L5 Q11

calculate the 95 percentile score of `sepallength` using `np.percentile`


```python
# cell for Q11
np.percentile(sepallength, 95)
```




    7.254999999999998



Complete additional exercises if you wish at [machinelearningplus](https://www.machinelearningplus.com/python/101-numpy-exercises-python/)
