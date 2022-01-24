<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/solutions/SOLN_P4_Debugging_TicTacToe_Agents.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Project Part 4: Debugging

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com
<br>

---

<br>

We're going to debug our tictactoe game.  

<br>

---

<a name='x.0'></a>

## 4.0 Preparing Environment and Importing Data

[back to top](#top)

<a name='x.0.1'></a>

### 4.0.1 Import Packages

[back to top](#top)


```python
import random
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

class TicTacToe:
  # can preset winner and starting player
  def __init__(self, winner='', start_player=''): 
    self.winner = winner
    self.start_player = start_player
    self.board = {1: ' ',
         2: ' ',
         3: ' ',
         4: ' ',
         5: ' ',
         6: ' ',
         7: ' ',
         8: ' ',
         9: ' ',}
    self.win_patterns = [[1,2,3], [4,5,6], [7,8,9],
                [1,4,7], [2,5,8], [3,6,9],
                [1,5,9], [7,5,3]]
         
  # the other functions are now passed self
  def visualize_board(self):
    print(
      "|{}|{}|{}|\n|{}|{}|{}|\n|{}|{}|{}|\n".format(*self.board.values())
      )

  def check_winning(self):
    for pattern in self.win_patterns:
      values = [self.board[i] for i in pattern] 
      if values == ['X', 'X', 'X']:
        self.winner = 'X' # we update the winner status
        return "'X' Won!"
      elif values == ['O', 'O', 'O']:
        self.winner = 'O'
        return "'O' Won!"
    return ''

  def check_stalemate(self):
    if ' ' not in self.board.values():
      self.winner = 'Stalemate'
      return "It's a stalemate!"

class GameEngine(TicTacToe):
  def __init__(self, setup='auto'):
    super().__init__()
    self.setup = setup

  def setup_game(self):

    if self.setup == 'user':
      players = int(input("How many Players? (type 0, 1, or 2)"))
      self.player_meta = {'first': {'label': 'X',
                                    'type': 'ai'}, 
                    'second': {'label': 'O',
                                    'type': 'human'}}
      if players == 1:
        first = input("who will go first? (X, (AI), or O (Player))")
        if first == 'O':
          self.player_meta = {'second': {'label': 'X',
                                    'type': 'ai'}, 
                        'first': {'label': 'O',
                                    'type': 'human'}}
        else:
          self.player_meta = {'first': {'label': 'X',
                                    'type': 'ai'}, 
                        'second': {'label': 'O',
                                    'type': 'human'}}

      elif players == 0:
        first = random.choice(['X', 'O'])
        if first == 'O':
          self.player_meta = {'second': {'label': 'X',
                                    'type': 'ai'}, 
                        'first': {'label': 'O',
                                    'type': 'ai'}}                                
        else:
          self.player_meta = {'first': {'label': 'X',
                                    'type': 'ai'}, 
                        'second': {'label': 'O',
                                    'type': 'ai'}}

    elif self.setup == 'auto':
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

        else:
          while True:
            move = random.randint(1,9)
            if self.board[move] != ' ':
              continue
              print('test')
            else:
              break

        self.board[move] = player_label

        # the winner varaible will now be check within the board object
        self.check_winning()
        self.check_stalemate()

        if self.winner == '':
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

<a name='x.0.1'></a>

### 4.0.2 Load Dataset

[back to top](#top)

## 4.1 It's a Bug!

Your friend is developing this tictactoe game in python, and they notice something peculiar; the game engine doesn't correctly identify a winning move if it's the last game square to be played, rather, it counts it as a tie! Help your friend debug their code!

### Q1 Make the error repeatable

In order to help with the debugging process, your friend realizes they need to show you the actual error in question. The problem, however, is that the random agent player is, well, random! To overcome this, they tell you to "seed the random number generator with the value 12"

In the cell below, seed the random number generator using the number 12. Then create a `GameEngine` object with `setup='auto'`. Call the methods `setup_game()` and `play_game()`. Check to see that your output looks like the following:

```
It's a stalemate!
|X|O|X|
|X|O|O|
|O|O|X|
```


```python
# Cell for Q1
random.seed(12)
game = GameEngine(setup='auto')
game.setup_game()
game.play_game()
```

    | | | |
    | | | |
    | | | |
    
    | | | |
    | |O| |
    | | | |
    
    | | | |
    | |O| |
    | | |X|
    
    | | | |
    | |O|O|
    | | |X|
    
    | | |X|
    | |O|O|
    | | |X|
    
    | | |X|
    | |O|O|
    |O| |X|
    
    |X| |X|
    | |O|O|
    |O| |X|
    
    |X| |X|
    | |O|O|
    |O|O|X|
    
    |X| |X|
    |X|O|O|
    |O|O|X|
    
    It's a stalemate!
    |X|O|X|
    |X|O|O|
    |O|O|X|
    





    <__main__.GameEngine at 0x7f0692cda450>



### Q2 Check the Relevant Attributes and Function/Method Calls

Now that we have made the error repeatable, let's check the internal states of the game object. Check the `winner` attribute as well as the methods `check_stalemate()` and `check_winning()`. You should get something like the following:

```
>>> game.winner
'O'

>>> game.check_stalemate()
'It's a stalemate!'

>>> game.check_winning()
''O' Won!'
```


```python
# Cell for Q2
print(game.winner)
print(game.check_stalemate())
print(game.winner)
print(game.check_winning())
print(game.winner)
```

    Stalemate
    It's a stalemate!
    Stalemate
    'O' Won!
    O


### Q3 Make Changes to `check_stalemate()`

We think we've zeroed-in on our problem! After running `check_stalemate()` on our board where it is evident that 'O' won, we find that our method returns 'It's a stalemate!' and furthermore, adjusts the `winner` attribute to be `stalemate`. We need to adjust this method so that it properly assess a stalemate ONLY when there is no winner. Make your changes below and re-run our repeatable code from Q1


```python
############################################################
##################### MAKE YOUR EDITS ######################
############################################################
import random
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

class TicTacToe:
  # can preset winner and starting player
  def __init__(self, winner='', start_player=''): 
    self.winner = winner
    self.start_player = start_player
    self.board = {1: ' ',
         2: ' ',
         3: ' ',
         4: ' ',
         5: ' ',
         6: ' ',
         7: ' ',
         8: ' ',
         9: ' ',}
    self.win_patterns = [[1,2,3], [4,5,6], [7,8,9],
                [1,4,7], [2,5,8], [3,6,9],
                [1,5,9], [7,5,3]]
         
  # the other functions are now passed self
  def visualize_board(self):
    print(
      "|{}|{}|{}|\n|{}|{}|{}|\n|{}|{}|{}|\n".format(*self.board.values())
      )

  def check_winning(self):
    for pattern in self.win_patterns:
      values = [self.board[i] for i in pattern] 
      if values == ['X', 'X', 'X']:
        self.winner = 'X' # we update the winner status
        return "'X' Won!"
      elif values == ['O', 'O', 'O']:
        self.winner = 'O'
        return "'O' Won!"
    return ''

  def check_stalemate(self):
    if (' ' not in self.board.values()) and self.check_winning() == '':
      self.winner = 'Stalemate'
      return "It's a stalemate!"

class GameEngine(TicTacToe):
  def __init__(self, setup='auto'):
    super().__init__()
    self.setup = setup

  def setup_game(self):

    if self.setup == 'user':
      players = int(input("How many Players? (type 0, 1, or 2)"))
      self.player_meta = {'first': {'label': 'X',
                                    'type': 'ai'}, 
                    'second': {'label': 'O',
                                    'type': 'human'}}
      if players == 1:
        first = input("who will go first? (X, (AI), or O (Player))")
        if first == 'O':
          self.player_meta = {'second': {'label': 'X',
                                    'type': 'ai'}, 
                        'first': {'label': 'O',
                                    'type': 'human'}}
        else:
          self.player_meta = {'first': {'label': 'X',
                                    'type': 'ai'}, 
                        'second': {'label': 'O',
                                    'type': 'human'}}

      elif players == 0:
        first = random.choice(['X', 'O'])
        if first == 'O':
          self.player_meta = {'second': {'label': 'X',
                                    'type': 'ai'}, 
                        'first': {'label': 'O',
                                    'type': 'ai'}}                                
        else:
          self.player_meta = {'first': {'label': 'X',
                                    'type': 'ai'}, 
                        'second': {'label': 'O',
                                    'type': 'ai'}}

    elif self.setup == 'auto':
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

        else:
          while True:
            move = random.randint(1,9)
            if self.board[move] != ' ':
              continue
              print('test')
            else:
              break

        self.board[move] = player_label

        # the winner varaible will now be check within the board object
        self.check_winning()
        self.check_stalemate()

        if self.winner == '':
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

Test your changes below!


```python
random.seed(12)
game = GameEngine(setup='auto')
game.setup_game()
game.play_game()
```

    | | | |
    | | | |
    | | | |
    
    | | | |
    | |O| |
    | | | |
    
    | | | |
    | |O| |
    | | |X|
    
    | | | |
    | |O|O|
    | | |X|
    
    | | |X|
    | |O|O|
    | | |X|
    
    | | |X|
    | |O|O|
    |O| |X|
    
    |X| |X|
    | |O|O|
    |O| |X|
    
    |X| |X|
    | |O|O|
    |O|O|X|
    
    |X| |X|
    |X|O|O|
    |O|O|X|
    
    'O' Won!
    |X|O|X|
    |X|O|O|
    |O|O|X|
    





    <__main__.GameEngine at 0x7f0692c4d790>


