<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/extras/X4_Algorithms.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations <br> X4: Algorithms

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com

---

<br>

This notebook covers common algorithms throughout computer programming

<br>

---


## Greedy

You were given a list of jobs with start time and end times. You can only do one job at any time. To complete a job, you have to start it at the start time and work until completion. What is the maximum amount of jobs that can be completed? (Activity Selection)


```python
data1 = [(1,2),(5,7),(3,4),(0,6),(5,9),(8,9)]
data2 = [(20,30),(10,15),(12,30)]
```


```python
def greedy_get_max(data):
    data = sorted(data, key= lambda x: x[1])
    jobend = data[0][1]
    jobs = 1
    for start, end in data[1:]:
        if start > jobend:
            jobs += 1
            jobend = start
    return jobs
```


```python
greedy_get_max(data1)
```




    4




```python
greedy_get_max(data2)
```




    2



You have been given n items. The weights and values of these n items are also given. You must fill a knapsack of capacity W
W
 in such a way that it contains the maximum value. Items can be added in the knapsack fractionally. If the item’s fraction is added, only that fraction value will be taken in the final value calculation. (Fractional Knapsack)

Consider these items: [(60,10), (120, 30), (100,20)]. The first item of each tuple is the value of the item. The second item is its weight. We have to fill a knapsack with a capacity of 50.


```python
data = [(60,10), (120, 30), (100,20)]
wtlim = 50
```


```python
def greedy_knapsack(data, wtlim):
    data = sorted(data, key = lambda x: x[0]/x[1], reverse=True)
    totweight = 0
    totval = 0
    for val, wt in data:
        if wt + totweight < wtlim:
            totval += val
            totweight += wt
        else:
            frac = (wtlim - totweight) / wt
            totval += frac * val
            totweight += frac * wt
    return totval
```


```python
greedy_knapsack(data, wtlim)
```




    240.0



## Divide and Conquer

Several other algorithms follow this technique: merge and quick sort, binary search, and matrix multiplication

We have a list (or array) of sorted numbers, and we must create a function that takes this list and a number. It should return True if the number exists in the list; otherwise, it should return False.


```python
data, number = [2, 5, 8, 12, 45], 13
```


```python
def find_item(data, number):
    for item in data:
        if item == number:
            return True
    return False
```


```python
data, number = [2, 5, 8, 12, 45], 12
find_item(data, number)
```




    True




```python
%%timeit
data, number = [2, 5, 8, 12, 45], 13
find_item(data, number)
```

    453 ns ± 51.1 ns per loop (mean ± std. dev. of 7 runs, 1,000,000 loops each)


time complexity: \\(O(n)\\)


```python
def find_item(data, number):
    data.sort()
    idx = int(len(data)/2)
    item = data[idx]
    if item == number:
        return True
    elif idx != 0:
        if number < item:
            return find_item(data[:idx], number)
        elif number > item:
            return find_item(data[idx+1:], number)
    return False
```


```python
data, number = [2, 5, 8, 12, 45], 12
find_item(data, number)
```




    True




```python
%%timeit
data, number = [2, 5, 8, 12, 45], 13
find_item(data, number)
```

    1.91 µs ± 309 ns per loop (mean ± std. dev. of 7 runs, 100,000 loops each)


time complexity: \\(O(logn)\\)

## Backtracking

You have been given N-Queens and a chess dashboard (NxN). You have to place the queens in a way that no queen can attack another. A queen can attack diagonally as well as straight in any direction. If you have four queens, one solution could look like this:

| A | B | C | D |
|---|---|---|---|
| _ | Q | _ | _ |
| _ | _ | _ | Q |
| Q | _ | _ | _ |
| _ | _ | Q | _ |

For this solution, we should go row by row, placing a queen. If a solution cannot be found we _backtrack_ to the previous row and move the queen, and proceed again. Let's give it a gander.


```python
# first thing we're going to do here is play around with
# a board representation and a method for looping through
# a row

N = 4

# build board
board = []
for i in range(N):
    board.append([])
    for j in range(N):
        board[i].append(' ')
        
# initiate current row
row = 0
col = 0
for idx, i in enumerate(board[row]):
    if i == ' ':
        board[row][idx] = 'Q'
        col = idx
        break
        
board
```




    [['Q', ' ', ' ', ' '],
     [' ', ' ', ' ', ' '],
     [' ', ' ', ' ', ' '],
     [' ', ' ', ' ', ' ']]



Now that we have those building blocks, lets add a function that checks for queen on queen conflicts


```python
def check_conflict(board, row, col):       
    # check conflict, only need to check above 
    # because we are building from top down
    # to check: left top, right top, top vert
    
    # top left
    irow = row - 1
    icol = col - 1
    while irow >= 0 and icol >= 0:
        if board[irow][icol] == 'Q':
            return False
        irow -= 1
        icol -= 1

    # top right
    irow = row - 1
    icol = col + 1
    while irow >= 0 and icol < N:
        if board[irow][icol] == 'Q':
            return False
        irow -= 1
        icol += 1

    # top vert
    irow = row - 1
    icol = col
    while irow >= 0:
        if board[irow][icol] == 'Q':
            return False
        irow -= 1
        
    return True
```

Now that we have our `check_conflict` function, let's test it!


