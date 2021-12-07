<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/project/P3_Random_TicTacToe_Agents.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Project Part 3: Building Agents (Random AI Agent)

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com
<br>

---

<br>

In part III of our tic-tac-toe and AI journey, we're going to create NPCs for our game!

We will need to pull in our OOP work from the previous project notebook. Be sure to copy your code and run those cells below before we get started on section 3

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

Notice how we have so many functions with calls to our main object `board`. Let's try to organize this into a more object oriented scheme.

We'll also want to write a function that recognizes when a stalemate has been reached!

### 2.1.1 Thinking in Objects

It's helpful to think of how our code can be divided into useful segments that can then be extended, interfaced, used elsewhere, etc.

It's just like we had when we were playing with our pokeball and pokemon objects. In that case, it made sense to make two separate objects one for pokemon and one for pokeballs.

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
* `check_stalemate` : a new function. Returns "It's a stalemate!" and sets `self.winner = "Stalemate"` (note there is a bug in the way this is currently written, we will move along for now and work through a debugging tutorial later this week!)

#### Q1 Attributes of TicTacToe

Within class TicTacToe, define the attributes described above


```python
class TicTacToe:
  # create winner and start_player parameters with default values as empty 
  # strings within __init__
  def __init__(self):
    pass
    ##################################
    ########### Attributes ###########
    ##################################
    # set self.winner and self.start_player with the parameters from __init__

    # set self.board as a dictionary with ' ' as values and 1-9 as keys
 
    # set self.win_patterns with the 8 winning patterns (a list of lists)
         
```

#### Q2 Methods of TicTacToe

Here now we will define the methods of `TicTacToe`. Paste your attributes from the above cell, into the bellow cell so that your changes carry over.


```python
class TicTacToe:
  # create winner and start_player parameters with default values as empty 
  # strings within __init__
  def __init__(self):
    pass # remove after completing
  ##################################
  ########### Attributes ###########
  ##################################
    # set self.winner and self.start_player with the parameters from __init__

    # set self.board as a dictionary with ' ' as values and 1-9 as keys
 
    # set self.win_patterns with the 8 winning patterns (a list of lists)

  ###############################
  ########### METHODS ###########
  ###############################    

  # the other functions are now passed self

  # define visualize_board and update all internal calls to the board
  # object with self.board (and maybe self.board.values() depending on how your
  # visualize_board function is written)

  # define check_winning and similarly update all calls to win_patterns,
  # board, and winner to be accessed via the self. Be sure to update the 
  # attribute self.winner with the appropriate winner in the function

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

      if tic_tac_toe.winner == '':
        clear_output()
        continue

      ##########################################################################
      # write an elif statement that checks if self.winner is 'Stalemate' and
      # subsequently visualizes the board and breaks out of the while loop
      # also print out check_stalemante so the returned string is shown to the 
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

## 3.1 Creating an Agent

we'll start by creating an agent that just selects a random playing number

### Q4 Use a Random Number Generator

import the random library. Use it to randomly generate numbers 1-9 (inclusive? yep, inclusive. We're going to use this to select the keys in our board dictionary! 📚)


```python
# cell for Q4
# generates a random number 1-9
```

### Q5 Play a Valid Move

Nice, now that we are generating random numbers 1-9. We need to check if a random number that's been drawn, is a valid move. We're going to do this with... yeah that's right you guessed it, a `while loop`


```python
while True:
  # generate a random number 1-9 and set it equalt to the variable name <move>
  if # if the move is invalid then...
    continue
  else: # otherwise the move is valid and we can exit the loop!
    break
```

Wow and that's it, we just need to wrap it in our `play_game` function. Before we do that, we need to handle the ability of our engine to perform 1 and 2 player games. In order to do this, I'm going to introduce a new object to organize how the game is setup. I'm going to call it `player_meta`

```
player_meta = {'first': {'label': 'X',
                            'type': 'human'}, 
              'second': {'label': 'O',
                            'type': 'human'}}
