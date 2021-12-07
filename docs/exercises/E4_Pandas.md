<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/exercises/E4_Pandas.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Lab 4: Practice with Pandas

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com<br>

---

<br>

In this lab we will continue to practice manipulating pandas DataFrames.

<br>

---




## 🐼 L3 Q1 

Convert the two series into the columns of a DataFrame


```python
ser1 = pd.Series(list('abcedfghijklmnopqrstuvwxyz'))
ser2 = pd.Series(np.arange(26))
```

## 🐼 L3 Q2

Conver the series into a DataFrame with 7 rows and 5 columns


```python
ser = pd.Series(np.random.randint(1, 10, 35))
```

## 🐼 L3 Q3

Compute the difference of differences between consecutive numbers in a series using `ser.diff()`



```python
ser = pd.Series([1, 3, 6, 10, 15, 21, 27, 35])
```

## 🐼 L3 Q4 

Convert a series of dates to `datetime` format using `pd.to_datetime()`


```python
ser = pd.Series(['01 Jan 2010', '02-02-2011', '20120303', '2013/04/04', '2014-05-05', '2015-06-06T12:20'])
```

## 🐼 L3 Q5

Compute the mean of weights grouped by fruit



```python
fruit = pd.Series(np.random.choice(['apple', 'banana', 'carrot'], 10))
weights = pd.Series(np.linspace(1, 10, 10))
print(weights.tolist())
print(fruit.tolist())
```

    [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
    ['banana', 'banana', 'banana', 'carrot', 'carrot', 'carrot', 'carrot', 'carrot', 'banana', 'banana']


## 🐼 L3 Q6

Compute the euclidian distance between vectors p and q (pythagorean theorem)


```python
p = pd.Series([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
q = pd.Series([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
```

## 🐼 L3 Q7

Fill in missing values for dates with the previous dates' value using `ser.bfill()` or `ser.ffill()`


```python
ser = pd.Series([1,10,3,np.nan], index=pd.to_datetime(['2000-01-01', '2000-01-03', '2000-01-06', '2000-01-08']))
print(ser)
```

    2000-01-01     1.0
    2000-01-03    10.0
    2000-01-06     3.0
    2000-01-08     NaN
    dtype: float64


## 🐼 L3 Q8

Check if there are missing values in a dataframe using `.isnull()`, `.values`, and `.any()`


```python
df = pd.read_csv('https://raw.githubusercontent.com/selva86/datasets/master/Cars93_miss.csv')
```

## 🐼 L3 Q9

Grab the first column and return it as a DataFrame rather than as a series


```python
df = pd.DataFrame(np.arange(20).reshape(-1, 5), columns=list('abcde'))
```

## 🐼 L3 Q10

In `df`, interchange columns 'a' and 'c'.


```python
df = pd.DataFrame(np.arange(20).reshape(-1, 5), columns=list('abcde'))
```
