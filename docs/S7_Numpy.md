<a href="https://colab.research.google.com/github/wesleybeckner/technology_fundamentals/blob/main/C2%20Statistics%20and%20Model%20Creation/Tech_Fun_C2_S2_Numpy_and_Debugging.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Technology Fundamentals Course 2, Session 2: Numpy and Debugging

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com

**Teaching Assitants**: Varsha Bang, Harsha Vardhan

**Contact**: vbang@uw.edu, harshav@uw.edu

---

<br>

Today, we will jump into the **Numpy** package.  


#### [``numpy``](http://numpy.org/): Numerical Python

Numpy is short for "Numerical Python", and contains tools for efficient manipulation of arrays of data.
If you have used other computational tools like IDL or MatLab, Numpy should feel very familiar.

<br>

---

## Import Libraries


```python
# for numpy section
import numpy as np
np.random.seed(42)
```


```python
# for debugging section
import random
from contextlib import contextmanager
import sys, os

@contextmanager
def suppress_stdout():
    with open(os.devnull, "w") as devnull:
        old_stdout = sys.stdout
        sys.stdout = devnull
        try:  
            yield
        finally:
            sys.stdout = old_stdout
```

## 2.1 NumPy Arrays

### 2.1.1 Creating NumPy Arrays

When we worked with lists, we saw that we could fill them with all sorts of datatypes. NumPy arrays are necessarily of one datatype:


```python
# these will all be ints
np.array([1, 2, 3, 6, 5, 4])
```




    array([1, 2, 3, 6, 5, 4])




```python
# these will all be floats
np.array([1, 2, 3.14, 6, 5, 4])
```




    array([1.  , 2.  , 3.14, 6.  , 5.  , 4.  ])



We can check the data types in the standard way:


```python
arr = np.array([1, 2, 3, 6, 5, 4])
for i in arr:
  print(type(i))
```

    <class 'numpy.int64'>
    <class 'numpy.int64'>
    <class 'numpy.int64'>
    <class 'numpy.int64'>
    <class 'numpy.int64'>
    <class 'numpy.int64'>


We see that all types are _upcast_ to the most complext object in the array. For instance, because 3.14 is a float, all the other numbers in the array will be a float:


```python
for i in np.array([1, 2, 3.14, 6, 5, 4]):
  print(type(i))
```

    <class 'numpy.float64'>
    <class 'numpy.float64'>
    <class 'numpy.float64'>
    <class 'numpy.float64'>
    <class 'numpy.float64'>
    <class 'numpy.float64'>


We can also specify the datatypes in the array:


```python
np.array([1, 2, 3.14, 6, 5, 4], dtype='float32')
```




    array([1.  , 2.  , 3.14, 6.  , 5.  , 4.  ], dtype=float32)



#### 2.1.1.1 Exercise: Specify datatype

Create an array of 5 numbers whose datatypes are 16 bit integers. Make one of the numbers not a whole number. What happens to the number when it is stored in the 16 bit integer array?


```python
# Cell for Ex 1
```

### 2.1.2 Creating Arrays from NumPy Methods


```python
# create an array of 10 zeros
# how can we specify the datatype?
np.zeros(10)
```




    array([0., 0., 0., 0., 0., 0., 0., 0., 0., 0.])




```python
# create an array of 10 1's
np.ones(10)
```




    array([1., 1., 1., 1., 1., 1., 1., 1., 1., 1.])




```python
# fill an array of the following dimensions
# with value 42
np.full((2,3), 42)
```




    array([[42, 42, 42],
           [42, 42, 42]])




```python
# arange from start (inc) to stop (exc)
# integers with step size
np.arange(1, 10, 2)
```




    array([1, 3, 5, 7, 9])




```python
# create an array of numbers that divides
# the space between start and stop (inc, inc)
# with X equally spaced intervals
np.linspace(0, 10, 5)
```




    array([ 0. ,  2.5,  5. ,  7.5, 10. ])




