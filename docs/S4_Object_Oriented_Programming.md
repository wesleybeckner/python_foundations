<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/S4_Object_Oriented_Programming.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Session 4: Object Oriented Programming
**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com
<br>

---

<br>

Today we'll be discussing a very important concept through all of programming: how to be object-oriented.

<br>

---


## 4.1: Object Oriented Programming

### 4.1.1 Classes, Instances, Methods, and Attribtues

A class is created with the reserved word `class`

A class can have attributes


```python
# define a class
class MyClass:
  some_attribute = 5
```

We use the **_class blueprint_** _MyClass_ to create an **_instance_**

We can now access attributes belonging to that class:


```python
# create instance
instance = MyClass()

# access attributes of the instance of MyClass
instance.some_attribute
```




    5



attributes can be changed:


```python
instance.some_attribute = 50
instance.some_attribute
```




    50



In practice we always use the `__init__()` function, which is executed when the class is being initiated. 

<br>

<p align=center>
<img src="https://cdn2.bulbagarden.net/upload/thumb/2/23/Pok%C3%A9_Balls_GL.png/250px-Pok%C3%A9_Balls_GL.png"></img>
</p>


```python
class Pokeball:
  def __init__(self, contains=None, type_name="poke ball"):
    self.contains = contains
    self.type_name = type_name
    self.catch_rate = 0.50 # note this attribute is not accessible upon init
```


```python
# empty pokeball
pokeball1 = Pokeball()

# used pokeball of a different type
pokeball1 = Pokeball("Pikachu", "master ball")
```

> what is the special keyword [`self`](http://neopythonic.blogspot.com/2008/10/why-explicit-self-has-to-stay.html) doing?

The `self` parameter is a reference to the current instance of the class and is used to access variables belonging to the class.

classes can also contain methods


```python
import random

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

```


```python
pokeball = Pokeball()
pokeball.catch("picachu")
```

    picachu captured!



```python
print(pokeball.contains)
```

    picachu


### 🏋️ Exercise 1

Create a release method for the class Pokeball:


```python
# Cell for Exercise 1
```

### 4.1.2 Inheritance

Inheritance allows you to adopt into a child class, the methods and attributes of a parent class


```python
class MasterBall(Pokeball):
  pass
```


```python
masterball = MasterBall()
masterball.type_name
```




    'poke ball'



HMMM we don't like that type name. let's make sure we change some of the inherited attributes!

We'll do this again with the `__init__` function


```python
class MasterBall(Pokeball):
  def __init__(self, contains=None, type_name="Masterball", catch_rate=0.8):
    self.contains = contains
    self.type_name = type_name
    self.catch_rate = catch_rate
```


```python
masterball = MasterBall()
masterball.type_name
```




    'Masterball'




```python
masterball.catch("charmander")
```

    charmander captured!


We can also write this, this way:


```python
class MasterBall(Pokeball):
  def __init__(self, contains=None, type_name="Masterball"):
    Pokeball.__init__(self, contains, type_name)
    self.catch_rate = 0.8
```


```python
masterball = MasterBall()
masterball.type_name
```




    'Masterball'




```python
masterball = MasterBall()
masterball.catch("charmander")
```

    charmander captured!


The keyword `super` will let us write even more succintly:


```python
class MasterBall(Pokeball):
  def __init__(self, contains=None, type_name="Masterball"):
    super().__init__(contains, type_name)
    self.catch_rate = 0.8
```


```python
masterball = MasterBall()
masterball.catch("charmander")
```

    charmander captured!


### 🏋️ Exercise 2

Write another class object called `GreatBall` that inherits the properties of `Pokeball`, has a `catch_rate` of 0.6, and `type_name` of Greatball


```python
# Cell for Exercise 2
```

### 4.1.3 Interacting Objects

As our application becomes more complex, we may have to rethink what methods and attributes are appropriate for our objects to deliver the overall functionality we desire

### 🏋️ Exercise 3

Write another class object called `Pokemon`. It has the [attributes](https://bulbapedia.bulbagarden.net/wiki/Type):

* name
* weight
* speed
* type

Now create a class object called `FastBall`, it inherits the properties of `Pokeball` but has a new condition on `catch` method: if pokemon.speed > 100 then there is 100% chance of catch success.

> what changes do you have to make to the way we've been interacting with pokeball to make this new requirement work?


```python
# Cell for Exercise 3
```

### 🏋️ Exercise 4

In the above task, did you have to write any code to test that your new classes worked?! We will talk about that more at a later time, but for now, wrap any testing that you did into a new function called `test_classes` in the code cell below


```python
# Cell for Exercise 4
```
