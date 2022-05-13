<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/labs/L1_Python_and_Jupyter.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Lab 1: Practice with Python and Jupyter Notebooks

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com

**Solved**: [notebook](https://wesleybeckner.github.io/python_foundations/solutions/SOLN_L1_Python_and_Jupyter/)
<br>

---

<br>

This first lab assignment will be a review of what we discussed today.

<br>

---




#### 🔠 L1 Q1 Python variables

In the empty code cell below, create the following four variables:
- A string variable named `favorite_movie` that represents your favorite movie
- A string variable named `national_chain` that represents your favorite fast food restaurant
- An integer variable named `streaming_video_hours` that represents the whole number of hours you watch any streaming video service (ex. Netflix, Hulu, Disney+) per week.
- A float variable named `headphone_cost` that represents the most money you had to pay, in dollar-cent amount (0.00), for headphones. Do not include a '$' symbol.

Then after they are declared, print each one using the print() function explained in section 1.1.2.


```python

```

To check if each variable is the correct data type, use the type() function explained from section 1.1.3, in the empty code cell below. For example, `type(favorite_movie)` should return the output `<class 'str'>`, which indicates the string type.


```python

```

#### 🧮 L1 Q2 Practice with math in Python

Let's start with a few basic operators that was covered in section 1.1.4. Write the expression for multiplying 23 by 31, so that running this function will correctly output the product of these two numbers.


```python

```

Consider the operation written in Python: `27 / 3 + 6`. Write the same syntax in the empty cell below, and modify it to include parentheses in the right location so that the result/answer of the math is 3.0, rather than 15.0.


```python

```

Let's learn more operators beyond the ones we covered earlier. Write the line of code `3 ** 2` in the cell below. From the output, what do you think the double asterisks (`**`) operator represents in Python?


```python

```

Write the line of code `28 / 3` below. Then just below the line in the same cell, write the code `28 // 3`. Compare the differences in output between the two. Can you decipher what `//` means in Python?


```python

```


```python

```

Now for more complicated mathematical operations! 

Try to write the Python equivalent of the following:

$$\frac{14 + 28}{28 - 14}$$


```python

```

Now try this one:

$$\frac{15 + 984}{-(217+4)}$$


```python

```

And finally, write the Python equivalent for this:

$$\frac{-(3655 * 44)}{(8 * 16)^3}$$


```python

```

#### 🤐 L1 Q3 Practice writing helpful comments

Consider the following code below. No need to decipher and understand every piece but just be aware of the output when you run the code cell. Based on the output, modify the code cell by adding a code comment at the top of the cell briefly explaining what the code does. This comment can be as many lines as you'd like, and may or may not include direct references to the example print statements below.


```python
def mystery_function(x):
    y = list(x)
    return " ".join(y[::-1])

print(mystery_function("UniversityOfWashington"))
print(mystery_function("AvocadoToast"))
print(mystery_function("RacecaR"))
```

    n o t g n i h s a W f O y t i s r e v i n U
    t s a o T o d a c o v A
    R a c e c a R


#### ™️ L1 Q4 More Markdown

Consider the vision statement of the Global Innovation Exchange: "Our mission is to build the talent that leverages emerging technologies in new and impactful ways". Type that same statement in a new text cell below, only add a `_` (underscore) at the beginning and end. What ends up happening to the format of the text as a result?

In a new text cell, list all of the potential data science projects you might work on, with each one on its own separate line. Then add a `- ` at the beginning of each line; include a single space between the hyphen and the first letter in your project name! Based on the output, what can you decipher that this `- ` changes in the formatting?

#### 🧑‍🤝‍🧑 L1 Q5 Get familiar with the Python community

Python has strong support from a community of avid developers and computer scientists. The Python Software Foundation (PSF) tries to maintain input and activity through their own website, [python.org](https://). Please explore their community section - https://www.python.org/community/ - and answer the following questions in a new text cell just below this one:

- What is the name of the mailing list that the PSF manages for those who have questions about Python code?
- In your own words, what is the goal of their Community Survey?
- According to their most recent annual report, which continent provides the highest proportion of grants to the PSF?
- Name at least three ways that the PSF recommends you can get involved with the community.

#### 🗞️ L1 Q6 Advanced - Understanding the switch from Python 2 to 3

Inside of the following link, https://www.python.org/doc/, is an article about the Python Software Foundation's decision to end support for Python version 2, and move with support for version 3. From the article, answer the following questions in a new text cell just below this one:

- What official date was Python 2 no longer supported?
- What is the version number of the last supported Python 2?
- In your own words, describe why the Python Software Foundation made the decision to stop supporting Python 2.

#### 📓 L1 Q7 Advanced - Create your own Google Colab notebook!

Create your own separate Google Colab notebook with the following rules and content:

- The file name of your notebook should be in the format ***lastname_python_foundations_notebook.ipynb***.
- Include a header (of any size) that lists your first name and last name, followed by "**Python Foundations**".
- Create a short paragraph bio of yourself in a text cell.
- Include/embed an image of the Python logo, which can be found here: https://www.python.org/community/logos/.
- Create a code cell with just the line of code: `import this`
- Take your favorite line from that output and past it in a text cell below, both bolding and italicizing it