```python
# create an array of values drawn from a 
# uniform distribution
np.random.random(5)
```




    array([0.37454012, 0.95071431, 0.73199394, 0.59865848, 0.15601864])




```python
# create an array of values from a normal distribution
np.random.normal(loc=0, scale=1, size=(5,5))
```




    array([[ 0.61764085,  1.2170708 ,  0.22628827,  0.84740143,  0.17483301],
           [-1.21685489,  1.04934739,  1.32510566,  0.73450106, -0.95449726],
           [-0.75117942, -1.13042805,  0.76997736,  1.26838952,  0.42448624],
           [ 0.94053558, -0.86764109,  0.14586185, -1.36987106, -0.77178075],
           [ 0.87867355, -0.23959451,  1.20938197,  0.53796   ,  2.73442216]])




```python
# create an array of random integers between 5 and 10 with shape 2x2
np.random.randint(5, 11, (2,2))
```




    array([[5, 9],
           [8, 9]])



### 2.1.3 Exercise: Creating Arrays

a. Create a 5x5 array of ones with datatype `int16`


```python
# Cell for Ex 3.1.3 a
```

b. Create an array of 10 numbers drawn from a uniform distribution between 0 and 1


```python
# Cell for Ex 3.1.3 b
```

c. Create an array of 10 numbers drawn from a normal distribution centered at 80 with a standard deviation of 5


```python
# Cell for Ex 3.1.3 c
```

d. Create an array of 10 intergers drawn from a uniform distribution between 5 and 10 inclusive


```python
# Cell for Ex 3.1.3 d
```

## 2.2 NumPy Array Attributes

Common array attributes are `shape`, `size`, `nbytes`, and `itemsize`


```python
my_arr = np.random.randint(low=5, high=10, size=(5,5))
print(my_arr)
```

    [[7 8 7 5 5]
     [8 8 9 9 7]
     [8 5 9 9 5]
     [9 7 8 5 8]
     [9 9 5 7 6]]



```python
my_arr.shape
```




    (5, 5)




```python
my_arr.dtype
```




    dtype('int64')




```python
my_arr.size
```




    25




```python
my_arr.nbytes
```




    200




```python
my_arr.itemsize
```




    8



### 2.2.1 Exercise: Conditional Check on Array Attributes

write a conditional that checks that the total number of bytes of the array object `my_arr` divided by the size of each item (in bytes) is equal to the number of items in the array (_hint: we covered the attributes above_)


```python
# Cell for exercise 3.2.1
```




    True



## 2.3 NumPy Array Slicing, Copying, Setting

Array slicing operates much the same way as with python lists


```python
my_arr
```




    array([[7, 8, 7, 5, 5],
           [8, 8, 9, 9, 7],
           [8, 5, 9, 9, 5],
           [9, 7, 8, 5, 8],
           [9, 9, 5, 7, 6]])




```python
# grab the first row
my_arr[0]
```




    array([7, 8, 7, 5, 5])




```python
# grab the first element of the first row

# instead of this
print(my_arr[0][0])

# we do this
print(my_arr[0, 0])
```

    9
    9


We can time these...


```python
%%timeit
my_arr[0][0]
```

    The slowest run took 38.40 times longer than the fastest. This could mean that an intermediate result is being cached.
    1000000 loops, best of 5: 381 ns per loop



```python
%%timeit
my_arr[0, 0]
```

    The slowest run took 60.67 times longer than the fastest. This could mean that an intermediate result is being cached.
    10000000 loops, best of 5: 170 ns per loop


We can use the same slicing notation as with lists

`my_arr[start:stop:step]`

for n-dimensional arrays

`my_arr[1-start:1-stop:1-step, 2-start:2-stop:2-step, ... n-start:n-stop:n-step]`


```python
# with arrays, we simply separate each dimension with a comma
my_arr[:2, :2]
```




    array([[7, 8],
           [8, 8]])



Slices are views not copies. This means we can set slices of arrays to new values, and the original object will change:


