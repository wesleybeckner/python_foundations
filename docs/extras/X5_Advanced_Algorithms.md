<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/extras/X5_Advanced_Algorithms.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations <br> X5: Advanced Algorithms

**Instructor**: Wesley Beckner

**Contact**: wesleybeckner@gmail.com

---

<br>

This notebook covers common algorithms throughout computer programming

<br>

---


## Sliding Window

### Q1

Given an array, find the average of all subarrays of ‘K’ contiguous elements in it.


```python
data = [1, 3, 2, 6, -1, 4, 1, 8, 2]
k=5
```


```python
def soln1(data):
    means = []
    for idx in range(len(data)-k+1):
        means.append(sum(data[idx:idx+k])/k)
    return means
soln1(data)
```




    [2.2, 2.8, 2.4, 3.6, 2.8]




```python
%%timeit
soln1(data)
```

    1.37 µs ± 23 ns per loop (mean ± std. dev. of 7 runs, 1,000,000 loops each)


time complexity: \\(O(n*k)\\)


```python
def soln2(data):
    means = []
    winsum = sum(data[:k])
    means.append(winsum/k)
    for idx in range(1, len(data)-k+1):
        winsum -= data[idx-1]
        winsum += data[idx+k-1]
        means.append(winsum/k)
    return means
soln2(data)
```




    [2.2, 2.8, 2.4, 3.6, 2.8]




```python
%%timeit
soln2(data)
```

    1.06 µs ± 30.7 ns per loop (mean ± std. dev. of 7 runs, 1,000,000 loops each)


time complexity: \\(O(n)\\)

### Q2

Given an array of positive numbers and a positive number ‘S,’ find the length of the smallest contiguous subarray whose sum is greater than or equal to ‘S’. Return 0 if no such subarray exists.


```python
data = [2, 1, 5, 2, 3, 2]
S = 7
```


```python
def scs(data, S):
    start = 0
    bestlen = len(data)
    for idx in range(len(data)):
        winsum = sum(data[start:idx])
        winlen = idx-start

        while sum(data[start+1:idx]) >= S:
            start += 1
            winlen -= 1
            winsum = sum(data[start:idx])

        if winsum >= S and winlen < bestlen:
            bestlen = winlen
    return bestlen
```


```python
data = [2, 1, 5, 2, 3, 2]
S = 7
scs(data, S)
```




    2




```python
data = [3, 4, 1, 1, 6]
S=8
scs(data, S)
```




    3



time complexity: \\(O(n)\\)

space complexity: \\(O(1)\\)

### Q3

Given a string, find the length of the longest substring in it with no more than K distinct characters.


```python
String="araaci"
K=2
```
