<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/solutions/SOLN_P2_OOP_in_TicTacToe.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations <br> Project Part 2: Object Oriented Programming

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com
<br>

---

<br>

In part II of our tic-tac-toe and AI journey, we're going to take all the functions we've defined so far and make them object oriented!

<br>

---

<br>

<a name='top'></a>
  

<a name='x.0'></a>

## 2.0 Preparing Environment and Importing Data

[back to top](#top)

<a name='x.0.1'></a>

### 2.0.1 Import Packages

[back to top](#top)


```python
def visualize_board(board_values):
  """
  Visualizes the board during gameplay

  Parameters
  ----------
  board_values : list
    The values ('X', 'O', or ' ' at each board location)

  Returns
  -------
  None

  """
  print(
    "|{}|{}|{}|\n|{}|{}|{}|\n|{}|{}|{}|\n".format(*board_values)
    )
  
def init_board():
  """
  Initializes an empty board for the start of gameplay

  Parameters
  ----------
  None

  Returns
  -------
  board : dict
    a dictionary with keys 1-9 and single space (' ') string as values
  """
  return {1: ' ',
         2: ' ',
         3: ' ',
         4: ' ',
         5: ' ',
         6: ' ',
         7: ' ',
         8: ' ',
         9: ' ',}

# the keys on the game board where, if filled completely with X's or O's a 
# winner has occurred 
win_patterns = [[1,2,3], [4,5,6], [7,8,9],
                [1,4,7], [2,5,8], [3,6,9],
                [1,5,9], [7,5,3]]
                
def check_winning(board):
  """
  Checks if the game has a winner

  Parameters
  ----------
  board : dict
    the tictactoe board as a dictionary

  Returns
  -------
  win_statement : str
    defaults to an empty string if no winner. Otherwise 'X' Won! or 'O' Won!
  """
  for pattern in win_patterns:
    values = [board[i] for i in pattern] 
    if values == ['X', 'X', 'X']:
      return "'X' Won!"
    elif values == ['O', 'O', 'O']:
      return "'O' Won!"

  return ''

def tic_tac_toe():
  """
  The tictactoe game engine. Runs the while loop that handles the game

  Parameters
  ----------
  None

  Returns
  -------
  None
  """
  print("'X' will go first!")
  board = init_board()
  while True:
    for player in (['X', 'O']):  
      visualize_board(board.values())
      move = int(input("{}, what's your move?".format(player)))
      if board[move] != ' ':
        move = input("{}, that position is already taken! "\
                    "What's your move?".format(player))
      else:
        board[move] = player
      winner = check_winning(board)
      if winner == '':
        continue
      else:
        print(winner)
        break
    if winner != '':
      break
```

<a name='x.1'></a>

## 2.1 OOP

[back to top](#top)

Notice how we have so many functions with calls to our main object `board`. This is one flag that should notify us: "hey, this might be a good place to switch from functions, to an object with methods!"

Let's try to organize this into a more object oriented scheme.


### 🙋 Question 1


We'll also want to write a function that does _what_

> hint: what is our `check_winning` function missing?

### 2.1.1 Thinking in Objects

It's helpful to think of how our code can be divided into useful segments that can then be extended, interfaced, used elsewhere, etc.

It's just like we had when we were playing with our Poke ball and pokemon objects. In that case, it made sense to make two separate objects one for pokemon and one for Poke balls.

### 🙋 Question 2

Can you think of any way that would make sense to divide our code into objects? I can think of two.

### 2.1.2 class TicTacToe

the first object will be one that handles our board and all of its methods and attributes. In this class called `TicTacToe` we will have the attributes:
  * `winner`, initialized as an empty string, and updates at the conclusion of a game with 'X', 'O', or 'Stalemate'
  * `start_player` initialized as an empty string and updates at the start of a game with 'X' or 'O'
  * `board` initialized as our empty board dictionary
  * `win_patterns` the list of lists containing the winning patterns of the game

and then we will have three different methods, each of which takes one parameter, `self`

* `visualize_board`
* `check_winning`
* `check_stalemate` : a new function. Returns "It's a stalemate!" and sets `self.winner = "Stalemate"` (note there is a bug 🐞 in the way this is currently written, we will move along for now and work through a debugging tutorial later on!)

#### Q1 Attributes of TicTacToe

Within class TicTacToe, define the attributes described above


```python
class TicTacToe:
  # create winner and start_player parameters with default values as empty 
  # strings within __init__
  def __init__(self, winner='', start_player=''):
    ##################################
    ########### Attributes ###########
    ##################################
    # set self.winner and self.start_player with the parameters from __init__
    self.winner = winner
    self.start_player = start_player
    # set self.board as a dictionary with ' ' as values and 1-9 as keys
    self.board = {1: ' ',
                  2: ' ',
                  3: ' ',
                  4: ' ',
                  5: ' ',
                  6: ' ',
                  7: ' ',
                  8: ' ',
                  9: ' ',}
    # set self.win_patterns with the 8 winning patterns (a list of lists)
    self.win_patterns = [[1,2,3], [4,5,6], [7,8,9],
                [1,4,7], [2,5,8], [3,6,9],
                [1,5,9], [7,5,3]]
```

#### Q2 Methods of TicTacToe

Now we will define the methods of `TicTacToe`. Paste your attributes from the above cell, into the bellow cell so that your changes carry over.


```python
class TicTacToe:
  # create winner and start_player parameters with default values as empty 
  # strings within __init__
  def __init__(self, winner='', start_player=''):
    ##################################
    ########### Attributes ###########
    ##################################
    # set self.winner and self.start_player with the parameters from __init__
    self.winner = winner
    self.start_player = start_player
    # set self.board as a dictionary with ' ' as values and 1-9 as keys
    self.board = {1: ' ',
                  2: ' ',
                  3: ' ',
                  4: ' ',
                  5: ' ',
                  6: ' ',
                  7: ' ',
                  8: ' ',
                  9: ' ',}
    # set self.win_patterns with the 8 winning patterns (a list of lists)
    self.win_patterns = [[1,2,3], [4,5,6], [7,8,9],
                [1,4,7], [2,5,8], [3,6,9],
                [1,5,9], [7,5,3]]

  ###############################
  ########### METHODS ###########
  ###############################    

  # the other functions are now passed self

  # define visualize_board (you will probably need to change "board" to 
  # self.board.values() depending on how your visualize_board() function is
  # written)
  def visualize_board(self):
    """
    Visualizes the board during gameplay

    Parameters
    ----------
    board_values : list
      The values ('X', 'O', or ' ' at each board location)

    Returns
    -------
    None

    """
    print(
      "|{}|{}|{}|\n|{}|{}|{}|\n|{}|{}|{}|\n".format(*self.board.values())
      )
    
  def init_board(self):
    """
    Initializes an empty board for the start of gameplay

    Parameters
    ----------
    None

    Returns
    -------
    board : dict
      a dictionary with keys 1-9 and single space (' ') string as values
    """
    self.board = {1: ' ',
          2: ' ',
          3: ' ',
          4: ' ',
          5: ' ',
          6: ' ',
          7: ' ',
          8: ' ',
          9: ' ',}
                  
  # define check_winning and make sure win_patterns,
  # board, and winner are accessed via the self within the function call.
  # Update the attribute self.winner with the appropriate winner in the function
  def check_winning(self):
    """
    Checks if the game has a winner

    Parameters
    ----------
    board : dict
      the tictactoe board as a dictionary

    Returns
    -------
    win_statement : str
      defaults to an empty string if no winner. Otherwise 'X' Won! or 'O' Won!
    """
    for pattern in self.win_patterns:
      values = [self.board[i] for i in pattern] 
      if values == ['X', 'X', 'X']:
        self.winner = 'X'
        return "'X' Won!"
      elif values == ['O', 'O', 'O']:
        self.winner = 'O'
        return "'O' Won!"
    return ''

  # here the definition of check_stalemate is given
  def check_stalemate(self):
    if ' ' not in self.board.values():
      self.winner = 'Stalemate'
      return "It's a stalemate!"
```

### 2.1.3 The Game Engine (just a function for now)

Next we'll create a function that runs game play using TicTacToe as an object that it passes around. I've already done the heavy lifting of replacing references to attributes (board, win_patterns) and methods (visualize_board, check_winning) to pass through the `TicTacToe` object. I also added the option for the user to quit the game by typing in `'q'` to the input line if they would like.

#### Q3 Add Condition for Stalemate


```python
def play_game():
  print("'X' will go first!")
  tic_tac_toe = TicTacToe()
  while True:
    for player in (['X', 'O']):  
      tic_tac_toe.visualize_board()
      move = input("{}, what's your move?".format(player))

      ####################################################################
      # we're going to allow the user to quit the game from the input line
      ####################################################################
      if move in ['q', 'quit']:
        tic_tac_toe.winner = 'F'
        print('quiting the game')
        break

      move = int(move)
      if tic_tac_toe.board[move] != ' ':
        while True:
          move = input("{}, that position is already taken! "\
                      "What's your move?".format(player))  
          move = int(move)            
          if tic_tac_toe.board[move] != ' ':
            continue
          else:
            break
            
      tic_tac_toe.board[move] = player

      # the winner varaible will now be checked within the board object
      tic_tac_toe.check_winning()
      
      ##############################
      # CALL check_stalemate() BELOW
      ##############################
      tic_tac_toe.check_stalemate()

      if tic_tac_toe.winner == '':
        continue

      ##########################################################################
      # write an elif statement that checks if self.winner is 'Stalemate' and
      # subsequently visualizes the board and breaks out of the while loop
      # also print out check_stalemate so the returned string is shown to the 
      # user
      ##########################################################################
      else:
        print(tic_tac_toe.check_winning())
        tic_tac_toe.visualize_board()
        break
    if tic_tac_toe.winner != '':
      break
```

Let's test our new module


```python
play_game()
```

    'X' will go first!
    | | | |
    | | | |
    | | | |
    
    X, what's your move?1
    |X| | |
    | | | |
    | | | |
    
    O, what's your move?2
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
    |X|O| |
    |X|O| |
    |X| | |
    

