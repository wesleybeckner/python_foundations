<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/solutions/SOLN_S2_Data_Structures_and_Flow.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Session 2: Lists, Dictionaries, and Flow Control

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com

<i>special thanks to [David Beck](https://www.cheme.washington.edu/facultyfinder/david-beck) for their contribution to this material</i>
<br>

---

<br>


In this session, we will review basic variables and introduce lists and dictionaries as new variable types, or data structures.  We will close with seeing conditional execution and functions.  Hang on for the ride!

Normally, a notebook begins with `import` statements that _import_ packages or libraries that do a lot of heavy lifting for us.  We'll get to that later.

<br>

---

## 2.0 A quick review from last session

Recall, we discussed **_variables_** and **_comments_**.

### 2.0.1 A quick review of variables

Variables are human names we give data objects in our code.  Variables in Python should be named using appropriate descriptions of their purpose.  By convention, most variable names are `lower case` and may optionally contain the underscore character ('`_`'). So far, you've only seen examples of functions and variables in Python, but eventually you will encounter all the types of python objects in this table!

| Type  | Naming Convention | Examples |
|:---:|:---|:---|
| **Function** | Use a lowercase word or words. Separate words by underscores to improve readability. | `function, my_function`|
| **Variable** |  Use a lowercase single letter, word, or words. Separate words with underscores to improve readability. | `x, var, my_variable` |
| Class | Start each word with a capital letter. Do not separate words with underscores. This style is called camel case. | `Model, MyClass` |
| Method | Use a lowercase word or words. Separate words with underscores to improve readability. | `class_method, method` |
| Constant | Use an uppercase single letter, word or words. Separate words with underscores to improve readability. | `CONSTANT, MY_CONSTANT, MY_LONG_CONSTANT` |
| Module | Use a short, lowercase word or words. Separate words with underscores to improve readability. | `module.py, my_module.py` |
| Package (a collection of Modules) | Use a short, lowercase word or words. Do not separate words with underscores. | `package, mypackage` |

Some names you might want to use are off-limits because they are **_reserved words_**, meaning they are words in Python that have special meaning. 

Examples of _reserved words_ that you should not use as variable names are in the table below.  The ones in __bold__ are ones we will use in the session today.  Remember, these can't be used as variable names!

|  |  |  |  |  |  |  |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| __import__ | __True__ | __False__ | __if__ | __else__ | __def__ | __in__ |
| __not__ | __and__ | __or__ | __None__ | from | continue | pass |
| class | await | raise | del | lambda | return | elif |
| with | as | finally | nonlocal | while | assert | except | 
| global | yield | break | try | global | 


Let's see an example of a decimal point containing number, known to computers as a **_floating point_** number. Let's use \\(\pi\\) as the number.  (Pro tip: you can write equations in Markdown.  See this [reference](https://medium.com/analytics-vidhya/writing-math-equations-in-jupyter-notebook-a-naive-introduction-a5ce87b9a214).)

```
pickles = 3.14
print(pickles)
```


```python
pickles = 3.14
print(pickles)
```

    3.14


Cool.  We defined a variable named pickles containing a poor estimate of \\(\pi\\).  Now every place the word `pickles` appears, it will have the value `3.14`, at least until we change it.  

#### 🏋️ Exercise 1: Picking variable names

Is `pickles` a good variable name for the value \\(\pi\\)?  If not, what would be a better name?  Is it in the **_reserved word_** list above?  Use the `code` cell below to create a new variable with your preferred name in it.


```python
# Cell for Exercise 1
pie = 3.14 
```

Variables in Python have different data types.  The simple ones, we've already discussed such as an integer or `int`, a string or `str`, a decimal point containing number called a **_floating point_** number.  **_Floating point_** numbers are special and are stored in a computer's memory using [internal representations](http://steve.hollasch.net/cgindex/coding/ieeefloat.html).  One important thing to know about **_floating point_** numbers is that to a computer, the statement below may not always be true.  For now, just think about **_floating point_** numbers as approximately representing the decimal number you see.

```
10.0 * 0.1 = 1.0
```

Variables can change their value in Python so we can change the value of `pickles` to something else.  For example, a definition of what pickles are.

```
pickles = "A cucumber preserved in vinegar or brine."
print(pickles)
```


```python
pickles = "A cucumber preserved in vinegar or brine."
print(pickles)
```

    A cucumber preserved in vinegar or brine.


### 2.0.2 A quick review of comments

Just like we should use good naming conventions for variables so they make sense, we should have good comments to help readers follow our code.  Good comments can turn a speck of coding gold into a valuable nugget of knowledge.  Bad or wrong comments are bugs.  If you want to learn more about why we call computer coding problems bugs, read about [Grace Hopper](https://en.wikipedia.org/wiki/Grace_Hopper) and see [her photo of a `bug` in her notebook](https://en.wikipedia.org/wiki/Grace_Hopper#/media/File:First_Computer_Bug,_1945.jpg).

To comment out some text, use the `#` or hashtag or sometimes called the pound character. 

```
print(pickles)
```


```python
print(pickles)
```

    A cucumber preserved in vinegar or brine.


```
# This is an example comment.  Notice it is in english and full sentences.  That is good style.
```


```python
# This is an example comment.  Notice it is in english and full sentences.  That is good style.
```

---

## 2.1 Data Structures: Variables that organize data

Many variables you will encounter are more than the above simple **_data types_** (integers, strings, floating point numbers).  In fact, they may contain a few to many pieces of data rolled into one thing or **_data structure_**.  Next, we'll discuss two important _data structures_: **lists** and **dictionaries**.  There are many advanced **_data structures_** in Python that behave like **lists** and **dictionaries**, in different settings but their concepts are often similar.  Thus, understanding them here will help us understand more advanced concepts.  Let's start with the venerable **list**.



---

### 2.1.1 Lists

_For more than just shopping._
A list is an **_ordered_ _collection_** of data.  By **_collection_**, we mean that it contains multiple data. By **_ordered_**, we mean that the data are arranged so that they appear first to last like words in a sentence.  The order is important for the meaning of the sentence.

Let's begin by creating a list variable named `my_list` that contains three pieces of information.

```
my_list = ['I', 'like', 'pie']
my_list
```


```python
my_list = ['I', 'like', 'pie']
my_list
```




    ['I', 'like', 'pie']



Now the value of the variable `my_list` points to a list of three strings.  The use of `[`, `]`, and `,` are used to denote the begining, end and separator of the list.  Like a sentence, this list of words is ordered.  I like pie.

**Notice, we didn't use a `print()` on the variable.  The last variable _expression_ in a cell is shown in the notebook by default.**

The elements in a list have indices.  That is, to access an element in the list, you can refer to it by its index.  Think of a list like a very simple table.

| index | value |
|:---:|:---|
| 0 | `'I'` |
| 1 | `'like'` |
| 2 | `'pie'` |

**People might start counting at `1`, but computers start counting at `0`.  The first element in a list has the index `0`, the last element in a list has the index of the length of the list minus 1.  For our list which is three elements long, the first index will be 0 and the last index will be `2`.**

**Some programming languages also start counting at 1.  These include [Fortran](https://en.wikipedia.org/wiki/Fortran), [Matlab](https://en.wikipedia.org/wiki/MATLAB), and the abominable [R](https://en.wikipedia.org/wiki/R).  This is unfortunate.  Be extra careful if you try to [port code](https://en.wikipedia.org/wiki/Porting) from those languages to Python.**

If you want to access a list element you can use its index.  The index value is designated by appending  `[` and `]` to the variable name with the index between.  Examples are always easier than words:

```
my_list[0]
```

Given what you know... What will this output?


```python
my_list[0]
```




    'I'



If you try to use an index that is larger than the length of the list minus 1, you will get an error.  Try it!

The different colors means you made a boo boo!

```
my_list[3]
```


```python
# my_list[3]
```

The last line of the error report is the most informative for us now.  It should read:

```
IndexError: list index out of range
```

It is trying to tell you that an `IndexError` occured because the the index you tried to access is out of the range of `0` to `2`, inclusive.  Translation: stay in your lane, programmer!

In addition to being able to recall or access a value of a list by the element's index in the list, we can change the value of the element.  We will also use the `[` `<index>` `]` notation but like when we set the value of a variable, we will use the `=` character.  Let's do it!

```
my_list[2] = 'cake'
my_list
```


```python
# my_list[2] = 'cake'
# my_list
my_list[2] = 'cake'
my_list
```




    ['I', 'like', 'cake']



#### 2.1.1.1 Append, and other list functions

Finally, let's talk about empty lists and appending items to a list.  An empty list is created by setting a variable to `[]`.  This means the variable's **_data type_** is a list, but it contains no elements.

```
a_new_list = []
```


```python
a_new_list = []
a_new_list
```




    []



We can append items to a list by using the `.append()` **_function_**.  We'll talk more about functions later, but when this **_function_** or **_method_** is used on a variable whose **_data type_** is list, it will append the value in between the `()` to the end of the list.

```
a_new_list.append("1st element")
print(a_new_list)
a_new_list.append("2nd element")
print(a_new_list)
```


```python
a_new_list.append("1st element")
```


```python
a_new_list
```




    ['1st element']




```python
a_new_list = []
a_new_list.append("1st element")
print(a_new_list)
a_new_list.append("2nd element")
print(a_new_list)
```

    ['1st element']
    ['1st element', '2nd element']


Finally, in addition to the `.append()` **_function_**, there are a lot of **_functions_** (or **_methods_**) available for **_lists_**.  See a complete list of them [here](https://docs.python.org/3/tutorial/datastructures.html#more-on-lists).

One more we'll touch on quickly is the `len()` **_function_**.  It returns the length of a **_list_**.  Here is an example:

```
len(a_new_list)
```

Before you run this cell.  What do you think it will output?


```python
len(a_new_list)
```




    2



---

#### 2.1.1.2 Slicing

Sometimes you want to make a list from consecutive elements of a list.  This is called **_slicing_** where you cut up a list and get just the consecutive values you want.  **_Slicing_** is done with the `:` character in the index area between the `[` and the `]`.  Here is an example to pull just the last two items out of `my_list`.  We use the first index, then a `:`, then the last index plus 1.  Like this:

```
my_list[1:3]
```

You might be asking... **WHY +1??**  This is because with _slices_ or _ranges_ in Python are known as **[_half-open intervals_](https://en.wikipedia.org/wiki/Interval_(mathematics))** where the lower bound is inclusive and the upper bound is the non-inclusive limit.  **TL;DR**: add one to the upper end of a _slice_ or a _range_ in Python.

```
my_list[1:3]
```


```python
my_list[1:3]
```




    ['like', 'cake']



Just for giggles, try it with `my_list[1:2]`.  You will see the _range_ of the _slice_ is only `1`.  That's because `2 - 1 = 1`.

```
my_list[1:2]
```


```python
my_list[1:2]
```




    ['like']



You don't even need to use the upper bound if all you really mean is _the end of the list_.  For that, you can leave the index empty.  Hot dog!  Let's see an example...

```
my_list[1:]
```


```python
my_list[:]
```




    ['I', 'like', 'cake']



**But wait, there's more!**  You can set multiple elements of a list **at the same time** by _slicing_.  **Dig this!**

```
my_list[1:] = ['love', 'puppies']
my_list
```


```python
my_list[1:]
```




    ['like', 'cake']




```python
my_list[1:] = ['love', 'puppies']
my_list
```




    ['I', 'love', 'puppies']



And who doesn't love puppies? Recap... Lists are _ordered_ _collections_ of information that you can recognize by their use of `[` and `]`.  To access or _address_ elements in the list, you can use _indices_.  They start at `0` in Python.  The last element of a list has the index of the length of the list minus 1.  When _slicing_ a list, use two indices separated by `:`.  If you leave one off, it means everything up to or beyond that element.  

#### 🙋 Question 1: Slicing

> Will either one of the following codes will return an error?

`my_list[:len(my_list)]`

`my_list[len(my_list)]`


```python
my_list[:len(my_list)]
```




    ['I', 'love', 'puppies']




```python
longer_list = ['I', 'like', 'puppies', 'and', 'sand', 'castles']
number_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# list[<start>:<end>:<step>]
number_list[::-1]
```




    [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]



---

#### 2.1.1.3 Negative indices?!?!

A brief note for folks who want to learn more.  You can use negative index numbers to access from the end of the list towards the front.  That is, a negative 1 (`-1`) is the last element in the list.  A negative 2 (`-2`) is the second to last.  The same rules apply for slicing with the `:` character. 

A quick demo example...  Let's get last element in the list using negative indexing.  That will be `-1`.  Here goes...

```
my_list[-1]
```


```python
my_list[-1]
```




    'puppies'



We can also use _slicing_ with _negative indices_. Remember, that _slicing_ works the same way with _negative indices_, i.e. the the upper bound is non-inclusive.  Here is an example using upper and lower bounds.  Were you surprised by the results?

```
my_list[-3:-1]
```


```python
longer_list
```




    ['I', 'like', 'puppies', 'and', 'sand', 'castles']




```python
longer_list[5::-1]
```




    ['castles', 'sand', 'and', 'puppies', 'like', 'I']



---

#### 2.1.1.4 Lists can contain most anything

So far, we've seen a list containing some strings.  That made our sentence analogy about the _ordering_ of _objects_ or strings in a list make sense.  But lists can contain a mixture of _data types_ and _data structures_.  As a quick example, let's make a list that contains a integer, a string and a floating point number.  This will be a four element list.

```
zoo = [ 42, 'Elephants', 'ate', 3.14 ]
```



```python
zoo = [ 42, 'Elephants', 'ate', 3.14 ]
zoo
```




    [42, 'Elephants', 'ate', 3.14]



We can even make a list of lists. **META!**

```
list_of_lists = [
    [  42,  43,  44, 44  ],
    [ 'a', 'b', 'c', 'd' ]
]

list_of_lists[0]

list_of_lists[0][1]

a_list = list_of_lists[0]
a_list[1]
```



```python
list_of_lists = [
    [  42,  43,  44, 45  ],
    [ 'a', 'b', 'c', 'd' ]
]
```

The important thing here is to have the right number of `[` and `]` to embed a list in a list separated between `,`.  Yeah, this **is** super meta.


```python
list_of_lists[0]
```




    [42, 43, 44, 45]




```python
list_of_lists[0][1]
```




    43




```python
list_of_lists[1][1]
```




    'b'




```python
a_list = list_of_lists[0]
a_list[1]
```




    43



#### 🏋️ Exercise 2: accessing lists of lists

Make sure you understand why the above works.  Take a minute and play with the first and last indices.

<ol>
<li> access <code>45</code> in list_of_lists
<li> access <code>d</code> in list_of_lists
</ol>


```python
# Cell for exercise 2
print(list_of_lists[0][-1])
print(list_of_lists[1][-3])
```

    45
    b



```python
list_of_lists
```




    [[42, 43, 44, 45], ['a', 'b', 'c', 'd']]




```python
print(list_of_lists[-2][-1])
print(list_of_lists[-1][-3])
```

    45
    b


---

### 2.1.2 Dictionaries

_For more than just reading on a Friday night._
Sometimes we want to _access_ elements in a _data structure_ by something other than an index.  Consider a [dictionary on the internet](https://www.dictionary.com/).  You look up the word on a seach engine and go to the web page of the entry for the word.  Python has a similar concept where the index for an element in a **_collection_** is not a number, as it is in a list above, but a `key` that, may be a string like `'pickles'`.  



#### 2.1.2.1 Key, value pairs

In the case of a Python **_dictionary_**, we call the definition a **_value_** and the way we look up the definition is a **_key_**.  This results in **_key_** and **_value_** pairs.  One **_key_** maps to one **_value_**.  In our analogy of a internet dictionary, this is the same as the word to definition pairs.

Let's create a simple dictionary with a definition we have alread seen in the tutorials... Pickles. 

```
my_dict = {} # create an empty dictionary
my_dict['pickles'] = "A cucumber preserved in vinegar or brine."
my_dict
```


```python
my_dict = {} # create an empty dictionary
my_dict['pickles'] = "A cucumber preserved in vinegar or brine."
my_dict
```




    {'pickles': 'A cucumber preserved in vinegar or brine.'}



Notice the use of the `#` comment.  Nice.  Unlike the list, for dictionaries, some of their operations use the `{` and `}` brackets.  Using a key to access or retrieve a value from the dictionary still uses the `[` and `]` brackets.  Stick with it, for realz.

Case matters in a dictionary because the `key` is a _data type_ itself.

```
my_dict['Pickles']
```

returns an error (`KeyError: 'Pickles'`) and the following does not

```
my_dict['pickles']
```


```python
# my_dict['Pickles']
```

   This is a lot like the `IndexError` from the list case.
   
   Moving on... You can change the value of a dictionary **_key_** by **_reassigning_** it.  For example below, we use the same key `'pickles'` to change the definition of the word in our dictionary.  Notice we still use the `[` and `]` brackets but we use the **_key_** instead of the **_index_** like we did with lists.  The change we made in the string is that the cucumbers in pickles are usually small.
   
   ```
   my_dict['pickles'] = "A small cucumber preserved in vinegar or brine."
   ```


```python
my_dict['pickles'] = "A small cucumber preserved in vinegar or brine."
my_dict
```




    {'pickles': 'A small cucumber preserved in vinegar or brine.'}



Let's add two `key` and `value` pairs to our dictionary which are in the table below:

| key | value |
|-----|-------|
| list | An ordered collection. |
| dictionary | A collection with _unique indices_. |

Something like:
```
my_dict['list'] = "An ordered collection"
print(my_dict)
```
Is probably where we want to begin.


```python
my_dict['list'] = "An ordered collection"
my_dict
```




    {'list': 'An ordered collection',
     'pickles': 'A small cucumber preserved in vinegar or brine.'}




```python
# my_dict[0]
```

Finally, like the **_list's_** `.append()` **_function_**, there are a lot of **_functions_** (or **_methods_**) and **_attributes_** available for dictionaries.  See a complete list of them [here](https://docs.python.org/3/tutorial/datastructures.html#dictionaries).

(we will cover the difference between a method and an attribute more concretely later on...)

## 2.2 Flow control: If this, then that...

**_Flow control_** is a fancy phrase meaning to execute some code statements under certain conditions.  The simplest case, is an `if` statement (figure right below):  If a variable is `True` then do something.  If it is `False` then do something else, or do nothing at all.  





<img src="https://docs.oracle.com/cd/B19306_01/appdev.102/b14261/lnpls008.gif">Flow control figure</img>

In the above figure: 

* the `selection` refers to `if` statements 
* `Iteration` refers to loops or repeating some statements over and over while changing a small number of variable values
* `Sequence` roughly corresponds to blocks of statements in **_functions_**.

Flow control refers how to programs do loops, conditional execution, and order of functional operations.  Let's start with conditionals, or the venerable ``if`` statement.

### 2.2.1 If

Let's write a simple if statement


```python
if 5 == 5.0:
  print(True)
```

    True


Mathematically, the float 5.0 and integer 5, do evaluate to be the same! What do we notice about the second line? That's right, there's an indentation. Colab and most IDEs will automatically indent for you. Let's practice that below.

#### 2.2.1.1 Indentations in python

Exercise 3.1: Writing and if statement

practice writing a simple if statement, notice the automatic indentation


```python
# cell for exercise 3.1
a = 2
b = 3
if b < a:
  print(True)
```

#### 2.2.1.2 Conditional fall through and reserved words

If statements can be used to execute some lines or block of code if a particular condition is satisfied.  E.g. Let's print something based on the entries in the list.

```
mission = ["let's", "explore", "some", "data", "!"]

if '!' in mission:
    print('#notaword')
```


```python
mission = ["let's", "explore", "some", "data", "!"]

if '!' in mission:
  print('#notaword')
```

    #notaword


##### 2.2.1.2.1 `in`

Notice the use the special **_reserved word_** **in**.  This returns the value `True` when a value appears in a **_list_** and `False` when it does not.  Notice how it reads like English.  Readability is a key feature of Python and is part of the language design philosophy.

Usually we want conditional logic on both sides of a binary condition, e.g. some action when ``True`` and some when ``False``

```
if '!' in mission:
    print("This isn't a full word!")
else:
    print("Nothing to see here")
```


```python
if 4 in mission:
    print("This isn't a full word!")
else:
    print("Nothing to see here")
```

    Nothing to see here


##### 2.2.1.2.2 `pass`
There is a special do nothing word: `pass` that skips over some arm of a conditional, e.g.

```
if 'data' in mission:
    print("Congrats, you're working with data, it will be grand!")
else:
    pass
```


```python
unexpected = 0
if 4 in mission:
    print("Congrats, you're working with data, it will be grand!")
else:
    unexpected += 1
    pass
```

The use of `pass` here is very important.  While you can actually skip the `else` and `pass` statements and the code will behave identically, using them is an important signal that you intended for the negative case to do nothing.  When you are writing code, you should start thinking about reading code and how others will read your code.

In short, when you have one side of an `if` statement that has no code use an `else` and a `pass` to be a good citizen.  Remember, the person you will collaborate the most about your code is yourself in 3-6 months.  Love yourself, use `pass`.

_Note_: what have you noticed in this session about quotes?  What is the difference between ``'`` and ``"``?


Another simple example:

```
if True is False:
    print("I'm so confused")
else:
    print("Everything is right with the world")
```


```python
if True is False:
    print("I'm so confused")
else:
    print("Everything is right with the world")
```

    Everything is right with the world


##### 2.2.1.2.3 `if`, `elif`, and `else`

It is always good practice to handle all cases explicity.  **_Conditional fall through_** is a common source of bugs.

Sometimes we wish to test multiple conditions.  Use `if`, `elif`, and `else`.

```
my_favorite = 'pie'

if my_favorite is 'cake':
    print("He likes cake!  I'll start making a double chocolate velvet cake right now!")
elif my_favorite is 'pie':
    print("He likes pie!  I'll start making a cherry pie right now!")
else:
    print("He likes " + my_favorite + ".  I don't know how to make that.")
```


```python
my_favorite = 'pie'

if my_favorite is 'cake':
    print("He likes cake!  I'll start making a double chocolate velvet cake right now!")
elif my_favorite is 'pie':
    print("He likes pie!  I'll start making a cherry pie right now!")
else:
    print("He likes " + my_favorite + ".  I don't know how to make that.")
```

    He likes pie!  I'll start making a cherry pie right now!


**Note**: There is a big difference between the above using `elif` and this code that uses sequential `if`s:

```
if my_favorite is 'pie':
    print("He likes pie!  I'll start making a double chocolate velvet pie right now!")
if my_favorite is 'pie':
    print("He still likes pie!  I'll start making a cherry pie right now!")
else:
    print("He likes " + my_favorite + ".  I don't know how to make that.")
```

Before you run the cell, can you describe how these two blocks differ in their outcomes?


```python
a = 0
for i in range(10):
  a += 1 # a = a + 1
```


```python
a
```




    10




```python
if my_favorite == 'pie':
    print("He likes pie!  I'll start making a double chocolate velvet pie right now!")
if my_favorite is 'pie':
    print("He still likes pie!  I'll start making a cherry pie right now!")
else:
    print("He likes " + my_favorite + ".  I don't know how to make that.")
```

    He likes pie!  I'll start making a double chocolate velvet pie right now!
    He still likes pie!  I'll start making a cherry pie right now!


##### 2.2.1.2.4 ``and``, ``or`` and ``not``

**Conditionals** can take ``and`` and ``or`` and ``not``.  E.g.

```
my_favorite = 'pie'

if my_favorite is 'cake' or my_favorite is 'pie':
    print(my_favorite + " : I have a recipe for that!")
else:
    print("Ew!  Who eats that?")
```

> Side note: We haven't mentioned this up until now, in the following cell, we are composing a new string using `+` and feeding this into the print statement: `my_favorite + " : I have a recipe for that!"`


```python
my_favorite = 'pie'

if (my_favorite is 'cake') or (my_favorite is 'pie'):
    print(my_favorite + " : I have a recipe for that!")
else:
    print("Ew!  Who eats that?")
```

    pie : I have a recipe for that!



```python
# and or
# & |
```

#### 🏋️ Exercise 3: Writing conditionals

<ol>
<li>Write a series of two if statements, that both evaluate as true and print something
<li>Write an if followed by an elif statement, where only one evaluates as true and prints something
</ol>


```python
# Cell for exercise 4
thing = [1, 2, 3, 4]
if 1 in thing:
  print(1)
if 4 in thing:
  print(4)

print()

if thing == [1, 2, 3, 4]:
  # will evaluate if the two objects are equal in value
  print('equals evals as true')
if thing is [1, 2, 3, 4]:
  # is will evaluate if we are in the same memory location
  print('is evals as true')
```

    1
    4
    
    equals evals as true


### 2.2.2 For

For loops are the standard loop, though `while` is also common.  For has the general form:
```
for items in list:
    do stuff
```



#### 2.2.2.1 Iterating through objects

For loops and collections like tuples, lists and dictionaries are natural friends. The loop is *iterating* through an object we call an *iterable*. tuples, lists, and dictionaries, are all *iterables*

```
mission

for item in mission:
    print(item)
```


```python
mission
```




    ["let's", 'explore', 'some', 'data', '!']




```python
for i in mission:
    print(i)
```

    let's
    explore
    some
    data
    !


Note that after the **_for_** loop has ended, the `item` variable remains defined and contains the last value of the list that was iterated over.


```python
%%timeit
for i in range(10):
  pass
```

    The slowest run took 5.96 times longer than the fastest. This could mean that an intermediate result is being cached.
    1000000 loops, best of 5: 410 ns per loop



```python
%%timeit
i = 0
while i < 10:
  i += 1
```

    1000000 loops, best of 5: 677 ns per loop


You can combine loops and conditionals:

```
for item in mission:
    if item.endswith('!'):
        print(item + " doesn't look like a whole word!")
    else:
        print(item + " is a word in a sentence!")
        
```


```python
for item in mission:
    if item.endswith('!'):
        print(item + " doesn't look like a whole word!")
    else:
        print(item + " is a word in a sentence!")
```

    let's is a word in a sentence!
    explore is a word in a sentence!
    some is a word in a sentence!
    data is a word in a sentence!
    ! doesn't look like a whole word!


Dictionaries can use the `keys` method for iterating.

```
my_dict.keys()

for key in my_dict.keys():
    if len(key) > 4:
        print(my_dict[key])
```


```python
my_dict.keys()
```




    dict_keys(['pickles', 'list'])




```python
for key in my_dict.keys():
    if len(key) > 4:
        print(my_dict[key])
```

    A small cucumber preserved in vinegar or brine.


Strings are basically a list.  Therefore, you can use a for loop to iterate over the characters in a string.  Note that `c` is a typical variable name for characters in a string.  Generally, one letter variable names are not a good thing.

```
my_string = "caffeine"
for c in my_string:
    print(c)
```


```python
my_string = "caffeine"
for c in my_string:
    print(c)
```

    c
    a
    f
    f
    e
    i
    n
    e


#### 2.2.2.2 `range()`

Manually constructing a list of sequential numbers is a total pain.  A total pain.  So Python has a **_function_** called `range` that simplifies the creation of **_lists_** that contain a sequence.   Let's see it in action!  Note that if we want a sequence from 0 to 2, inclusive, we call the `range` function with a argument of `3`.  This is like the upper bound in **_slicing_** - it is always 1 plus the maximum value you want in the list.

```
range(3)
```


```python
range(3)
```




    range(0, 3)




```python
list(range(1, 10, 2))
```




    [1, 3, 5, 7, 9]



Wait up, hoss.  That result doesn't look like a list!  True.  However, it acts identically to a list, but works a little different under the hood to save memory.  The equivalent hand made list would look like this:

```
[0, 1, 2]
```


```python
[0, 1, 2]
```




    [0, 1, 2]



##### 2.2.2.2.1 `list`, type cast function

We can convert a `range` to a `list` by using the `list` type cast **_function_**.

```
list(range(3))
```


```python
list(range(3))
```




    [0, 1, 2]



Notice that Python (in the newest versions, e.g. 3+) has an object type that is a range.  This saves memory and speeds up calculations vs. an explicit representation of a range as a list - but it can be automagically converted to a list on the fly by Python.  To show the contents as a `list` we can use the type case like with the tuple above.

Sometimes, in older Python docs, you will see `xrange`.  This used the range object back in Python 2 and `range` returned an actual list.  Beware of this!


```python
list(range(3))
```




    [0, 1, 2]



Remember earlier with slicing, the syntax `:3` meant `[0, 1, 2]`?  Well, the same upper bound philosophy applies here.

```
xs = [0, 1, 2]

for x in xs[0:1]:
    if x < 2:
        print(x)
    else:
        pass
```


```python
xs = [0, 1, 2]

for x in xs[0:3]:
    if x < 2:
        print(x)
    else:
        pass
```

    0
    1


Let's use range to acccess our list, _mission_ using list element indexing.  

```
for index in range(5):
  item = mission[index]
  if item.endswith('!'):
      print(item + " doesn't look like a whole word!")
  else:
      print(item + " is a word in a sentence!")
```


```python
for index in range(5): #0, 1, 2, 3, 4
  item = mission[index] # the different items in the list mission
  if item.endswith('!'):
      print(item + " doesn't look like a whole word!")
  else:
      print(item + " is a word in a sentence!")
```

    let's is a word in a sentence!
    explore is a word in a sentence!
    some is a word in a sentence!
    data is a word in a sentence!
    ! doesn't look like a whole word!


This would probably be better written as below.  Why is it better to use to use the `len()` function than hard code the length of the list?

```
for index in range(len(mission)):
  item = mission[index]
  if item.endswith('!'):
      print(item + " doesn't look like a whole word!")
  else:
      print(item + " is a word in a sentence!")
```


```python
for index in range(len(mission)):
  item = mission[index]
  if item.endswith('!'):
      print(item + " doesn't look like a whole word!")
  else:
      print(item + " is a word in a sentence!")
```

    let's is a word in a sentence!
    explore is a word in a sentence!
    some is a word in a sentence!
    data is a word in a sentence!
    ! doesn't look like a whole word!



```python
for item in mission[:3]:
  if item.endswith('!'):
      print(item + " doesn't look like a whole word!")
  else:
      print(item + " is a word in a sentence!")
```

    let's is a word in a sentence!
    explore is a word in a sentence!
    some is a word in a sentence!


But in all, it isn't very Pythonesque to use indexes like that (unless you have another reason in the loop) and you would opt instead for the `instructor in instructors` form.  

More often, you are doing something with the numbers that requires them to be integers, e.g. math.


```python
sum = 0
for i in range(10):
    sum += i
print(sum)
```

    45


Before we leave the topic of `range()`, let's take a quick look at the documentation for it [here](https://docs.python.org/3.3/library/stdtypes.html?highlight=range#ranges).  Notice, it has another calling semantic than the one have have been using.

We have been using this version:

```
range(stop)
```
Where the list will end at `stop` minus 1.  There is another way the `range` **_function_** can be called which is to give it an inclusive `start` and an exclusive `stop`:

```
range(start, stop)
```

This returns a list of number that go from `start` to `stop` minus 1.

Let's look at a quick example:

```
range(1, 9)
```


```python
range(1, 9)
```




    range(1, 9)



#### 2.2.2.3 Nested for loops

You can put a for loop _inside_ another for loop.  This is called _nesting_.  Think of it like the [Matryoshka dolls](https://en.wikipedia.org/wiki/Matryoshka_doll).  The example below has a nested loop that counts to four each time the outer loop counts up one.  The `print` **_function_** shows the value of the outside loop iterator `i` and the inside loop iterator `j` and the product of the two values.  Notice how the inside loop runs through 1 to 3 for each value of the outside loop.

We use some string formatting for the `print` statement.  These are called **_f-strings_** because there is an `f` before the string. Don't worry too much about the `print` function statement here as it isn't the point of this example.  _Advanced topic_: for more on formatting strings, see [here](https://docs.python.org/3/tutorial/inputoutput.html#fancier-output-formatting).

```
for i in range(1, 4):
    for j in range(1, 4):
        print(f'{i} * {j} = {i * j}')
```


```python
for i in range(1, 4):
    for j in range(1, 4):
        print(f'{i} * {j} = {i * j}')
```

    1 * 1 = 1
    1 * 2 = 2
    1 * 3 = 3
    2 * 1 = 2
    2 * 2 = 4
    2 * 3 = 6
    3 * 1 = 3
    3 * 2 = 6
    3 * 3 = 9


#### 2.2.2.4 Exiting for loops

You can exit a for loop if a condition is met. We'll explore this with reserved words `break` and `continue`

##### 2.2.2.4.1 `break`

Sometimes, in a for loop, you experience a condition where you want to terminate any further iterations of the loop.  The **_reserved word_** `break` will completely exit a for loop.  In this example, we exit the for loop when the iteration variable `i` is equal to the integer 4.

```
for i in range(10):
    if i == 4:
        break
i
```


```python
for i in range(10): # creates a list that starts at 0 ends at 10 exclusive
    print(i)
    if i == 4:
        break
i
```

    0
    1
    2
    3
    4





    4



#### 2.2.2.4 `continue`

Sometimes, in a for loop, you want to skip certain elements.  The `continue` statement will effectively skip any further statements for that element in a list.  Below, we sum the numbers from `0` to `9` and skip the value `5`.

```
sum = 0
for i in range(10):
    if i == 5:
        continue
    else:
        print(i)
        sum += i
        
print("sum is ", sum)
```


```python
for i in range(6):
    if i == 3:
        continue
    print(i)
```

    0
    1
    2
    4
    5


### 2.2.3 `while`

In contrast to a `for` loop, a `while` loop continues to execute while the initiating condition continues to evaluate as True.


```python
a = 0
while a < 10:
  a += 5
  print("hello!")
# a
```

    hello!
    hello!


You can also use `break` and `continue` in `while` loops


```python
while True:
  print("hello!")
  break
```

    hello!


#### 🙋 Question 2: While Loops

> What happens in this cell?
```
a = 0
while a < 10:
  if a == 5:
    continue
  a += 5
  print("hello!")
```


```python
# a = 0
# while a < 10:
#   if a == 5:
#     continue
#   a += 5
#   print("hello!")
# a
```

## 2.3 The Zen of Python

Finally, let's use end with a philosophy of Python.  This is a fun [Easter Egg](https://en.wikipedia.org/wiki/Easter_egg_(media)), to see it, `import this`:


```python
import this
```

    The Zen of Python, by Tim Peters
    
    Beautiful is better than ugly.
    Explicit is better than implicit.
    Simple is better than complex.
    Complex is better than complicated.
    Flat is better than nested.
    Sparse is better than dense.
    Readability counts.
    Special cases aren't special enough to break the rules.
    Although practicality beats purity.
    Errors should never pass silently.
    Unless explicitly silenced.
    In the face of ambiguity, refuse the temptation to guess.
    There should be one-- and preferably only one --obvious way to do it.
    Although that way may not be obvious at first unless you're Dutch.
    Now is better than never.
    Although never is often better than *right* now.
    If the implementation is hard to explain, it's a bad idea.
    If the implementation is easy to explain, it may be a good idea.
    Namespaces are one honking great idea -- let's do more of those!


## 2.4 References

Some links to references from content in this notebook are consolidated here for easy access.  Enjoy!

* [Using equations in Markdown in Jupyter notebooks](https://medium.com/analytics-vidhya/writing-math-equations-in-jupyter-notebook-a-naive-introduction-a5ce87b9a214)
* [How numbers are represented in a computer](http://steve.hollasch.net/cgindex/coding/ieeefloat.html)
* [Grace Hopper](https://en.wikipedia.org/wiki/Grace_Hopper) and [her photo of a `bug` in her notebook](https://en.wikipedia.org/wiki/Grace_Hopper#/media/File:First_Computer_Bug,_1945.jpg)
* Programmer culture touchpoint: the word [grok](https://en.wikipedia.org/wiki/Grok)
* Converting code from one programming language to another is called [Porting](https://en.wikipedia.org/wiki/Porting)
* _slices_ and _ranges_ in Python are known as **[_half-open intervals_](https://en.wikipedia.org/wiki/Interval_(mathematics))**
* [Python documentation for lists](https://docs.python.org/3/tutorial/datastructures.html#more-on-lists)
* [Negative list indices in Python](https://googlethatforyou.com?q=negative%20indexing%20in%20python)
* [Python documentation for dictionaries](https://docs.python.org/3/tutorial/datastructures.html#dictionaries)
* [Python documentation for the `range` function](https://docs.python.org/3.3/library/stdtypes.html?highlight=range#ranges)
* [Third party documentation for `if` statements](https://www.w3schools.com/python/python_conditions.asp)
* [Third party documentation for `for` loops](https://www.w3schools.com/python/python_for_loops.asp)
* [Third party documentation for functions](https://www.w3schools.com/python/python_functions.asp)
* The correct name for the "Russian Nesting Doll" is a "[Matryoshka doll](https://en.wikipedia.org/wiki/Matryoshka_doll)"
* [Formatting strings to include values of variables](https://docs.python.org/3/tutorial/inputoutput.html#fancier-output-formatting)
* [Zen of Python](https://www.python.org/dev/peps/pep-0020/)
* [Easter Egg](https://en.wikipedia.org/wiki/Easter_egg_(media))
