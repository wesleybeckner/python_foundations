<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/S3_Functions_and_Debugging.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Session 3: Functions and Debugging

**Instructor**: Wesley Beckner<br>

**Contact**: wesleybeckner@gmail.com

**Recording**: [Video (32 min)](https://www.youtube.com/watch?v=yZEzP7L4KXQ&list=PLVaoNV0aHKna2L3wY1DVuB9rVvhSG3ity&index=3)

<i>special thanks to [David Beck](https://www.cheme.washington.edu/facultyfinder/david-beck) for their contribution to this material</i>
<br>

---

<br>

Today, we will discuss **_functions_** in more depth.  We've seen them previously and used them, for example the `.append()` **_function_** for lists, or the even more general `print()` function.  Here, we'll dig into how you can make your own functions to encapsulate code that you will reuse over and over. 

<br>

---

## 3.0 Review from Session on Data Structures and Flow Control

In our last session, we discussed **_lists_**, **_dictionaries_**, and **_flow control_**.

**_Lists_** are **_ordered collections_** of data that can be used to hold multiple pieces of information while preserving their order.  We use `[` and `]` to access elements by their indices which start with `0`.  All things that operate on **_lists_** like slices use the concept of an inclusive lower bound and an exclusive upper bound.  So, the following gets elements from the **_list_** `my_list` with index values of `0`, `1`, and `2`, but **not** `3`!

```
my_list[0:3]
```



#### 🙋 Question 1: Slicing

> What other way is there of writing the same statement using **_slicing_**?  Hint, think about leaving out one of the numbers in the slice!

**_Dictionaries_** are **_named_** **_collections_** of data that can be used to hold multiple pieces of information as **_values_** that are addressed by **_keys_** resulting in a **_key_** to **_value_** data structure.  They are accessed with `[` and `]` but intialized with `{` and `}`.  E.g.

```
my_dict = { 'cake' : 'Tasty!', 'toenails' : 'Gross!' }
my_dict['cake']
```

Finally, we talked about **_flow control_** and using the concept of **_conditional execution_** to decide which code statements were executed.  Remember this figure?

<img src="https://docs.oracle.com/cd/B19306_01/appdev.102/b14261/lnpls008.gif">Flow control figure</img>

> What are the **_if_** statments? <br> 
Where do **_for_** loops fit in? <br>

## 3.1 Functions

For loops let you repeat some code for every item in a list.  Functions are similar in that they run the same lines of code and, frequently, for new values of some variable (we call these **_parameters_**).  They are different in that functions are not limited to looping over items.

Functions are a critical part of writing easy to read, reusable code.

Create a function like:
```
def function_name (parameters):
    """
    optional docstring
    """
    function expressions
    return [variable]
```

Here is a simple example.  It prints a string that was passed in and returns nothing.

```
def print_string(string):
    """This prints out a string passed as the parameter."""
    print(string)
    return
```


```python
def print_string(string):
  """This prints out a string passed as the parameter"""
  print(string)
  return
```

To call the function, use:
```
print_string("GIX is awesome!")
```

_Note:_ The function has to be defined before you can call it!


```python
print_string("GIX is awesome!")
```

    GIX is awesome!


### 3.1.1 Reserved words: def, return, and yield

Notice the highlighted words in our function definition: `def` and `return` these are *reserved words* in python used to define functions. Every function definition requires these reserved words. `yield` is another reserved word that is similar to `return` but operates slightly differently. It is beyond the scope of what we are covering in this session. This tutorial from [realpython](https://realpython.com/introduction-to-python-generators/) has good information on the topic.


```python
# what is return doing in this function?
def my_square(a):
  return a ** 2
```

`return` is going to output whatever value(s) follow after the keyword `return` when we call upon our function 


```python
a = 2
my_square(a)
```




    4



I'm going to return two values...


```python
def my_square(a):
  return a ** 2, a
```

and we see how the output updates accordingly


```python
my_square(a)
```




    (4, 2)



We can capture these values on the output with...


```python
square, new_a = my_square(a)
```


```python
print(square, new_a)
```

    4 2


### 3.1.2 Global vs local variables and function parameters

In a function, new variables that you create are not saved when the function returns - these are **_local_** variables.  Variables defined outside of the function can be accessed but not changed - these are **_global_** variables.

let's define the following function


```python
def my_little_func(a):
  b = 10
  return a * b
```


```python
my_little_func(2)
```




    20



if I run the following...


```python
# b
```

Let's play with this a little further...

...now let's define b outside the function and call our function with `a=5`


```python
# what happens here?
b = 100
my_little_func(5)
```




    50



we see that b is still 100, instead of 10 as its defined within the function. This is because b inside of `my_little_func` is a *local* variable. 

it doesn't matter how I define b outside the function because within the function it is set locally.

... Let's do this A LITTLE MORE


```python
def my_new_func(a):
  print(b)
  return a*b
```

now if I call on my new function, because `b` is not defined locally within the function, it takes on the global value. 

This is typically not happy-happy fun-fun behavior for us: we want to be explicit about how we define and use our variables (but there are some times when this is appropriate to do)


```python
b= 1e4 # side note, what did I do here????
my_new_func(a)
```

    10000.0





    20000.0



#### 3.1.1.1 Function Parameters

Parameters (or arguments) in Python are all passed by reference.  This means that if you modify the parameters in the function, they are modified outside of the function (enrichment topic: there are exceptions, see below).

See the following example:

```
def change_list(my_list):
   """This changes a passed list into this function"""
   my_list.append('four');
   print('list inside the function: ', my_list)
   return

my_list = [1, 2, 3];
print('list before the function: ', my_list)
change_list(my_list);
print('list after the function: ', my_list)
```


```python
def change_list(my_list):
   """This changes a passed list into this function"""
   my_list.append('four');
   print('list inside the function: ', my_list)
   return

my_list = [1, 2, 3];
print('list before the function: ', my_list)
change_list(my_list);
print('list after the function: ', my_list)
```

    list before the function:  [1, 2, 3]
    list inside the function:  [1, 2, 3, 'four']
    list after the function:  [1, 2, 3, 'four']


#### 🍒 3.1.1.2 Enrichment: Global, local, and immutables

Let's go back to our former example...

Keep in mind the following immutables:

* integers, float, str, tuples

and now one-by-one uncomment lines 2-5; what is happening here!?


```python
b = "a string"
# b = 10
# b = 10.2
# b = (10, 2)
# b = [10, 2]

def my_little_func(b):
  if type(b) == str:
    b += "20"
  elif (type(b) == int) or (type(b) == float):
    b += 10
  elif (type(b) == tuple):
    print("AYYY no tuple changes, Dude")
    pass
  elif (type(b) == list):
    b.append('whoaaaa')
  print(b)
  return

print(b)
my_little_func(b)
print(b)
```

    a string
    a string20
    a string


There is a way to change a global variable within a function with the **_global_** keyword.  Generally, the use of **_global_** variables is not encouraged, instead use parameters. We won't cover the global keyword here but you can [explore further](https://www.programiz.com/python-programming/global-keyword) on your own if you are interested. 

#### 🏋️ Exercise 1: My first function

Write a function that takes one parameter and returns any data structure

> If you are going to return multiple objects, what data structure that we talked about can be used?  Give an example below.


```python
# Cell for excerise 1
```

### 3.1.3 Parameter types

We will now discuss the different parameter types.

**Function calling:**

In function _calling_ we have positional and keyword parameters

* positional 
    * `func(10, 20)`
* keyword
    * `func(a=10, b=20)` or `func(b=20, a=10)`

**Function writing:**

In funciton _writing_ we can specify default values for parameters

* default
    * `def func(a=10, b=20)`



```
def print_name(first, last='Beckner'):
    print(f'Your name is {first} {last}')
    return
```


```python
def print_name(first, last='Beckner'):
    print("Your name is {} {}".format(first, last))
    return
```


```python
print_name(last='Beckner', first='Wesley')
```

    Your name is Wesley Beckner


Play around with the above function.


```python
print_name('Wesley', last='the Python Foundations Instructor')
```

    Your name is Wesley the Python Foundations Instructor


Functions can contain any code that you put anywhere else including:
* `if`...`elif`...`else`
* `for`...`while`
* other function calls

```
def print_name_age(first, last, age):
    print_name(first, last)
    print('Your age is %d' % (age))
    if age > 25 and age < 40:
        print('You are a millenial!')
    return
```



```python
def print_name_age(first, last, age):
    print_name(first, last)
    print('Your age is %d' % (age))
    if age > 25 and age < 40:
        print('You are a millenial!')
    return
```

```
print_name_age(age=29, last='Beckner', first='Wesley')
```


```python
print_name_age(age=29, last='Beckner', first='Wesley')
```

    Your name is Wesley Beckner
    Your age is 29
    You are a millenial!


## 3.2 The scientific python stack

In addition to Python's built-in modules like the ``math`` module we explored previously, there are also many often-used third-party modules that are core tools for doing data science with Python.
Some of the most important ones are:

#### [``numpy``](http://numpy.org/): Numerical Python

Numpy is short for "Numerical Python", and contains tools for efficient manipulation of arrays of data.
If you have used other computational tools like IDL or MatLab, Numpy should feel very familiar.

#### [``scipy``](http://scipy.org/): Scientific Python

Scipy is short for "Scientific Python", and contains a wide range of functionality for accomplishing common scientific tasks, such as optimization/minimization, numerical integration, interpolation, and much more.
We will not look closely at Scipy today, but we will use its functionality later in the course.

#### [``pandas``](http://pandas.pydata.org/): Labeled Data Manipulation in Python

Pandas is short for "Panel Data", and contains tools for doing more advanced manipulation of labeled data in Python, in particular with a columnar data structure called a *Data Frame*.
If you've used the [R](http://rstats.org) statistical language (and in particular the so-called "Hadley Stack"), much of the functionality in Pandas should feel very familiar.

#### [``matplotlib``](http://matplotlib.org): Visualization in Python

Matplotlib started out as a Matlab plotting clone in Python, and has grown from there in the 15 years since its creation. It is the most popular data visualization tool currently in the Python data world (though other recent packages are starting to encroach on its monopoly).

#### [``scikit-learn``](https://scikit-learn.org/stable/): Machine Learning in Python

Scikit-learn is a machine learning library.

It features various classification, regression, and clustering algorithms, including support vector machines, random forests, gradient boosting, k-means, and DBSCAN.

The library is designed to interoperate with the Python numerical and scientific libraries NumPy and SciPy.

## 3.3 Debugging 

On to Debugging!

> It’s always important to check that our code is “plugged in”, i.e., that we’re actually exercising the problem that we think we are. Every programmer has spent hours chasing a bug, only to realize that they were actually calling their code on the wrong dataset or with the wrong configuration parameters, or are using the wrong version of the software entirely. Mistakes like these are particularly likely to happen when we’re tired, frustrated, and up against a deadline, which is one of the reasons late-night (or overnight) coding sessions are almost never worthwhile. -[swcarpentry](https://swcarpentry.github.io/python-novice-inflammation/11-debugging/index.html)

We'll now dedicate some discussion and practice to debugging in python. This easy to overlook topic can save us oodles of time down the road. It's worth the investment.

Borrowing from software carpentry, we'll highlight the key guidlines to debugging code:

1. Know what it's supposed to do
2. Make it fail every time
3. Make it fail fast
4. Change one thing at a time, for a reason
5. Keep track of what you've done
6. Be humble

### 3.3.0 Before We Get Started

We will refer to writing tests, and specifically writing _unit tests_ in this module. Don't worry too much about the specifics of _unit tests_ for now. We will have a dedicated module for that. What we do need to talk about is a specific built in function in python called the `assert` function

#### 3.3.0.1 the `assert` function

Let's take a simple example of the assert function. If I wanted to test that the sum of two numbers is correct I would write:


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



We will worry about the intricacies of what to test and when to test it at a later time. For now, we just need to understand the assert function so we can practice debugging and writing short tests for the problems that we fix today! Ok LETS GO

### 3.3.1 Know what it's supposed to do

This may seem obvious, but it's easy to recognize that an error is happening without knowing what the correct answer is. This makes unit tests especially handy, they force us to know the expected outcome at least for intended use cases. Here are some tips in regard to knowing the expected outcome:

* _test with simplified data_ 
* _test a simplified case_
* _compare to a base model_
* _visualize_

### 3.3.2 Make it fail every time

It can be extraordinarily difficult to debug code that is precidated on some stochastic process. _remove stochasticity when possible_. For instance, seed your random value generators (`random.seed()`, `np.random.seed()`)

### 3.3.3 Make it fail fast

a corrolary to this, is narrow down the source of the error, and again this is why we write unit tests before integration tests. If it takes 20 minutes to train your neural network, and the error occurs during some post processing plotting of your loss history, obviously don't retrain the NN each time you iterate over the failure. Along the same lines, if you're debugging something in a for loop, run the loop once, or run the indented code outside of the loop with a placeholder for the iterated variable, in order to test and debug the code. 

### 3.3.4 Change one thing at a time, for a reason

Not much nuance here. Just like it's a good idea for us to change one aspect of our machine learning models and track the performance rather than to change multiple things at once, it's better to change one feature when debugging at a time. Changing multiple things at once creates interaction effects that can complicate the whole problem!

### 3.3.5 Keep track of what you've done

This is where git/GitHub come in handy. It's so incredibly easy to forget what you've done, and, a weeks or days later from the time you first encountered the bug, forget whether you fixed it, did a temp fix, and/or what you did to fix it.

> my tip: if you're working in a jupyter notebook, something I do is write at the top of my notebook my TO DO items. I then strike through items I complete, and update my notes for the next time I work on the code. Similarly, I name my notebooks to reflect and categorize what they are about. Primarily I have `test_<thing>.ipynb` and `prototype_<thingy>.ipynb`



### 3.3.6 Be humble

Lastly, ask for help. Take breaks. _A week of hard work can sometimes save you an hour of thought._

#### 🏋️ Exercise 2: Debug A Short Code Block

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
def test_calculate_bmi():
  patients = [[70, 1.8], [80, 1.9], [150, 1.7]] 
  bmis = [21.6, 22.16, 51.9]

  pass
    
test_calculate_bmi()
print("success!")
```

    success!