```python
N = 4

# build board we will go ahead and functionalize as well
# since we will be reusing it!
def build_board(Ncol, Nrow):
    board = []
    for i in range(Nrow):
        board.append([])
        for j in range(Ncol):
            board[i].append(' ')
    return board

# lets make a board and place a queen
board = build_board(N, N)
board[1][0] = 'Q'

# let's imagine now that we are on to the next row
row = 2
for idx, i in enumerate(board[row]):
    if check_conflict(board, row, idx):
        board[row][idx] = 'Q'
        col = idx
        break
    
    else:
        board[row][idx] = 'X'
        
board
```




    [[' ', ' ', ' ', ' '],
     ['Q', ' ', ' ', ' '],
     ['X', 'X', 'Q', ' '],
     [' ', ' ', ' ', ' ']]



Great! Looks like our `check_conflict` function is working as intended. Now let's package everything into `place_queen` where we will recursively solve this puzzle.


```python
def place_queen(board, row, queens):
    
    # here we search on the row for an open spot that is
    # backward (prev row) compatible
    row_complete = False
    for idx, i in enumerate(board[row]):
        if board[row][idx] != 'X' and check_conflict(board, row, idx):
            board[row][idx] = 'Q'
            queens.append((row,idx))
            row_complete = True
            break
        else:
            board[row][idx] = 'X'
            
    if row_complete and row < N-1:
        # nice we completed a row!
        place_queen(board, row+1, queens)
        
    elif row_complete and row == N-1:
        # yay we solved the whole board!
        for i in range(N):
            for j in range(N):
                board[i][j] = board[i][j].replace("X", " ")
        display(board)
        return board
  
    else:
        # we need to find out how far we must back track
        # if the whole row is filled with X or Q, we must
        # scrap it!
        for redo in range(row-1, -1, -1):
            if ' ' in board[redo]:
                break
            # and update the queen soln while we are at it
            queens.pop()
        
        # the queen on the last OK row is now an X
        board[redo][queens[redo][1]] = 'X'
        queens.pop()
        
        # and everything below it is swiped
        board[redo+1:] = build_board(N, N-(redo+1))
        
        # and we start forward again
        place_queen(board, redo, queens)
```


```python
N = 5
board = build_board(N, N)
queens = []
place_queen(board, 0, queens)
```


    [['Q', ' ', ' ', ' ', ' '],
     [' ', ' ', 'Q', ' ', ' '],
     [' ', ' ', ' ', ' ', 'Q'],
     [' ', 'Q', ' ', ' ', ' '],
     [' ', ' ', ' ', 'Q', ' ']]



```python
queens
```




    [(0, 0), (1, 2), (2, 4), (3, 1), (4, 3)]



## Dynamic Programming

Given two sequences, find the length of the largest common subsequence. A sub-sequence should appear in both sequences in the same order, but they do not need to be continuous.

Here is an example. Consider two strings:‘ASDF’ and ‘ASFS’. The length of the largest common subsequence is 3 (ASF). See more examples below:

S1 = ‘ABHISHEK’ and S2=’ANKITA’ => LCS = 2 (AI)

S1 = 'association' and S2='connection' => LCS=6(oction)

**the recursive solution:**


```python
def lcs(s1, s2, p, q):
    if p == -1 or q == -1:
        return 0
    elif s1[p] == s2[q]:
        # if the elements are euqal, we are going to take this solution
        # and continue searching for its maximum possible end
        return 1 + lcs(s1, s2, p-1, q-1)
    else:
        # where things get interesting.. we now search across two paths
        # either chomping off (skipping) elements in s1 or s2
        # and sending up in the recursive tree that which is maximum
        return max(lcs(s1, s2, p-1, q), lcs(s1, s2, p, q-1))
```


```python
S1 = 'ASDF'
S2 = 'ASEF'
lcs(S1, S2, len(S1)-1, len(S2)-1)
```




    3




```python
S1 = 'ABHISHEK'
S2 = 'ANKITA'
lcs(S1, S2, len(S1)-1, len(S2)-1)
```




    2



**the dynamic solution:**


```python
def lcs(s1, s2):
    t = []
    for i in range(len(s1)):
        t.append([])
        for j in range(len(s2)):
            t[i].append(0)

    for i in range(len(s1)):
        for j in range(len(s2)):
            if s1[i] == s2[j]:
                # if the puppies match, add 1 to the previous
                # substring value
                t[i][j] = 1 + t[i-1][j-1]
            else:
                # if they dont match, carry over the max value
                # from the previous substrings
                t[i][j] = max(t[i][j-1], t[i-1][j])
    display(t)
    return t[i][j]
```


```python
S1 = 'ASDFT'
S2 = 'ASEFJ'
lcs(S1, S2)
```


    [[1, 1, 1, 1, 1],
     [1, 2, 2, 2, 2],
     [1, 2, 2, 2, 2],
     [1, 2, 2, 3, 3],
     [1, 2, 2, 3, 3]]





    3




```python
S1 = 'ABHISHEK'
S2 = 'ANKITA'
lcs(S1, S2)
```


    [[1, 1, 1, 1, 1, 1],
     [1, 1, 1, 1, 1, 1],
     [1, 1, 1, 1, 1, 1],
     [1, 1, 1, 2, 2, 2],
     [1, 1, 1, 2, 2, 2],
     [1, 1, 1, 2, 2, 2],
     [1, 1, 1, 2, 2, 2],
     [1, 1, 2, 2, 2, 2]]





    2