```python
my_arr[:2, :2] = 0
my_arr
```




    array([[0, 0, 7, 5, 5],
           [0, 0, 9, 9, 7],
           [8, 5, 9, 9, 5],
           [9, 7, 8, 5, 8],
           [9, 9, 5, 7, 6]])




```python
my_arr[-2:, -2:] = 1
my_arr
```




    array([[0, 0, 7, 5, 5],
           [0, 0, 9, 9, 7],
           [8, 5, 9, 9, 5],
           [9, 7, 8, 1, 1],
           [9, 9, 5, 1, 1]])



Step through an array slice


```python
# remember that we can use steps in slicing
my_arr[:, ::2] # the last number after :: is the step size
```




    array([[0, 7, 5],
           [0, 9, 7],
           [8, 9, 5],
           [9, 8, 1],
           [9, 5, 1]])



We can use negative step sizes the way we do with lists. A negative step size reverses the order of start and stop, so it is a convenient way to reverse the order of one or more dimensions of an array


```python
# reverse the rows
my_arr[::-1]
```




    array([[9, 9, 5, 1, 1],
           [9, 7, 8, 1, 1],
           [8, 5, 9, 9, 5],
           [0, 0, 9, 9, 7],
           [0, 0, 7, 5, 5]])




```python
# reverse the columns
my_arr[:, ::-1]
```




    array([[5, 5, 7, 0, 0],
           [7, 9, 9, 0, 0],
           [5, 9, 9, 5, 8],
           [1, 1, 8, 7, 9],
           [1, 1, 5, 9, 9]])



Sometimes we want to create a copy of an array, despite the default slicing behavior. We can do this with the `.copy()` method


```python
new_arr = my_arr.copy()
new_arr[:,:] = 0
print(my_arr)
```

    [[0 0 7 5 5]
     [0 0 9 9 7]
     [8 5 9 9 5]
     [9 7 8 1 1]
     [9 9 5 1 1]]


### 2.3.1 Exercise: Array Setting and Slicing