```




### Q6 Game Setup and Random AI

I will skeleton out where the `input` questions need to be sent to the user, it is your task to determine how the `player_meta` dictionary should subsequently be updated!


```python
def play_game():
  tic_tac_toe = TicTacToe()

  ##############################################################################
  ################################# GAME SETUP #################################
  ##############################################################################
  players = int(input("How many Players? (type 0, 1, or 2)"))
  player_meta = {'first': {'label': 'X',
                                'type': 'human'}, 
                 'second': {'label': 'O',
                                'type': 'human'}}
  if players == 1:
    first = input("who will go first? (X, (AI), or O (Player))")
    if first == 'O':
      ### UPDATE PLAYER_META HERE ###

    else:
      ### UPDATE PLAYER_META HERE ### 

  elif players == 0: # insert wargames quote
    first = random.choice(['X', 'O'])
    if first == 'O':
      ### UPDATE PLAYER_META HERE ###
                             
    else:
      ### UPDATE PLAYER_META HERE ### 
  
  ##############################################################################
  ################################# GAME PLAY ##################################
  ##############################################################################
  while True:
    # in the following line, instead of alternating between 'X' and 'O', we now
    # alternate between the first and second player, which has the associated
    # metadata of label (X or O) and type (ai or human). 
    for player in ['first', 'second']:  
      tic_tac_toe.visualize_board()

      # we set the player_label and player_type according to which player is 
      # playing in this round
      player_label = player_meta[player]['label']
      player_type = player_meta[player]['type']

      if player_type == 'human':
        move = input("{}, what's your move?".format(player_label))
        # we're going to allow the user to quit the game from the input line
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

      ##########################################################################
      ################### YOUR RANDOM AI AGENT CODE GOES HERE ##################
      ##########################################################################
      else:
        pass # delete this line when finished
      
      tic_tac_toe.board[move] = player_label
      
      # the winner varaible will now be check within the board object
      tic_tac_toe.check_winning()
      tic_tac_toe.check_stalemate()
      if tic_tac_toe.winner == '':
        # clear_output()
        continue

      elif tic_tac_toe.winner == 'Stalemate':
        print(tic_tac_toe.check_stalemate())
        tic_tac_toe.visualize_board()
        break

      else:
        print(tic_tac_toe.check_winning())
        tic_tac_toe.visualize_board()
        break
    if tic_tac_toe.winner != '':
      return tic_tac_toe
```


```python
play_game()
```

## 3.2 OOP and Inheritance

We'll want to reconfigure our code a bit to allow for AI to play AI. We'll use this feature to record a bunch of games and generate some data for analysis and, eventually, machine learning training.

We also want to run our game system without having any input from the user for our data generation. This is a good point to reconfigure our code. Notice how long and bulky `play_game` is getting.



### Q7 Inheriting from TicTacToe

To better organize our code, we're going to create a new class called `GameEngine` and we're going to inherit all the properties of `TicTacToe`. Do we remember how to do this? let's try it. The simplest way is the following:

```
class GameEngine(TicTacToe):
  def __init__(self):
    super().__init__()
```

Nice. Pretty clean, right? The only new thing here I want us to introduce is the parameter `setup` setup will determine whether we have the user enter fields to setup the `player_meta` dictionary, or whether we automatically set it up to allow ai vs ai and not require input from the user (which we will need if we are to run thousands of games automatically for data generation!!!)

```
class GameEngine(TicTacToe):
  def __init__(self, setup='auto'):
    super().__init__()
    self.setup = setup
