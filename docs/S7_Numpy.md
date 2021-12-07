<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/S7_Numpy.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Session 7: NumPy

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com
<br>

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

## 7.1 NumPy Arrays

### 7.1.1 Creating NumPy Arrays

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



#### 🏋️ Exercise 1: Specify datatype

Create an array of 5 numbers whose datatypes are 16 bit integers. Make one of the numbers not a whole number. What happens to the number when it is stored in the 16 bit integer array?


```python
# Cell for Exercise 1
```

### 7.1.2 Creating Arrays from NumPy Methods


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



### 🏋️ Exercise 2: Creating Arrays

a. Create a 5x5 array of ones with datatype `int16`


```python
# Cell for Exercise 2a
```

b. Create an array of 10 numbers drawn from a uniform distribution between 0 and 1


```python
# Cell for Exercise 2b
```

c. Create an array of 10 numbers drawn from a normal distribution centered at 80 with a standard deviation of 5


```python
# Cell for Exercise 2c
```

d. Create an array of 10 intergers drawn from a uniform distribution between 5 and 10 inclusive


```python
# Cell for Exercise 2d
```

## 7.2 NumPy Array Attributes

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



### 🏋️ Exercise 3: Conditional Check on Array Attributes

write a conditional that checks that the total number of bytes of the array object `my_arr` divided by the size of each item (in bytes) is equal to the number of items in the array (_hint: we covered the attributes above_)


```python
# Cell for exercise 3
```




    True



## 7.3 NumPy Array Slicing, Copying, Setting

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


### 🏋️ Exercise 4: Array Setting and Slicing

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
# Cell for Exercise 4
```




    array([[0, 1, 0, 1, 0],
           [0, 1, 0, 1, 0],
           [0, 1, 0, 1, 0],
           [0, 1, 0, 1, 0],
           [0, 1, 0, 1, 0]])



## 7.4 NumPy Array Reshaping, Concatenation, and Splitting

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



### 🏋️ Exercise 5: Reshaping and Concatenating

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
# Cell for Exercise 5
```




    374



## 7.5 Additional Exercises

### 🏋️ Exercise 6: boolean Array

Create a 3x3 array of all True's (booleans)


```python
# Cell for Exercise 6
```

### 🏋️ Exercise 7: Index on Conditional

extract all numbers divisible by 3

```
arr = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
```


```python
# Cell for Exercise 7
arr = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
```

### 7.5.3 `np.where`

There is a nifty tool, `np.where()`. The syntax works like `np.where(<where this condition is true> , <return elements from this array>, <otherwise return elements from this aray>)`


```python
# Example
a = np.arange(10)
np.where(a<5, a, a*10)
```




    array([ 0,  1,  2,  3,  4, 50, 60, 70, 80, 90])




### 7.5.4 `np.argwhere`

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



### 🏋️ Exercise 8: Edit a Copy not a View

replace all odd numbers in `arr` with -1 without changing `arr` (return a new array using `np.where`)


```python
# Cell for Exercise 8
arr = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
```

### 🏋️ Exercise 9: Read NumPy Documentation

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
# Cell for Exercise 9
a = np.array([1,2,3])
# desired output:
#> array([1, 1, 1, 2, 2, 2, 3, 3, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3])
```

### 🏋️ Exercise 10: More Slicing

swap columns 2 and 3 in `arr`


```python
# Cell for Exercise 10
arr = np.arange(9).reshape(3,3)
```

### 🏋️ Exercise 11: Debug a Class Method

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
