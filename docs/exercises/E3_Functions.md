<a href="https://colab.research.google.com/github/ronva-h/technology_fundamentals/blob/main/C1%20Fundamentals/LABS_PROJECT/Tech%20Fun%20C1%20L3%20Practice%20with%20Functions%20and%20Pandas.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Technology Fundamentals Course 1, Lab 3: Practice with Functions and Pandas

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com

**Teaching Assistants**: Varsha Bang, Harsha Vardhan

**Contact**: vbang@uw.edu, harshav@uw.edu

<br>

---

<br>

In this lab we will continue to practice writing functions as well as manipulating pandas DataFrames.

<br>

---




# Part I

# L3 Q1: Basic Function Writing



## Part A

Write a Python function to find the Max of three numbers




```python
# Code Cell for L3 Q1 A
```

## Part B

Write a Python function to multiply all the numbers in a list

Example:

```
Sample List : (8, 2, 3, -1, 7)
Expected Output : -336
```


```python
# Code Cell for L3 Q1 B
```

## Part C

Write a Python program to reverse a string

Example:

```
Sample String : "1234abcd"
Expected Output : "dcba4321"
```


```python
# Code Cell for L3 Q1 C
```

# L2 Q2: Finding Unique Elements

Write a Python function that takes a list and returns a new list with unique elements of the first list

Example:
```
Sample List : [1,2,3,3,3,3,4,5]
Unique List : [1, 2, 3, 4, 5]
```


```python
# Cell for L3 Q2
```

# L3 Q3: Computing Factorials

Write a Python function to calculate the factorial of a number (a non-negative integer). The function accepts the number as an argument

Example: 

```
Input: 4                                                       
Output: 24
```


```python
# Cell for L3 Q3
```

# Practicing our hand at functions by implementing recursion

We will practice the last exercise we did yesterday, this time using what we've learned about functions to write a _recursive function_

A recursive function is a function that makes a call to itself. This is particularly well suited for tasks that would otherwise require a lot of memory to hold intermediary solutions (when they are combined with a strategy called _memoization_ which we will shy away from here). The Fibonnaci sequence is a good place for such a problem. So is a factorial calculation. See here below

3! = 3 * 2 * 1
4! = 4 * 3 * 2 * 1


```python
def factorial(x):
    """This is a recursive function
    to find the factorial of an integer"""

    if x == 1:
        return 1
    else:
        # one trick to note that is common with recursive functions
        # is that the incrementation in the key variable is done
        # in the call to the function itself (vs a for loop)
        return (x * factorial(x-1))
```


```python
n = 3
factorial(n)
```




    6



In the above, we have on lines 5 and 6, what we call the _baseline_ solution. It is the answer to the simplest subset of the problem. When we build a recursive tree, it is useful to think of the smallest problem, and work upwards, providing this _leaf_ solution to nodes further up on the recursive tree. Like so:


```python
# 1! = 1
# 2! = 2 * 1!
# 3! = 3 * 2!
# N! = N * (N-1)! ... like ... like so
```

This problem is intended to be a fun way to wrap our heads around functions... don't stress. If you want to see a further breakdown of the factorial problem, check out [this link](https://www.programiz.com/python-programming/recursion)

# L3 Q4: Recursive Functions

Using recursion, complete the Fibonacci sequence up to the 10th place using recursion and any or all of the following:
* `if` `elif` `else`
* `range`

The Fibonacci sequence with indices:

1. 0
2. 1
3. 1
4. 2
5. 3
6. 5
7. 8
8. etc..

Example input:

`index = 10`

Example output:
```
Index: 10
Value: 34
```


```python
# Cell for L2 Q3
```

# Part II

# L3 Q1 

Convert the two series into the columns of a DataFrame


```python
ser1 = pd.Series(list('abcedfghijklmnopqrstuvwxyz'))
ser2 = pd.Series(np.arange(26))
```

# L3 Q2

Conver the series into a DataFrame with 7 rows and 5 columns


```python
ser = pd.Series(np.random.randint(1, 10, 35))
```

# L3 Q3

Compute the difference of differences between consecutive numbers in a series using `ser.diff()`



```python
ser = pd.Series([1, 3, 6, 10, 15, 21, 27, 35])
```

# L3 Q4 

Convert a series of dates to `datetime` format using `pd.to_datetime()`


```python
ser = pd.Series(['01 Jan 2010', '02-02-2011', '20120303', '2013/04/04', '2014-05-05', '2015-06-06T12:20'])
```

# L3 Q5

Compute the mean of weights grouped by fruit



```python
fruit = pd.Series(np.random.choice(['apple', 'banana', 'carrot'], 10))
weights = pd.Series(np.linspace(1, 10, 10))
print(weights.tolist())
print(fruit.tolist())
```

    [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
    ['banana', 'banana', 'banana', 'carrot', 'carrot', 'carrot', 'carrot', 'carrot', 'banana', 'banana']


# L3 Q6

Compute the euclidian distance between vectors p and q (pythagorean theorem)


```python
p = pd.Series([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
q = pd.Series([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
```

# L3 Q7

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


# L3 Q8

Check if there are missing values in a dataframe using `.isnull()`, `.values`, and `.any()`


```python
df = pd.read_csv('https://raw.githubusercontent.com/selva86/datasets/master/Cars93_miss.csv')
```

# L3 Q9

Grab the first column and return it as a DataFrame rather than as a series


```python
df = pd.DataFrame(np.arange(20).reshape(-1, 5), columns=list('abcde'))
```

# L3 Q10

In `df`, interchange columns 'a' and 'c'.


```python
df = pd.DataFrame(np.arange(20).reshape(-1, 5), columns=list('abcde'))
```
