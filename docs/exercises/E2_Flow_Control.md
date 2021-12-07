<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/exercises/E2_Flow_Control.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Lab 2: Practice with Flow Control

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com
<br>

---

<br>

In this lab we will continue to practice flow control.

<br>

---




# ➿ L2 Q1: Print and For Loops

Create a Pyramid Using for loops



## Part A

Example output:

```
* 
* * 
* * * 
* * * * 
* * * * * 
```




```python
# Code Cell for L2 Q1 A
```

## Part B

Example output:

```
        * 
      * * 
    * * * 
  * * * * 
* * * * * 
```


```python
# Code Cell for L2 Q1 B
```

## Part C

Example output:

```
         * 
        * * 
       * * * 
      * * * * 
     * * * * * 
```


```python
# Code Cell for L2 Q1 C
```

              
             * 
            * * 
           * * * 
          * * * * 
         * * * * * 
        * * * * * * 
       * * * * * * * 
      * * * * * * * * 
     * * * * * * * * * 


# 🔙 L2 Q2: Conditionals and For Loops

Complete the Fibonacci sequence up to the 10th place using any or all of the following:
* `for` 
* `if` `elif` `else`
* `append`
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
# Cell for L2 Q2
```

# 🧺 L2 Q3: Practice with Collections

concatenate the following dictionaries to create a new one, if you need to refer to documentation for python dictionaries!

Input:
```
dict1={1:10, 2:20}
dict2={3:30, 4:40}
dict3={5:50, 6:60}
```

Output:
```
new_dect={1:10, 2:20, 3:30, 4:40, 5:50, 6:60}
```


```python
# Cell for L2 Q3
```

# 🐝 L2 Q4 The FizzBuzz task

Let's do this!  **FizzBuzz** is our first task for this session.  **FizzBuzz** is a common toy programming problem that is often used in software engineering job interviews.  Today, we are not after the _most compact_, _most clever_, or even the _most beautiful_ solution.  Your goal is to solve the problem using **_for_** and **_if_** as your primary tools.  You will likely also want to use the `%` operator.  Before we describe **FizzBuzz**, let's talk about the **moduluo** operation.

If you recall from session 1, you may have experimented with the **_[modulus](https://en.wikipedia.org/wiki/Modulo_operation)_** or `%` operator.  When used between two **_integer_** values, it returns the integer remainder of division. Let's start with a simple example of `5` **modulo** `3`:

```
5 % 3
```


```python
5 % 3
```




    2



Let's do another example... What is the result of the following:

```
10 % 5
```


```python
10 % 5
```




    0



Now, on to **FizzBuzz**.  No it isn't the high-test caffeine cola you might need right now.  Instead, it is a challenge to output certain text as the code iterates over elements in a list.  Here is the formal definition of the problem that we will use today.

_"Write a program that prints the numbers from 1 to 100. But for multiples of three print `Fizz` instead of the number and for the multiples of five print `Buzz`. For numbers which are multiples of both three and five print `FizzBuzz`."_

To get started, you will need a `for` loop and it will probably use a `range` list.  Inside of the for loop, you will likely have at least two `if` statements that use the `%` operator followed by a `print`.



```python
# Cell for L2 Q4
```


For advanced folks, a hint here is that you might be able to avoid some `if` statements by using the `end` parameter to the `print` function.  Notice how these two cell blocks output differently.

```
print("Fizz")
print("Buzz")
```

In another cell:

```
print("Fizz", end="")
print("Buzz", end="")
print()
```
