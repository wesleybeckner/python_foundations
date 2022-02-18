<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/labs/L3_Functions.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Lab 3: Practice with Functions

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com
<br>

---

<br>

In this lab we will continue to practice writing functions

<br>

---




## ✍🏽 L3 Q1: Basic Function Writing



### Part A

Write a Python function to find the maximum of three numbers




```python
# Cell for L3 Q1 A
```

### Part B

Write a Python function to multiply all the numbers in a list

Example:

```
Sample List : (8, 2, 3, -1, 7)
Expected Output : -336
```


```python
# Cell for L3 Q1 B
```

### Part C

Write a Python program to reverse a string

Example:

```
Sample String : "1234abcd"
Expected Output : "dcba4321"
```


```python
# Cell for L3 Q1 C
```

## ❄️ L3 Q2: Finding Unique Elements

Write a Python function that takes a list and returns a new list with unique elements of the first list

Example:
```
Sample List : [1,2,3,3,3,3,4,5]
Unique List : [1, 2, 3, 4, 5]
```


```python
# Cell for L3 Q2
```

## ❗ L3 Q3: Computing Factorials

Write a Python function to calculate the factorial of a number (any non-negative integer). The function accepts the number as an argument

Example: 

```
Input: 4                                                       
Output: 24
```


```python
# Cell for L3 Q3
```

## Practicing our hand at functions by implementing recursion

We will practice the last exercise we did yesterday, this time using what we've learned about functions to write a _recursive function_

A recursive function is a function that makes a call to itself. This is particularly well suited for tasks that would otherwise require a lot of memory to hold intermediary solutions (when they are combined with a strategy called _memoization_ which we will shy away from here). The Fibonnaci sequence is a good place for such a problem. So is a factorial calculation. See here below

$$3! = 3 * 2 * 1$$

$$4! = 4 * 3 * 2 * 1$$


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

## 🛺 L3 Q4: Recursive Functions

Using recursion, complete the Fibonacci sequence up to the 10th place using recursion and any or all of the following:

* `if` `elif` `else`
* `range`

The Fibonacci sequence with indices:

```
0. 0
1. 1
2. 1
3. 2
4. 3
5. 5
6. 8
7. etc..
```

Example input:

`index = 9`

Example output:
```
Index: 9
Value: 34
```


```python
# Cell for L3 Q4
```
