<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/project/P1_Building_TicTacToe_in_Python.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Project Part 1: Building the Game Tic-Tac-Toe

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com
<br>

---

<br>

In this project notebook we'll be laying the foundations of our Tic Tac Toe game!

In order to complete this notebook you will have had to have covered session 1-3 where we discuss python, conditionals and flow, and functions.

<br>

---

<a name='x.1'></a>

## 1.2 The Game

[back to top](#top)

### 1.2.1 Defining and Visualizing the Board

#### 1.2.1.1 Q1

First we need to define our board object (object in the loose sense for now!). This will hold the _memory_ of where our current player pieces are.

Say we eventually want to place in every board position a string variable, `'X'` or `'O'`. How would we represent the board? Also, how do we represent it in the least complex space possible, i.e. a list?

Example output:
```
[' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
```



```python
# cell for Q1
```




    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']



#### 1.2.1.2 Q2

We would like to be able to visualize where our players have executed onto the board. How can we use what we've learned about print functions to visualize and empty board?

* hint: use `|`, `\n`, `.format()`, and unpack our board elements using an asteric (`*board`) with the print function.

Example output:

```
| | | |
| | | |
| | | |
```


```python
# Cell for Q2
```

    | | | |
    | | | |
    | | | |
    


#### 1.2.1.3 Q3

After you've created your print function that take the board as an input. Test it out after filling your board with some `X's` and `O's`

Example output:

```
|X| | |
| |O| |
| | | |
```


```python
# Cell for Q3
```

    |X| | |
    | |O| |
    | | | |
    


#### 1.2.1.4 Q4

Now, if that looks good, wrap the print function in a function called `visualize_board` that take the variable `board` as a parameter.

Example:
```
visualize_board(board)
|X| | |
| |O| |
| | | |
```


```python
# Cell for Q4
```


```python
visualize_board(board)
```

    |X| | |
    | |O| |
    | | | |
    


#### 1.2.1.5 Q5

It may be more useful to organize our board into a dictionary. Recreate your board variable now using 1-9 as the keys and empty strings `' '` as the values. What do you now need to feed into your function `visualize_board` for it to output the same result?

* hint: think of an attribute of the dictionary you just created.


```python
# Cell for Q5
```

#### 1.2.1.6 Q6

Lastly, write a function called `init_board` that takes no parameters and returns the empty board dictionary


```python
# Cell for Q6
```

### 1.2.2 Checking for a Winner

#### 1.2.2.1 Q1

We will need a way to check if either player has won the game. Write down all the winning patterns using our board representation where places are numbered 1-9. Store these patterns in a list of lists called `win_patterns`

* hint: You should identify 8 winning patterns


```python
# Cell for Q1
```

#### 1.2.2.2 Q2

Next, we will need to write a function that checks if there is a winning pattern on our board (i.e. all X's or all O's are in the indicated places on the board. But let's build the conditionals and logic methodically and not just jump into writing a for loop!

First, access the first element of `win_patterns` and set it equal to a variable called `pattern`

Example output:
```
[1, 2, 3]
```


```python
# Cell for Q2
```




    [1, 2, 3]



#### 1.2.2.3 Q3

Use the board dictionary to get the board values at the positions stored in `pattern`

Example Output:
```
['X', ' ', ' ']
```


```python
# Cell for Q3
```




    ['X', ' ', ' ']



#### 1.2.2.4 Q4

Now check for whether they contain 3 X's or 3 O's. Fill those spaces with all 'X's or all 'O's to check that your conditional is working properly. Your output should be a `boolean`: `True` or `False`


```python
# Cell for Q4
```




    True



#### 1.2.2.5 Q5

Now we're ready to wrap this in a for loop. Loop through every `pattern` in `win_patterns` and evaluate with your conditional. If 'X' wins then print out `'X' Won!` if 'O' wins then print out `'O' Won!`

Example output:
```
'O' Won!
```


```python
# Cell for Q5
```

    'O' Won!


#### 1.2.2.6 Q6

Once we've detected a winner, there's no need to continue the for-loop. Put breaks in your loop so that it exits after detecting a winner


```python
# Cell for Q6
```

    'O' Won!


#### 1.2.2.7 Q7

let's wrap this in a function. Call your function `check_winning` and have it take `board` as an input parameter. Make what were previously your print statements into returns of their respective strings. Return an empty string if there is no winner detected.


```python
# Cell for Q7
```

Check that your code works using a board that has either 'X' or 'O' as a winner.


```python
# Cell for Q7
```




    "'X' Won!"



### 1.2.3 Input from the User

We can get input from the user like so:


```python
move = input()
```

    1


#### 1.2.3.1 Q1

Let's ask the user for their move and create some logic to embed this into the board. First write your string that will be presented to the user, asking them to play their move. 


```python
player = 'X'
board = init_board()
visualize_board(board.values())

# WRITE YOUR STRING DOWN HERE
move = input("{}, YOUR STRING".format(player))
```

    | | | |
    | | | |
    | | | |
    
    X, YOUR STRING1


#### 1.2.3.2 Q2

Great. Now we need to check that the position is actually available to the user, if not, ask the user for a different move; otherwise update the board and ask for the next move from the next player

* hint: you will need to convert your input into an `int` to be able to use it as a key in the `board` dictionary


```python
### COPY YOUR CODE FROM ABOVE ###

### END COPY ###

### WRITE YOUR CONDITIONAL BELOW
# note: you will need to think of both the conditional, as well as a method
# to continue asking the player to make a move if the condition is not met
# what kind of loop does this make you think of?

while True:
  if # your condition
    # your code
  else:
    board[move] = player
    break

### END YOUR CODE
winner = check_winning(board)
```

    | | | |
    | | | |
    | | | |
    
    X, YOUR STRING1


### 1.2.4 Creating a Game Handler



#### 1.2.4.1 Q1

We now need some code to orchestrate game play. It will decide who's turn it is, allow players to make moves, and detect when the game is over.

Fill in the blanks in the code cell below to complete the game handler:


```python
print("'X' will go first!")
board = init_board()

# initiate a while loop
while True:

  # create a for loop that iterates between X and O and stores this in the 
  # variable name `player`
  for player in (['X', 'O']):  

    # visualize the board
    visualize_board(board.values())

    ### PASTE YOUR CODE FROM ABOVE FOR ASKING THE PLAYER FOR THEIR MOVE ###

    ### END PASTE ###

    ### WRITE THE LOGIC TO BREAK OUT OF THE WHILE LOOP BELOW ###
    # check if there is a winner using check_winning
    # if the return from check_winning is an empty string,
    # then continue the while loop, otherwise break the while loop and print 
    # the name of the winner (X or O)
    winner = check_winning(board)
    if # your condition
      # your code
    else:
      # your code
      
  # break out of outer loop
  if winner != '':
    break
```

    'X' will go first!
    | | | |
    | | | |
    | | | |
    
    X, what's your move?1
    |X| | |
    | | | |
    | | | |
    
    O, what's your move?1
    O, that position is already taken! What's your move?1
    O, that position is already taken! What's your move?1
    O, that position is already taken! What's your move?2
    |X|O| |
    | | | |
    | | | |
    
    X, what's your move?4
    |X|O| |
    |X| | |
    | | | |
    
    O, what's your move?5
    |X|O| |
    |X|O| |
    | | | |
    
    X, what's your move?7
    'X' Won!


## 1.3 In Summary

Paste all your working functions into the cell below for safe keeping:


```python

```