```

notice the new parameter flag! We're going to use it in this next step. Be sure to:

1. access all methods/attributes via the `self`
2. use code you already wrote above for setting up and for the random AI agent


```python
class GameEngine(TicTacToe):
  def __init__(self, setup='auto'):
    super().__init__()
    self.setup = setup

  def setup_game(self):

    if self.setup == 'user':
      ##########################################################################
      ## YOUR GAME SETUP CODE FROM ABOVE GOES HERE, NOTE THE NEW IF STATEMENT ##
      ##########################################################################
      

    elif self.setup == 'auto':
      ##########################################################################
      ## THE NEW AUTOSETUP FEATURE THAT WILL ALLOW THE GAME TO RANDOMLY SETUP ##
      ##########################################################################
      first = random.choice(['X', 'O'])
      if first == 'O':
        self.start_player = 'O'
        self.player_meta = {'second': {'label': 'X',
                                  'type': 'ai'}, 
                      'first': {'label': 'O',
                                  'type': 'ai'}}                                
      else:
        self.start_player = 'X'
        self.player_meta = {'first': {'label': 'X',
                                  'type': 'ai'}, 
                      'second': {'label': 'O',
                                  'type': 'ai'}}

  def play_game(self):
    while True:
      for player in ['first', 'second']:  
        self.visualize_board()
        player_label = self.player_meta[player]['label']
        player_type = self.player_meta[player]['type']

        if player_type == 'human':
          move = input("{}, what's your move?".format(player_label))
          # we're going to allow the user to quit the game from the input line
          if move in ['q', 'quit']:
            self.winner = 'F'
            print('quiting the game')
            break

          move = int(move)
          if self.board[move] != ' ':
            while True:
              move = input("{}, that position is already taken! "\
                          "What's your move?".format(player))  
              move = int(move)            
              if self.board[move] != ' ':
                continue
              else:
                break

        ########################################################################
        ################### YOUR RANDOM AI AGENT CODE GOES HERE ################
        ########################################################################
        else:
          pass # delete this line when finished

        self.board[move] = player_label

        # the winner varaible will now be check within the board object
        self.check_winning()
        self.check_stalemate()

        if self.winner == '':
          # clear_output()
          continue

        elif self.winner == 'Stalemate':
          print(self.check_stalemate())
          self.visualize_board()
          break

        else:
          print(self.check_winning())
          self.visualize_board()
          break
      if self.winner != '':
        return self
```

And now we can practice using our Engine:


```python
game = GameEngine()
game.setup_game()
board = game.play_game()
```

    | | | |
    | | | |
    | | | |
    
    | | | |
    | |X| |
    | | | |
    
    | | | |
    | |X| |
    | |O| |
    
    | |X| |
    | |X| |
    | |O| |
    
    | |X|O|
    | |X| |
    | |O| |
    
    | |X|O|
    | |X| |
    |X|O| |
    
    | |X|O|
    | |X| |
    |X|O|O|
    
    |X|X|O|
    | |X| |
    |X|O|O|
    
    |X|X|O|
    |O|X| |
    |X|O|O|
    
    It's a stalemate!
    |X|X|O|
    |O|X|X|
    |X|O|O|
    


### Q8 Test the Engine

Check that we can still use the `GameEngine` to play a human v human or human v AI game of tic tac toe:


```python
game = GameEngine(setup='user')
game.setup_game()
```

    How many Players? (type 0, 1, or 2)1
    who will go first? (X, (AI), or O (Player))O



```python
game.play_game()
```

    | | | |
    | | | |
    | | | |
    
    O, what's your move?1
    |O| | |
    | | | |
    | | | |
    
    |O| |X|
    | | | |
    | | | |
    
    O, what's your move?4
    |O| |X|
    |O| | |
    | | | |
    
    |O| |X|
    |O| | |
    | | |X|
    
    O, what's your move?7
    'O' Won!
    |O| |X|
    |O| | |
    |O| |X|
    





    <__main__.GameEngine at 0x7f71d3713050>



## 3.3 Simulating Data

We will now want to run our game thousands of times to collect data for building our AI agents. The following code should run without any input from the user:

```
game = GameEngine()
game.setup_game()
board = game.play_game()
```


```python
game = GameEngine()
game.setup_game()
board = game.play_game()
```

    | | | |
    | | | |
    | | | |
    
    | | | |
    | | | |
    | | |O|
    
    | | | |
    | | |X|
    | | |O|
    
    | |O| |
    | | |X|
    | | |O|
    
    | |O| |
    |X| |X|
    | | |O|
    
    |O|O| |
    |X| |X|
    | | |O|
    
    |O|O| |
    |X| |X|
    | |X|O|
    
    'O' Won!
    |O|O| |
    |X|O|X|
    | |X|O|
    


### Q9 Record 1000 Games

Write a for loop that creates 1000 games and saves the game data in the following dictionary format, replacing `<THE GAME NUMBER>` with whatever index you are using in the for loop:

```
data = {}
data['game {}'.format(<THE GAME NUMBER>)] = {'board': board.board,
          'winner': board.winner,
          'starting player': board.start_player}
```


```python
# Cell for Q9
```


```python
import json
with open('data.txt', 'w') as outfile:
    json.dump(data, outfile)
```


```python

```