set all the even columns of `my_arr` to 0 and all the odd columns to 1 (interpret the first column to be 1 and the last to be 5, i.e. don't index at 0 when thinking of each column as even/odd!)

Example Output:
```
array([[0, 1, 0, 1, 0],
       [0, 1, 0, 1, 0],
       [0, 1, 0, 1, 0],
       [0, 1, 0, 1, 0],
       [0, 1, 0, 1, 0]])
```


```python
# Cell for ex 3.3.1
```




    array([[0, 1, 0, 1, 0],
           [0, 1, 0, 1, 0],
           [0, 1, 0, 1, 0],
           [0, 1, 0, 1, 0],
           [0, 1, 0, 1, 0]])



## 2.4 NumPy Array Reshaping, Concatenation, and Splitting

reshaping is going to be a common task for us:


```python
arr = np.arange(9)
arr
```




    array([0, 1, 2, 3, 4, 5, 6, 7, 8])




```python
# reshape into a 3x3 array
arr.reshape(3,3) # rows then columns
```




    array([[0, 1, 2],
           [3, 4, 5],
           [6, 7, 8]])



The reshaped dimensions have to be evenly divisible into the total number of elements:

_`-1` will infer the proper dimension based on the other dimensions provided and the total number of elements_


```python
# arr.reshape(4,2) # throws and error
arr = np.arange(12)
arr.reshape(4,3) 
```




    array([[ 0,  1,  2],
           [ 3,  4,  5],
           [ 6,  7,  8],
           [ 9, 10, 11]])



A common manipulation in numpy is to convert a 1 dimensional array into a 2 dimensional array. You will see this frequently when working with test/train datasets in machine learning.


```python
arr = np.arange(9)
# reshape into 2 dimensions
arr.reshape(-1,1)
```




    array([[0],
           [1],
           [2],
           [3],
           [4],
           [5],
           [6],
           [7],
           [8]])




```python
# back to one dimension
arr.reshape(9)
```




    array([0, 1, 2, 3, 4, 5, 6, 7, 8])



We can also concatenate arrays


```python
arr1 = np.array([1, 2, 3])
arr2 = np.array([4, 5, 6])
print(arr1, arr2)
```

    [1 2 3] [4 5 6]



```python
# now a single array
np.concatenate((arr1, arr2))
```




    array([1, 2, 3, 4, 5, 6])



`vstack` or vertical stack will place the two arrays on top of eachother:


```python
np.vstack((arr1,arr2))
```




    array([[1, 2, 3],
           [4, 5, 6]])



`hstack` will place them side by side


```python
np.hstack((arr1,arr2))
```




    array([1, 2, 3, 4, 5, 6])




```python
arr1 = np.array([[1, 2, 3],[7,8,9]])
arr2 = np.array([4, 5, 6])
print(arr1)
print(arr2)

print(arr1.shape)
```

    [[1 2 3]
     [7 8 9]]
    [4 5 6]
    (2, 3)



```python
np.vstack((arr1, arr2))
```




    array([[1, 2, 3],
           [7, 8, 9],
           [4, 5, 6]])



Lastly, we can also split arrays. We give the indices where the split should be performed


```python
arr = np.random.randint(5, 11, (10,10))
arr
```




    array([[ 5,  6, 10,  6,  7, 10,  6, 10,  6,  7],
           [ 6,  6,  6,  5,  5,  5,  7, 10,  9,  6],
           [ 6,  7,  6,  5,  9,  8,  6,  5,  8,  9],
           [ 8,  5, 10, 10,  8,  7,  8,  6,  6, 10],
           [ 7,  5,  6, 10,  9, 10,  6,  6, 10,  5],
           [ 8,  6, 10, 10,  7,  8,  9,  5,  9,  8],
           [ 8,  8,  9,  8, 10,  9,  8, 10,  7,  8],
           [ 9,  6,  8,  6, 10,  7,  5,  7,  8,  6],
           [ 6,  9,  6,  9, 10,  5,  8,  9,  5,  6],
           [ 6,  5,  6, 10, 10,  5,  9,  9,  5,  9]])




```python
a, b = np.split(arr, [5])
print(a)
print(b)
```

    [[ 8  9  7  7 10  8  6  6  9 10]
     [ 5  9 10  8  8  8  8  8 10 10]
     [ 7  6  8  5 10  5  5  5  7 10]
     [ 5  8  9  5  7 10  7  5 10  9]
     [ 5  7  6  8  7 10  5  8  5 10]]
    [[ 5  6  8  8 10  6  7  5  9  5]
     [ 5  7  5  6  6  8 10  9  5  5]
     [ 7 10  6  9  8  6 10  8  7  7]
     [ 5 10  9  8  6 10 10  7  5  5]
     [ 8  7 10  9  7  8  8  7  8  7]]



```python
np.vsplit(arr, [2,4,6,8])
```




    [array([[ 5,  6, 10,  6,  7, 10,  6, 10,  6,  7],
            [ 6,  6,  6,  5,  5,  5,  7, 10,  9,  6]]),
     array([[ 6,  7,  6,  5,  9,  8,  6,  5,  8,  9],
            [ 8,  5, 10, 10,  8,  7,  8,  6,  6, 10]]),
     array([[ 7,  5,  6, 10,  9, 10,  6,  6, 10,  5],
            [ 8,  6, 10, 10,  7,  8,  9,  5,  9,  8]]),
     array([[ 8,  8,  9,  8, 10,  9,  8, 10,  7,  8],
            [ 9,  6,  8,  6, 10,  7,  5,  7,  8,  6]]),
     array([[ 6,  9,  6,  9, 10,  5,  8,  9,  5,  6],
            [ 6,  5,  6, 10, 10,  5,  9,  9,  5,  9]])]




```python
np.hsplit(arr, [5])
```




    [array([[ 5,  6, 10,  6,  7],
            [ 6,  6,  6,  5,  5],
            [ 6,  7,  6,  5,  9],
            [ 8,  5, 10, 10,  8],
            [ 7,  5,  6, 10,  9],
            [ 8,  6, 10, 10,  7],
            [ 8,  8,  9,  8, 10],
            [ 9,  6,  8,  6, 10],
            [ 6,  9,  6,  9, 10],
            [ 6,  5,  6, 10, 10]]), array([[10,  6, 10,  6,  7],
            [ 5,  7, 10,  9,  6],
            [ 8,  6,  5,  8,  9],
            [ 7,  8,  6,  6, 10],
            [10,  6,  6, 10,  5],
            [ 8,  9,  5,  9,  8],
            [ 9,  8, 10,  7,  8],
            [ 7,  5,  7,  8,  6],
            [ 5,  8,  9,  5,  6],
            [ 5,  9,  9,  5,  9]])]



### 2.4.1 Exercise: Reshaping and Concatenating

We'll practice a few of these methods we've learned.

1. make `arr2` match the shape of `arr1` using `reshape`
2. stack `arr1` on top of `arr2` using `vstack` and call this new array `arr`
3. replace all the even columns of `arr` with zeros
4. return the sum of `arr` using `arr.sum()`

starting code:

```
np.random.seed(42)
arr1 = np.random.randint(5, 11, (5,10))
arr2 = np.random.randint(5, 11, (10,5))
```

expected output:

```
374
```


```python
np.random.seed(42)
arr1 = np.random.randint(5, 11, (5,10))
arr2 = np.random.randint(5, 11, (10,5))
print(arr1,end='\n\n')
print(arr2)
```

    [[ 8  9  7  9  9  6  7  7  7  9]
     [ 8  7 10  9  6  8 10 10  6  8]
     [ 9  5  8  6 10  9  8  5  5  7]
     [ 7  6  8  8 10 10 10  7  8  8]
     [ 5  7  9  7  9  5  6  8  5  8]]
    
    [[10  6  6  5  6]
     [ 9  6  8  8  8]
     [ 8  9  7 10  5]
     [ 8  6  8  6 10]
     [10 10  6  8 10]
     [ 9  6  6  8  6]
     [ 6 10  8 10 10]
     [ 8  5 10  9  9]
     [ 6  9  6  5  8]
     [ 8  8  9  5  9]]



```python
# cell for Ex 3.4.1
```




    374



## 2.5 Additional Exercises

### 2.5.1 Exercise: boolean Array

Create a 3x3 array of all True's (booleans)


```python
# cell for 3.5.1
```

### 2.5.2 Exercise: Index on Conditional

extract all numbers divisible by 3

```
arr = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
```


```python
# cell for 3.5.2
arr = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
```

### 2.5.3 `np.where`

There is a nifty tool, `np.where()`. The syntax works like `np.where(<where this condition is true> , <return elements from this array>, <otherwise return elements from this aray>)`


```python
# Example
a = np.arange(10)
np.where(a<5, a, a*10)
```




    array([ 0,  1,  2,  3,  4, 50, 60, 70, 80, 90])




### 2.5.4 `np.argwhere`

A similar but slightly different tool is `np.argwhere` which will return the indices of the array where the conditional is true


```python
# Example
np.argwhere(a<5)
```




    array([[0],
           [1],
           [2],
           [3],
           [4]])



### 2.5.5 Exercise: Edit a Copy not a View

replace all odd numbers in `arr` with -1 without changing `arr` (return a new array using `np.where`)


```python
# cell for 3.5.5
arr = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
```

### 2.5.6 Exercise: Read NumPy Documentation

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
# cell for 3.5.6
a = np.array([1,2,3])
# desired output:
#> array([1, 1, 1, 2, 2, 2, 3, 3, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3])
```

### 2.5.7 Exercise: More Slicing

swap columns 2 and 3 in `arr`


```python
# cell for 3.5.7
arr = np.arange(9).reshape(3,3)
```

## 2.4 Debugging 

> It’s always important to check that our code is “plugged in”, i.e., that we’re actually exercising the problem that we think we are. Every programmer has spent hours chasing a bug, only to realize that they were actually calling their code on the wrong data set or with the wrong configuration parameters, or are using the wrong version of the software entirely. Mistakes like these are particularly likely to happen when we’re tired, frustrated, and up against a deadline, which is one of the reasons late-night (or overnight) coding sessions are almost never worthwhile. -[swcarpentry](https://swcarpentry.github.io/python-novice-inflammation/11-debugging/index.html)

We'll now dedicated some discussion and practice to debugging python. This easy to overlook topic can save us oodles of time down the road. It's worth the investment.

Borrowing from software carpentry, we'll highlight the key guidlines to debugging code:

1. Know what it's supposed to do
2. Make it fail every time
3. Make it fail fast
4. Change one thing at a time, for a reason
5. Keep track of what you've done
6. Be humble

### 2.4.0 Before We Get Started

We will refer to writing tests, and specifically writing _unit tests_ in this module. Don't worry too much about the specifics of _unit tests_ for now. We will have a dedicated module for that. What we do need to talk about is a specific built in function in python called the `assert` function

#### 2.4.0.1 the `assert` function

Let's take a simple example of the assert function. If I wanted to test that the sume of two numbers is correct


```python
assert sum([2, 5]) == 7, "should be 7"
```

Nothing is sent to the print out because the condition is satisfied. If we run, however:

```
assert sum([2, 4]) == 7, "should be 7"
```

we get an error message:

```
---------------------------------------------------------------------------
AssertionError                            Traceback (most recent call last)
<ipython-input-3-d5724b127818> in <module>()
----> 1 assert sum([2, 4]) == 7, "should be 7"

AssertionError: should be 7
```


Now to make this a test, you will want to wrap it in a function


```python
def test_sum():
    assert sum([1, 2, 3]) == 6, "Should be 6"

test_sum()
print("Everything passed")
```

    Everything passed


And if we include a test that does not pass:

```
def test_sum():
  assert sum([3, 3]) == 6, "Should be 6"

def test_my_broken_func():
  assert sum([1, 2]) == 5, "Should be 5"

test_sum()
test_my_broken_func()
print("Everything passed")
```



Here our test fails, because the sum of 1 and 2 is 3 and not 5. We get a traceback that tells us the source of the error:

```
---------------------------------------------------------------------------
AssertionError                            Traceback (most recent call last)
<ipython-input-13-8a552fbf52bd> in <module>()
      6 
      7 test_sum()
----> 8 test_my_broken_func()
      9 print("Everything passed")

<ipython-input-13-8a552fbf52bd> in test_my_broken_func()
      3 
      4 def test_my_broken_func():
----> 5   assert sum([1, 2]) == 5, "Should be 5"
      6 
      7 test_sum()

AssertionError: Should be 5
```



We will worry about the intricacies of what to test for and when to test at a later time. For now, we just need to understand the assert function so we can practice debugging and writing short tests for the problems that we fix today! Ok LETS GO

### 2.4.1 Know what it's supposed to do

This may seem obvious, but it's easy to recognize that an error is happening without knowing what the correct answer is. This makes unit tests especially handy, they force us to know the expected outcome at least for intended use cases. Here are some tips in regard to knowing the expected outcome:

* _test with simplified data_ 
* _test a simplified case_
* _compare to a base model_
* _visualize_

### 2.4.2 Make it fail every time

It can be extraordinarily difficult to debug code that is precidated on some stochastic process. _remove stochasticity when possible_. For instance, seed your random value generators (`random.seed()`, `np.random.seed()`)

### 2.4.3 Make it fail fast

a corrolary to this, is narrow down the source of the error, and again this is why we write unit tests before integration tests. If it takes 20 minutes to train your neural network, and the error occurs during some post processing plotting of your loss history, obviously don't retrain the NN each time you iterate over the failure. Along the same lines, if you're debugging something in a for loop, run the loop once, or run the indented code outside of the loop with a placeholder for the iterated variable, in order to test and debug the code. 

### 2.4.4 Change one thing at a time, for a reason

Not much nuance here. Just like it's a good idea for us to change one aspect of our machine learning models and track the performance rather than to change multiple things at once, it's better to change one feature when debugging at a time. Changing multiple things at once creates interaction effects that can complicate the whole problem!

### 2.4.5 Keep track of what you've done

This is where git/GitHub come in handy. It's so incredibly easy to forget what you've done, and, a weeks or days later from the time you first encountered the bug, forget whether you fixed it, did a temp fix, and/or what you did to fix it.

> my tip: if you're working in a jupyter notebook, something I do is write at the top of my notebook my TO DO items. I then strike through items I complete, and update my notes for the next time I work on the code. Similarly, I name my notebooks to reflect and categorize what they are about. Primarily I have `test_<thing>.ipynb` and `prototype_<thingy>.ipynb`



### 2.4.6 Be humble

Lastly, ask for help. Take breaks. _A week of hard work can sometimes save you an hour of thought._

### 2.4.7 Exercise: Debug A Short Code Block

Your friend is writing a function to calculate BMI. They are concerned that seemingly all the patient's values have the same BMI, despite having different heights and weights. Determine the bugs in the code then write a unit test for the function `calculate_bmi`.


```python
# [weight (kg), height (m)]
patients = [[70, 1.8], [80, 1.9], [150, 1.7]] 

def calculate_bmi(weight, height):
    # kg / m ** 2 = bmi
    return weight / (height ** 2)

for patient in patients:
    weight, height = patients[0] 
    bmi = calculate_bmi(height, weight) 
    print("Patient's BMI is: %f" % bmi)
```

    Patient's BMI is: 0.000367
    Patient's BMI is: 0.000367
    Patient's BMI is: 0.000367



```python
# [weight (kg), height (m)]
patients = [[70, 1.8], [80, 1.9], [150, 1.7]] 

def calculate_bmi(weight, height):
    # kg / m ** 2 = bmi
    return weight / (height ** 2)

for patient in patients:
    weight, height = patient ### not properly referencing iterated variable
    bmi = calculate_bmi(weight, height) ### should be swapped
    print("Patient's BMI is: %f" % bmi)
```

    Patient's BMI is: 21.604938
    Patient's BMI is: 22.160665
    Patient's BMI is: 51.903114



```python
def test_calculate_bmi():
  patients = [[70, 1.8], [80, 1.9], [150, 1.7]] 
  bmis = [21.6, 22.16, 51.9]

  for patient, bmi_ in zip(patients, bmis):
    weight, height = patient ### not properly referencing iterated variable
    bmi = calculate_bmi(weight, height) ### should be swapped
    assert np.abs(bmi - bmi_) < 0.1, "fail calc for {}".format(patient)
    
test_calculate_bmi()
print("success!")
```

    success!


### 2.4.8 Exercise: Debug a Class Method

Your friend is developing a new pokemon game. They are excited to release but are running into some trouble! 


```python
class Pokeball:
  def __init__(self, contains=None, type_name="poke ball"):
    self.contains = contains
    self.type_name = type_name
    self.catch_rate = 0.50 # note this attribute is not accessible upon init

  # the method catch, will update self.contains, if a catch is successful
  # it will also use self.catch_rate to set the performance of the catch
  def catch(self, pokemon):
    if self.contains == None:
      if random.random() < self.catch_rate:
        self.contains = pokemon
        print(f"{pokemon} captured!")
      else:
        print(f"{pokemon} escaped!")
        pass
    else:
      print("pokeball is not empty!")
      
  def release(self):
    if self.contains == None:
      print("Pokeball is already empty")
    else:
      print(self.contains, "has been released")
      self.contains = None


class Pokemon():
  def __init__(self, name, weight, speed, type_):
    self.name = name
    self.weight = weight
    self.speed = speed
    self.type_ = type_

class FastBall(Pokeball):
  def __init__(self, contains=None, type_name="Fastball"):
    Pokeball.__init__(self, contains, type_name)
    self.catch_rate = 0.6

  def catch_fast(self, pokemon):
    if pokemon.speed > 100:
      if self.contains == None:
        self.contains = pokemon
        print(pokemon.name, "has been captured")
      else:
        print("Pokeball is not empty")
    else:
      self.catch(pokemon)

```

They're concerned that the object `FastBall` doesn't return the pokemon's name when executing `print(fast.contains)` when they know the pokeball contains a pokemon. Help them find the bug, then write the following unit tests:

1. showing that the pokeball updates properly with the name of the pokemon after it makes a capture of a pokemon with a speed > 100
2. showing that the `catch_rate` of 0.6 is resulting in a 60% catch rate for pokemon with speeds < 100


```python
# Your friend shows you this code 
fast = FastBall()

mewtwo = Pokemon(name='Mewtwo', 
                 weight=18,
                 speed=110, 
                 type_='Psychic')

print(fast.contains)

fast.catch_fast(mewtwo)

# this is the line they are concerned about
# why does this not return MewTwo?
print(fast.contains)

fast.catch_fast(mewtwo)
```

    None
    Mewtwo has been captured
    <__main__.Pokemon object at 0x7fd4bfe612d0>
    Pokeball is not empty


# Part 2 (Optional): Use a Test Runner

Create the following files:

* `pokemon.py`
* `test_pokemon.py`

paste the following into `pokemon.py`:

```
import random
import numpy as np

class Pokeball:
  def __init__(self, contains=None, type_name="poke ball"):
    self.contains = contains
    self.type_name = type_name
    self.catch_rate = 0.50 # note this attribute is not accessible upon init

  # the method catch, will update self.contains, if a catch is successful
  # it will also use self.catch_rate to set the performance of the catch
  def catch(self, pokemon):
    if self.contains == None:
      if random.random() < self.catch_rate:
        self.contains = pokemon
        print(f"{pokemon} captured!")
      else:
        print(f"{pokemon} escaped!")
        pass
    else:
      print("pokeball is not empty!")
      
  def release(self):
    if self.contains == None:
      print("Pokeball is already empty")
    else:
      print(self.contains, "has been released")
      self.contains = None


class Pokemon():
  def __init__(self, name, weight, speed, type_):
    self.name = name
    self.weight = weight
    self.speed = speed
    self.type_ = type_

class FastBall(Pokeball):
  def __init__(self, contains=None, type_name="Fastball"):
    Pokeball.__init__(self, contains, type_name)
    self.catch_rate = 0.6

  def catch_fast(self, pokemon):
    if pokemon.speed > 100:
      if self.contains == None:
        self.contains = pokemon
        print(pokemon.name, "has been captured")
      else:
        print("Pokeball is not empty")
    else:
      self.catch(pokemon)

```

in `test_pokemon.py` paste any unit tests you've written along with the imports at the top of the file (be sure to import any other libraries you used in your unit tests as well)

```
from pokemon import *
import random
import numpy as np

### YOUR UNIT TESTS HERE ###
def test_<name_of_your_test>():
  # ....
  assert <your assert statement>
```

make sure `pokemon.py` and `test_pokemon.py` are in the same directory then run the command

```
pytest
```

from the command line. You should get a readout like the following

```
================================================= test session starts ==================================================
platform linux -- Python 3.8.1, pytest-6.2.1, py-1.10.0, pluggy-0.13.1
rootdir: /mnt/c/Users/wesley/Documents/apps/temp_c3_l2
plugins: dash-1.20.0, anyio-2.2.0
collected 1 item

test_pokemon.py .                                                                                                [100%]

================================================== 1 passed in 0.06s ===================================================
```
