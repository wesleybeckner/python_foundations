## Q1 Lists

You have N people standing in a line. Each person has a rank. They are standing in random order. We have to find the captains in the line. A person is a captain if their rank is higher than all the others standing to the right of them in the line. For example, if we are given the ranks as [3,7,5,2,4] then the captains are 7,5, and 4. How can you find all the captains in the line?


```python
ls = [3,7,5,2,4]
```


```python
import numpy as np
```


```python
def soln1(ls):
    captains = []
    for index, item in enumerate(ls):
        to_right = ls[index+1:]
        if (np.array([item]*len(to_right)) > np.array(to_right)).all():
            captains += [item]
    return captains
```


```python
%%timeit
soln1(ls)
```

    26.7 µs ± 2.05 µs per loop (mean ± std. dev. of 7 runs, 10,000 loops each)


* time complexity: \\(O(n^2)\\)
* space complexity: \\(O(1)\\)


```python
def soln2(ls):
    captains = []
    maxval = ls[-1]
    captains += [maxval]
    for item in ls[::-1]:
        if item > maxval:
            maxval = item
            captains += [maxval]
    return captains
```


```python
%%timeit
soln2(ls)
```

    593 ns ± 32.2 ns per loop (mean ± std. dev. of 7 runs, 1,000,000 loops each)


* time complexity: \\(O(n)\\)
* space complexity: \\(O(1)\\)

## Q2 Linked Lists

Create a linked list class in Python


```python
#Create a Node class
class Node: 
  
    def __init__(self, key):

        #Assign the key to the node 
        self.key = key

        #Mark default as Null
        self.next = None 
  
class LinkedList: 
  
  # Initialize the head pointer to None 
  def __init__(self): 
    self.head = None
  
  #Print the list till all elements are not processed
  def getlist(self): 
    process = self.head 
    while (process): 
      print(process.key) 
      process = process.next
  
#Declare a list
flist = LinkedList() 

#Set the head pointer
flist.head = Node('A')

#Create more nodes
second = Node('B') 
third = Node('C') 

#Link first node to second
flist.head.next = second
#Link second node to third
second.next = third
  
#Print the complete list
flist.getlist() 
```

    A
    B
    C


## Q3 Stacks (LIFO)

You have been given n non-negative numbers. You have to find the first next greater element for each of these n numbers. For the last element, the next greater element is -1.

Consider the example list [5,34,4,46,2]

* 5: 34
* 34: 46
* 4: 46
* 46: -1
* 2: -1

Consider one more example [9,8,5,7,1]

* 9: -1
* 8: -1
* 5: 7
* 7: -1
* 1: -1


```python
ls[-2::-1]
```




    [46, 4, 34, 5]




```python
ls = [5, 34, 4, 46, 2]
ans = []
for idx, item in enumerate(ls):
    for item2 in ls[idx:]:
        if item2 > item:
            ans.append(item2)
            found = True
            break
    if found:
        found = False
        continue
    else:
        ans.append(-1)
ans
```




    [34, 46, 46, -1, -1]



* time complexity: \\(O(n^2)\\)

Solution 2: Using stack

We can use the stack to get an optimal solution to this problem. We can use stack and push the first element in the stack.

For the next element till the list is empty:

* Compare it with the top element of the stack.
* If it is smaller than the top element, push the element in the stack and move to the next element.
* If it is greater than the top element, keep popping the elements from the stack until it is empty or we get an element that is greater.
* Push the element in the stack.

In the end, if the stack is not empty, pop all elements and mark -1 as their next greater elements.


```python
ls = [5, 34, 4, 46, 2]
stack = []
stack += [ls[0]]
for item in ls[1:]:
    if item < stack[-1]:
        # basically you are going to collect stuff until 
        # you get an item that is bigger than whats in the stack
        pass
    elif item > stack[-1]:
        # now we start to dump, all the stuff in the stack
        # will be associated with this big stuff
        while (len(stack) != 0) and (item > stack[-1]):            
            print(stack[-1], item)          
            stack.pop()
           
    stack += [item]
    
# stuff that's left in the stack is associated with -1
while len(stack) != 0:
    print(stack[-1], -1)
    stack.pop()
```

    5 34
    4 46
    34 46
    2 -1
    46 -1


* time complexity: \\(O(n)\\)

## Q4 Queues (FIFO)

Implement a queue class in Python


```python
class Queue:
  def __init__(self):
    self.queue = []
  def enqueue(self,item):
    self.queue.insert(0,item)
  def dequeue(self):
    self.queue.pop()
  def isEmpty(self):
    return len(self.queue)==0
  def print_queue(self):
    print(self.queue)

#Perform Queue Operations
first_queue = Queue()
first_queue.enqueue('A')
first_queue.enqueue('B')
first_queue.dequeue()
first_queue.enqueue('C')
first_queue.enqueue('D')
first_queue.print_queue()
```

    ['D', 'C', 'B']


## Q5 Trees

Complete the traversals


```python
class TreeNode:
    #Initialize the tree
    def __init__(self, key):
        self.left = None
        self.right = None
        self.key = key

    def print_node_info(self):
        print(self.key)
        print(self.right)
        print(self.left)
    
    def pre_order(root): 
        """
        1. process the data
        2. process the left tree
        3. process the right tree
        ex: A, B, D, C
        """
        pass
    
    def in_order(root):
        """
        1. process the left tree
        2. process the data
        3. process the right tree
        ex: D, B, A, C
        """
        pass
    
    def post_order(root):
        """
        1. process the left tree
        2. process the right tree
        3. process the data
        ex: D, B, C, A
        """

# tree construction for examples in docstrings
A = TreeNode('A')
B = TreeNode('B')
C = TreeNode('C')
D = TreeNode('D')

A.left = B
A.right = C 
B.left = D

A.print_node_info()
```

    A
    <__main__.TreeNode object at 0x7f7a67634280>
    <__main__.TreeNode object at 0x7f7a67634b50>


## Q6 Hash Tables

You and your friends are conducting a survey in Pewter City to find out the citizens' favorite pokemon. Your friends split into teams that cover different parts of the city, take the unique identification of each person, and record their choice. In the end you want to know who the most popular pokemon is overall.

There is some possibility that the same person could be interviewed by two of your team members, and their response recorded twice. How would you make sure that their response will be counted only once?


```python
# citizen not repeated
data_test_1 = [('Abhishek','Pikachu'),('Ankita','Charmander'),('John','Charmander'),('Nick','Squirtle')]

# citizen repeated
data_test_2 = [('Abhishek','Pikachu'),('Ankita','Charmander'),('John','Charmander'),('Nick','Squirtle'),('John','Charmander'),('Nick','Squirtle')]
```


```python
def get_best(data):
    survey_hash = dict(data) # duplicates drop due to hash
    final_counts = dict()
    for key, value in survey_hash.items():
        if value in final_counts:
            final_counts[value] += 1
        else:
            final_counts[value] = 1
    return max(final_counts, key=final_counts.get)
```


```python
get_best(data_test_2)
```




    'Charmander'


