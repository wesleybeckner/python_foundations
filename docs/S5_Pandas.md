<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/S5_Pandas.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Session 5: Pandas

**Instructor**: Wesley Beckner<br>

**Contact**: wesleybeckner@gmail.com

**Recording**: [Video (56 min)](https://www.youtube.com/watch?v=NPkhGiL7_zE)

<i>special thanks to [David Beck](https://www.cheme.washington.edu/facultyfinder/david-beck) for their contribution to this material</i>
<br>

---

<br>

Today, we will jump into the **Pandas** package.  Packages are collections of related functions.  These are the things we `import`. Pandas is a two dimensional data structure like a spreadsheet in Excel. In fact, we will be importing our first dataset and viewing it, with Pandas!

<br>

---

## 5.1 Pandas

### 5.1.1 Pandas and Scikit-Learn `load_datasets`

We begin by loading the Pandas package.  Packages are collections of functions that share a common utility.  We've seen `import` before.  Let's use it to import Pandas and all the richness that Pandas has.

We'll also use a very useful feature of the scikit-learn toolkit, the `load_datasets` module. We will do some very rudimentary tasks with this dataset, just to demonstrate the utility of `load_datasets`, then we will switch over to a more relevant dataset for our purposes.

```
import pandas
from sklearn.datasets import load_wine
```


```python
import pandas
from sklearn.datasets import load_wine
```

We import a function `load_wine` that loads a simple data set we can play with called the Wine recognition dataset from the 1980s.

You can read more about that dataset [here](https://archive.ics.uci.edu/ml/datasets/Wine)

```
dataset = load_wine()
print(dataset.DESCR)
```


```python
dataset = load_wine()
print(dataset.DESCR)
```

    .. _wine_dataset:
    
    Wine recognition dataset
    ------------------------
    
    **Data Set Characteristics:**
    
        :Number of Instances: 178 (50 in each of three classes)
        :Number of Attributes: 13 numeric, predictive attributes and the class
        :Attribute Information:
     		- Alcohol
     		- Malic acid
     		- Ash
    		- Alcalinity of ash  
     		- Magnesium
    		- Total phenols
     		- Flavanoids
     		- Nonflavanoid phenols
     		- Proanthocyanins
    		- Color intensity
     		- Hue
     		- OD280/OD315 of diluted wines
     		- Proline
    
        - class:
                - class_0
                - class_1
                - class_2
    		
        :Summary Statistics:
        
        ============================= ==== ===== ======= =====
                                       Min   Max   Mean     SD
        ============================= ==== ===== ======= =====
        Alcohol:                      11.0  14.8    13.0   0.8
        Malic Acid:                   0.74  5.80    2.34  1.12
        Ash:                          1.36  3.23    2.36  0.27
        Alcalinity of Ash:            10.6  30.0    19.5   3.3
        Magnesium:                    70.0 162.0    99.7  14.3
        Total Phenols:                0.98  3.88    2.29  0.63
        Flavanoids:                   0.34  5.08    2.03  1.00
        Nonflavanoid Phenols:         0.13  0.66    0.36  0.12
        Proanthocyanins:              0.41  3.58    1.59  0.57
        Colour Intensity:              1.3  13.0     5.1   2.3
        Hue:                          0.48  1.71    0.96  0.23
        OD280/OD315 of diluted wines: 1.27  4.00    2.61  0.71
        Proline:                       278  1680     746   315
        ============================= ==== ===== ======= =====
    
        :Missing Attribute Values: None
        :Class Distribution: class_0 (59), class_1 (71), class_2 (48)
        :Creator: R.A. Fisher
        :Donor: Michael Marshall (MARSHALL%PLU@io.arc.nasa.gov)
        :Date: July, 1988
    
    This is a copy of UCI ML Wine recognition datasets.
    https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data
    
    The data is the results of a chemical analysis of wines grown in the same
    region in Italy by three different cultivators. There are thirteen different
    measurements taken for different constituents found in the three types of
    wine.
    
    Original Owners: 
    
    Forina, M. et al, PARVUS - 
    An Extendible Package for Data Exploration, Classification and Correlation. 
    Institute of Pharmaceutical and Food Analysis and Technologies,
    Via Brigata Salerno, 16147 Genoa, Italy.
    
    Citation:
    
    Lichman, M. (2013). UCI Machine Learning Repository
    [https://archive.ics.uci.edu/ml]. Irvine, CA: University of California,
    School of Information and Computer Science. 
    
    .. topic:: References
    
      (1) S. Aeberhard, D. Coomans and O. de Vel, 
      Comparison of Classifiers in High Dimensional Settings, 
      Tech. Rep. no. 92-02, (1992), Dept. of Computer Science and Dept. of  
      Mathematics and Statistics, James Cook University of North Queensland. 
      (Also submitted to Technometrics). 
    
      The data was used with many others for comparing various 
      classifiers. The classes are separable, though only RDA 
      has achieved 100% correct classification. 
      (RDA : 100%, QDA 99.4%, LDA 98.9%, 1NN 96.1% (z-transformed data)) 
      (All results using the leave-one-out technique) 
    
      (2) S. Aeberhard, D. Coomans and O. de Vel, 
      "THE CLASSIFICATION PERFORMANCE OF RDA" 
      Tech. Rep. no. 92-01, (1992), Dept. of Computer Science and Dept. of 
      Mathematics and Statistics, James Cook University of North Queensland. 
      (Also submitted to Journal of Chemometrics).
    


```
df = pandas.DataFrame()
```


```python
df = pandas.DataFrame()
```

#### 5.1.1.1 import ... as ... pattern

Because we'll use it so much, we often import under a shortened name using the ``import ... as ...`` pattern:

```
import pandas as pd
```


```python
import pandas as pd
```

### 5.1.2 Creating pandas DataFrames

_DataFrames_ are two-dimensional tables of data that are the common data object we work with in Pandas. You can think of it as like an Excel spreadsheet.


Let's create an empty _DataFrame_ and put the result into a variable called `df`.  This is a popular choice for a _DataFrame_ variable name.

```
df = pd.DataFrame()
```


```python
df = pd.DataFrame()
```

Let's open the Wine dataset as a pandas DataFrame.  Notice we change the value of the `df` variable to point to a new DataFrame.

```
df = pd.DataFrame(dataset.data, columns=dataset.feature_names)
```


```python
df = pd.DataFrame(dataset.data, columns=dataset.feature_names)
```

#### 5.1.2.1 From excel and csv

We will now be reading the data from this [link](https://raw.githubusercontent.com/wesleybeckner/ds_for_engineers/main/data/truffle_margin/margin_data.csv). This is what we call a csv or comma separated value file. We have a method to read these directly into pandas:


```python
df = pd.read_csv('https://raw.githubusercontent.com/wesleybeckner/technology_explorers/main/assets/imdb_movies.csv')
```

    C:\Users\WesleyBeckner\AppData\Local\Temp\ipykernel_17180\2664770703.py:1: DtypeWarning: Columns (3) have mixed types. Specify dtype option on import or set low_memory=False.
      df = pd.read_csv('https://raw.githubusercontent.com/wesleybeckner/technology_explorers/main/assets/imdb_movies.csv')


We can do this in a similar way with excel files. 


```python
pd.read_excel('https://raw.githubusercontent.com/wesleybeckner/ds_for_engineers/main/data/truffle_margin/margin_data.xlsx')
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Base Cake</th>
      <th>Truffle Type</th>
      <th>Primary Flavor</th>
      <th>Secondary Flavor</th>
      <th>Color Group</th>
      <th>Width</th>
      <th>Height</th>
      <th>Net Sales Quantity in KG</th>
      <th>EBITDA</th>
      <th>Product</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Tiramisu</td>
      <td>Chocolate Outer</td>
      <td>Doughnut</td>
      <td>Egg Nog</td>
      <td>Amethyst</td>
      <td>340</td>
      <td>50</td>
      <td>8244.500</td>
      <td>21833.99</td>
      <td>Tiramisu-Chocolate Outer-Doughnut-Egg Nog-Amet...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Tiramisu</td>
      <td>Chocolate Outer</td>
      <td>Doughnut</td>
      <td>Egg Nog</td>
      <td>Amethyst</td>
      <td>1340</td>
      <td>25</td>
      <td>1857.000</td>
      <td>21589.48</td>
      <td>Tiramisu-Chocolate Outer-Doughnut-Egg Nog-Amet...</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Tiramisu</td>
      <td>Chocolate Outer</td>
      <td>Chocolate</td>
      <td>Pear</td>
      <td>Amethyst</td>
      <td>310</td>
      <td>140</td>
      <td>17365.000</td>
      <td>19050.69</td>
      <td>Tiramisu-Chocolate Outer-Chocolate-Pear-Amethy...</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Tiramisu</td>
      <td>Chocolate Outer</td>
      <td>Doughnut</td>
      <td>Egg Nog</td>
      <td>Amethyst</td>
      <td>449</td>
      <td>50</td>
      <td>14309.000</td>
      <td>18573.01</td>
      <td>Tiramisu-Chocolate Outer-Doughnut-Egg Nog-Amet...</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Tiramisu</td>
      <td>Chocolate Outer</td>
      <td>Doughnut</td>
      <td>Rock and Rye</td>
      <td>Amethyst</td>
      <td>640</td>
      <td>80</td>
      <td>25584.500</td>
      <td>14790.90</td>
      <td>Tiramisu-Chocolate Outer-Doughnut-Rock and Rye...</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>2501</th>
      <td>Butter</td>
      <td>Chocolate Outer</td>
      <td>Lemon Bar</td>
      <td>Wild Cherry Cream</td>
      <td>Amethyst</td>
      <td>930</td>
      <td>50</td>
      <td>150352.000</td>
      <td>-97839.16</td>
      <td>Butter-Chocolate Outer-Lemon Bar-Wild Cherry C...</td>
    </tr>
    <tr>
      <th>2502</th>
      <td>Butter</td>
      <td>Chocolate Outer</td>
      <td>Cream Soda</td>
      <td>Peppermint</td>
      <td>Amethyst</td>
      <td>900</td>
      <td>50</td>
      <td>120451.400</td>
      <td>-98661.97</td>
      <td>Butter-Chocolate Outer-Cream Soda-Peppermint-A...</td>
    </tr>
    <tr>
      <th>2503</th>
      <td>Butter</td>
      <td>Jelly Filled</td>
      <td>Orange</td>
      <td>Cucumber</td>
      <td>Burgundy</td>
      <td>905</td>
      <td>50</td>
      <td>143428.580</td>
      <td>-122236.96</td>
      <td>Butter-Jelly Filled-Orange-Cucumber-Burgundy-9...</td>
    </tr>
    <tr>
      <th>2504</th>
      <td>Butter</td>
      <td>Chocolate Outer</td>
      <td>Horchata</td>
      <td>Dill Pickle</td>
      <td>Amethyst</td>
      <td>597</td>
      <td>45</td>
      <td>271495.572</td>
      <td>-128504.49</td>
      <td>Butter-Chocolate Outer-Horchata-Dill Pickle-Am...</td>
    </tr>
    <tr>
      <th>2505</th>
      <td>Butter</td>
      <td>Candy Outer</td>
      <td>Ginger Lime</td>
      <td>Vanilla</td>
      <td>Amethyst</td>
      <td>580</td>
      <td>50</td>
      <td>170567.065</td>
      <td>-137897.08</td>
      <td>Butter-Candy Outer-Ginger Lime-Vanilla-Amethys...</td>
    </tr>
  </tbody>
</table>
<p>2506 rows × 10 columns</p>
</div>



#### 5.1.2.2 from lists


```python
my_list = [[1, 2, 3], [3, 4, 5], [5, 6, 7], [7, 8, 9]]
pd.DataFrame(my_list)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
      <th>2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1</th>
      <td>3</td>
      <td>4</td>
      <td>5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>3</th>
      <td>7</td>
      <td>8</td>
      <td>9</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.DataFrame([[1, 2, 3], [3, 4, 5], [5, 6, 7], [7, 8, 9]],
                   index=['a', 'b', 'c', 'd'], columns=['x', 'y', 'z'])
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>x</th>
      <th>y</th>
      <th>z</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>1</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>b</th>
      <td>3</td>
      <td>4</td>
      <td>5</td>
    </tr>
    <tr>
      <th>c</th>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>d</th>
      <td>7</td>
      <td>8</td>
      <td>9</td>
    </tr>
  </tbody>
</table>
</div>



#### 5.1.2.3 from dictionaries


```python
from_dict = pd.DataFrame({'A': ['apple', 'airplane'], 'B': ['bannana', 'bubbles']})
from_dict
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>A</th>
      <th>B</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>apple</td>
      <td>bannana</td>
    </tr>
    <tr>
      <th>1</th>
      <td>airplane</td>
      <td>bubbles</td>
    </tr>
  </tbody>
</table>
</div>




```python
from_dict.to_dict()
```




    {'A': {0: 'apple', 1: 'airplane'}, 'B': {0: 'bannana', 1: 'bubbles'}}



#### 🏋️ Exercise 1: Create a DataFrame

Create a dictionary with the following keys: `movies, songs, books`. In each key list your top 5 favorites in the cooresponding category. Then use `pd.DataFrame` to turn this into a dictionary.


```python
# Cell for Ex 1
```

#### 5.1.2.4 on `pandas.Series`

pandas `Series` objects will percolate in our experience here and there, however they are not so important as for us to wish to spend dedicated time on them. For now, know that they are a lower-level data collection in the pandas framework. You can think of them as an individual column or row in the pandas dataframe. For more practice with these you can refer to [this documentation]()

### 5.1.3 Viewing pandas dataframes

The ``head()`` and ``tail()`` methods show us the first and last rows of the data.

```
df.head()
df.tail()
```


```python
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>imdb_title_id</th>
      <th>title</th>
      <th>original_title</th>
      <th>year</th>
      <th>date_published</th>
      <th>genre</th>
      <th>duration</th>
      <th>country</th>
      <th>language</th>
      <th>director</th>
      <th>writer</th>
      <th>production_company</th>
      <th>actors</th>
      <th>description</th>
      <th>avg_vote</th>
      <th>votes</th>
      <th>budget</th>
      <th>usa_gross_income</th>
      <th>worlwide_gross_income</th>
      <th>metascore</th>
      <th>reviews_from_users</th>
      <th>reviews_from_critics</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>tt0000009</td>
      <td>Miss Jerry</td>
      <td>Miss Jerry</td>
      <td>1894</td>
      <td>1894-10-09</td>
      <td>Romance</td>
      <td>45</td>
      <td>USA</td>
      <td>None</td>
      <td>Alexander Black</td>
      <td>Alexander Black</td>
      <td>Alexander Black Photoplays</td>
      <td>Blanche Bayliss, William Courtenay, Chauncey D...</td>
      <td>The adventures of a female reporter in the 1890s.</td>
      <td>5.9</td>
      <td>154</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>1.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>tt0000574</td>
      <td>The Story of the Kelly Gang</td>
      <td>The Story of the Kelly Gang</td>
      <td>1906</td>
      <td>1906-12-26</td>
      <td>Biography, Crime, Drama</td>
      <td>70</td>
      <td>Australia</td>
      <td>None</td>
      <td>Charles Tait</td>
      <td>Charles Tait</td>
      <td>J. and N. Tait</td>
      <td>Elizabeth Tait, John Tait, Norman Campbell, Be...</td>
      <td>True story of notorious Australian outlaw Ned ...</td>
      <td>6.1</td>
      <td>589</td>
      <td>$ 2250</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>7.0</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>tt0001892</td>
      <td>Den sorte drøm</td>
      <td>Den sorte drøm</td>
      <td>1911</td>
      <td>1911-08-19</td>
      <td>Drama</td>
      <td>53</td>
      <td>Germany, Denmark</td>
      <td>NaN</td>
      <td>Urban Gad</td>
      <td>Urban Gad, Gebhard Schätzler-Perasini</td>
      <td>Fotorama</td>
      <td>Asta Nielsen, Valdemar Psilander, Gunnar Helse...</td>
      <td>Two men of high rank are both wooing the beaut...</td>
      <td>5.8</td>
      <td>188</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>5.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>tt0002101</td>
      <td>Cleopatra</td>
      <td>Cleopatra</td>
      <td>1912</td>
      <td>1912-11-13</td>
      <td>Drama, History</td>
      <td>100</td>
      <td>USA</td>
      <td>English</td>
      <td>Charles L. Gaskill</td>
      <td>Victorien Sardou</td>
      <td>Helen Gardner Picture Players</td>
      <td>Helen Gardner, Pearl Sindelar, Miss Fielding, ...</td>
      <td>The fabled queen of Egypt's affair with Roman ...</td>
      <td>5.2</td>
      <td>446</td>
      <td>$ 45000</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>25.0</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>tt0002130</td>
      <td>L'Inferno</td>
      <td>L'Inferno</td>
      <td>1911</td>
      <td>1911-03-06</td>
      <td>Adventure, Drama, Fantasy</td>
      <td>68</td>
      <td>Italy</td>
      <td>Italian</td>
      <td>Francesco Bertolini, Adolfo Padovan</td>
      <td>Dante Alighieri</td>
      <td>Milano Film</td>
      <td>Salvatore Papa, Arturo Pirovano, Giuseppe de L...</td>
      <td>Loosely adapted from Dante's Divine Comedy and...</td>
      <td>7.0</td>
      <td>2237</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>31.0</td>
      <td>14.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.tail()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>imdb_title_id</th>
      <th>title</th>
      <th>original_title</th>
      <th>year</th>
      <th>date_published</th>
      <th>genre</th>
      <th>duration</th>
      <th>country</th>
      <th>language</th>
      <th>director</th>
      <th>writer</th>
      <th>production_company</th>
      <th>actors</th>
      <th>description</th>
      <th>avg_vote</th>
      <th>votes</th>
      <th>budget</th>
      <th>usa_gross_income</th>
      <th>worlwide_gross_income</th>
      <th>metascore</th>
      <th>reviews_from_users</th>
      <th>reviews_from_critics</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>85850</th>
      <td>tt9908390</td>
      <td>Le lion</td>
      <td>Le lion</td>
      <td>2020</td>
      <td>2020-01-29</td>
      <td>Comedy</td>
      <td>95</td>
      <td>France, Belgium</td>
      <td>French</td>
      <td>Ludovic Colbeau-Justin</td>
      <td>Alexandre Coquelle, Matthieu Le Naour</td>
      <td>Monkey Pack Films</td>
      <td>Dany Boon, Philippe Katerine, Anne Serra, Samu...</td>
      <td>A psychiatric hospital patient pretends to be ...</td>
      <td>5.3</td>
      <td>398</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 3507171</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>85851</th>
      <td>tt9911196</td>
      <td>De Beentjes van Sint-Hildegard</td>
      <td>De Beentjes van Sint-Hildegard</td>
      <td>2020</td>
      <td>2020-02-13</td>
      <td>Comedy, Drama</td>
      <td>103</td>
      <td>Netherlands</td>
      <td>German, Dutch</td>
      <td>Johan Nijenhuis</td>
      <td>Radek Bajgar, Herman Finkers</td>
      <td>Johan Nijenhuis &amp; Co</td>
      <td>Herman Finkers, Johanna ter Steege, Leonie ter...</td>
      <td>A middle-aged veterinary surgeon believes his ...</td>
      <td>7.7</td>
      <td>724</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 7299062</td>
      <td>NaN</td>
      <td>6.0</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>85852</th>
      <td>tt9911774</td>
      <td>Padmavyuhathile Abhimanyu</td>
      <td>Padmavyuhathile Abhimanyu</td>
      <td>2019</td>
      <td>2019-03-08</td>
      <td>Drama</td>
      <td>130</td>
      <td>India</td>
      <td>Malayalam</td>
      <td>Vineesh Aaradya</td>
      <td>Vineesh Aaradya, Vineesh Aaradya</td>
      <td>RMCC Productions</td>
      <td>Anoop Chandran, Indrans, Sona Nair, Simon Brit...</td>
      <td>NaN</td>
      <td>7.9</td>
      <td>265</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>85853</th>
      <td>tt9914286</td>
      <td>Sokagin Çocuklari</td>
      <td>Sokagin Çocuklari</td>
      <td>2019</td>
      <td>2019-03-15</td>
      <td>Drama, Family</td>
      <td>98</td>
      <td>Turkey</td>
      <td>Turkish</td>
      <td>Ahmet Faik Akinci</td>
      <td>Ahmet Faik Akinci, Kasim Uçkan</td>
      <td>Gizem Ajans</td>
      <td>Ahmet Faik Akinci, Belma Mamati, Metin Keçeci,...</td>
      <td>NaN</td>
      <td>6.4</td>
      <td>194</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 2833</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>85854</th>
      <td>tt9914942</td>
      <td>La vida sense la Sara Amat</td>
      <td>La vida sense la Sara Amat</td>
      <td>2019</td>
      <td>2020-02-05</td>
      <td>Drama</td>
      <td>74</td>
      <td>Spain</td>
      <td>Catalan</td>
      <td>Laura Jou</td>
      <td>Coral Cruz, Pep Puig</td>
      <td>La Xarxa de Comunicació Local</td>
      <td>Maria Morera Colomer, Biel Rossell Pelfort, Is...</td>
      <td>Pep, a 13-year-old boy, is in love with a girl...</td>
      <td>6.7</td>
      <td>102</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 59794</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>2.0</td>
    </tr>
  </tbody>
</table>
</div>



The ``shape`` attribute shows us the number of elements:

```
df.shape
```

Note it doesn't have the `()` because it isn't a **_function_** - it is an **_attribute_** or variable attached to the `df` object.


```python
df.shape
```




    (85855, 22)



The ``columns`` attribute gives us the column names

```
df.columns
```



```python
df.columns
```




    Index(['imdb_title_id', 'title', 'original_title', 'year', 'date_published',
           'genre', 'duration', 'country', 'language', 'director', 'writer',
           'production_company', 'actors', 'description', 'avg_vote', 'votes',
           'budget', 'usa_gross_income', 'worlwide_gross_income', 'metascore',
           'reviews_from_users', 'reviews_from_critics'],
          dtype='object')



The ``index`` attribute gives us the index names

```
df.index
```


```python
df.index
```




    RangeIndex(start=0, stop=85855, step=1)



The ``dtypes`` attribute gives the data types of each column, remember the data type *_floating point_**?:

```
df.dtypes
```


```python
df.dtypes
```




    imdb_title_id             object
    title                     object
    original_title            object
    year                      object
    date_published            object
    genre                     object
    duration                   int64
    country                   object
    language                  object
    director                  object
    writer                    object
    production_company        object
    actors                    object
    description               object
    avg_vote                 float64
    votes                      int64
    budget                    object
    usa_gross_income          object
    worlwide_gross_income     object
    metascore                float64
    reviews_from_users       float64
    reviews_from_critics     float64
    dtype: object




```python
df.describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>duration</th>
      <th>avg_vote</th>
      <th>votes</th>
      <th>metascore</th>
      <th>reviews_from_users</th>
      <th>reviews_from_critics</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>85855.000000</td>
      <td>85855.000000</td>
      <td>8.585500e+04</td>
      <td>13305.000000</td>
      <td>78258.000000</td>
      <td>74058.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>100.351418</td>
      <td>5.898656</td>
      <td>9.493490e+03</td>
      <td>55.896881</td>
      <td>46.040826</td>
      <td>27.479989</td>
    </tr>
    <tr>
      <th>std</th>
      <td>22.553848</td>
      <td>1.234987</td>
      <td>5.357436e+04</td>
      <td>17.784874</td>
      <td>178.511411</td>
      <td>58.339158</td>
    </tr>
    <tr>
      <th>min</th>
      <td>41.000000</td>
      <td>1.000000</td>
      <td>9.900000e+01</td>
      <td>1.000000</td>
      <td>1.000000</td>
      <td>1.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>88.000000</td>
      <td>5.200000</td>
      <td>2.050000e+02</td>
      <td>43.000000</td>
      <td>4.000000</td>
      <td>3.000000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>96.000000</td>
      <td>6.100000</td>
      <td>4.840000e+02</td>
      <td>57.000000</td>
      <td>9.000000</td>
      <td>8.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>108.000000</td>
      <td>6.800000</td>
      <td>1.766500e+03</td>
      <td>69.000000</td>
      <td>27.000000</td>
      <td>23.000000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>808.000000</td>
      <td>9.900000</td>
      <td>2.278845e+06</td>
      <td>100.000000</td>
      <td>10472.000000</td>
      <td>999.000000</td>
    </tr>
  </tbody>
</table>
</div>



#### 🏋️ Exercise 2: Viewing DataFrames

Using the dataframe you made in exercise 1, return the following attributes: the datatype stored in each column, the column names, the indices, and the shape.


```python
# Cell for Ex 2
```

### 5.1.4 Manipulating data with ``pandas``

Here we'll cover some key features of manipulating data with pandas

#### 5.1.4.1 Selection

Access columns by name using square-bracket indexing:

```
df['duration']
```


```python
df['duration']
```




    0         45
    1         70
    2         53
    3        100
    4         68
            ... 
    85850     95
    85851    103
    85852    130
    85853     98
    85854     74
    Name: duration, Length: 85855, dtype: int64



Mathematical operations on columns happen *element-wise*:

```
df['duration'] / 60
```


```python
df['duration'] / 60
```




    0        0.750000
    1        1.166667
    2        0.883333
    3        1.666667
    4        1.133333
               ...   
    85850    1.583333
    85851    1.716667
    85852    2.166667
    85853    1.633333
    85854    1.233333
    Name: duration, Length: 85855, dtype: float64




Columns can be created (or overwritten) with the assignment operator.
Let's create a column with duration in hours.

```
df['duration (hours)'] = df['duration'] / 60
```


```python
df['duration (hours)'] = df['duration'] / 60
```

Let's use the `.head()` **_function_** to see our new data!

```
df.head()
```


```python
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>imdb_title_id</th>
      <th>title</th>
      <th>original_title</th>
      <th>year</th>
      <th>date_published</th>
      <th>genre</th>
      <th>duration</th>
      <th>country</th>
      <th>language</th>
      <th>director</th>
      <th>writer</th>
      <th>production_company</th>
      <th>actors</th>
      <th>description</th>
      <th>avg_vote</th>
      <th>votes</th>
      <th>budget</th>
      <th>usa_gross_income</th>
      <th>worlwide_gross_income</th>
      <th>metascore</th>
      <th>reviews_from_users</th>
      <th>reviews_from_critics</th>
      <th>duration (hours)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>tt0000009</td>
      <td>Miss Jerry</td>
      <td>Miss Jerry</td>
      <td>1894</td>
      <td>1894-10-09</td>
      <td>Romance</td>
      <td>45</td>
      <td>USA</td>
      <td>None</td>
      <td>Alexander Black</td>
      <td>Alexander Black</td>
      <td>Alexander Black Photoplays</td>
      <td>Blanche Bayliss, William Courtenay, Chauncey D...</td>
      <td>The adventures of a female reporter in the 1890s.</td>
      <td>5.9</td>
      <td>154</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>0.750000</td>
    </tr>
    <tr>
      <th>1</th>
      <td>tt0000574</td>
      <td>The Story of the Kelly Gang</td>
      <td>The Story of the Kelly Gang</td>
      <td>1906</td>
      <td>1906-12-26</td>
      <td>Biography, Crime, Drama</td>
      <td>70</td>
      <td>Australia</td>
      <td>None</td>
      <td>Charles Tait</td>
      <td>Charles Tait</td>
      <td>J. and N. Tait</td>
      <td>Elizabeth Tait, John Tait, Norman Campbell, Be...</td>
      <td>True story of notorious Australian outlaw Ned ...</td>
      <td>6.1</td>
      <td>589</td>
      <td>$ 2250</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>7.0</td>
      <td>7.0</td>
      <td>1.166667</td>
    </tr>
    <tr>
      <th>2</th>
      <td>tt0001892</td>
      <td>Den sorte drøm</td>
      <td>Den sorte drøm</td>
      <td>1911</td>
      <td>1911-08-19</td>
      <td>Drama</td>
      <td>53</td>
      <td>Germany, Denmark</td>
      <td>NaN</td>
      <td>Urban Gad</td>
      <td>Urban Gad, Gebhard Schätzler-Perasini</td>
      <td>Fotorama</td>
      <td>Asta Nielsen, Valdemar Psilander, Gunnar Helse...</td>
      <td>Two men of high rank are both wooing the beaut...</td>
      <td>5.8</td>
      <td>188</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>5.0</td>
      <td>2.0</td>
      <td>0.883333</td>
    </tr>
    <tr>
      <th>3</th>
      <td>tt0002101</td>
      <td>Cleopatra</td>
      <td>Cleopatra</td>
      <td>1912</td>
      <td>1912-11-13</td>
      <td>Drama, History</td>
      <td>100</td>
      <td>USA</td>
      <td>English</td>
      <td>Charles L. Gaskill</td>
      <td>Victorien Sardou</td>
      <td>Helen Gardner Picture Players</td>
      <td>Helen Gardner, Pearl Sindelar, Miss Fielding, ...</td>
      <td>The fabled queen of Egypt's affair with Roman ...</td>
      <td>5.2</td>
      <td>446</td>
      <td>$ 45000</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>25.0</td>
      <td>3.0</td>
      <td>1.666667</td>
    </tr>
    <tr>
      <th>4</th>
      <td>tt0002130</td>
      <td>L'Inferno</td>
      <td>L'Inferno</td>
      <td>1911</td>
      <td>1911-03-06</td>
      <td>Adventure, Drama, Fantasy</td>
      <td>68</td>
      <td>Italy</td>
      <td>Italian</td>
      <td>Francesco Bertolini, Adolfo Padovan</td>
      <td>Dante Alighieri</td>
      <td>Milano Film</td>
      <td>Salvatore Papa, Arturo Pirovano, Giuseppe de L...</td>
      <td>Loosely adapted from Dante's Divine Comedy and...</td>
      <td>7.0</td>
      <td>2237</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>31.0</td>
      <td>14.0</td>
      <td>1.133333</td>
    </tr>
  </tbody>
</table>
</div>



##### 5.1.4.1.1 `loc` and `iloc`

Pandas provides a powerful way to work with both rows and columns together, optionally using their label indices or numeric indices.

- **`.loc :`**<br/>
Purely label-location based indexer for selection by label (but may also be used with a boolean array).<br/>
  **Important: If you use slicing in loc, it will return the end index as well**
  

- **`.iloc:`**<br/>
Purely integer-location based indexing for selection by position (but may also be used with a boolean array).


```python
df.columns[1]
```




    'title'




```python
df.loc[:5:2, [df.columns[1]]]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>title</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Miss Jerry</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Den sorte drøm</td>
    </tr>
    <tr>
      <th>4</th>
      <td>L'Inferno</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.iloc[-5:, [3,5]]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>year</th>
      <th>genre</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>85850</th>
      <td>2020</td>
      <td>Comedy</td>
    </tr>
    <tr>
      <th>85851</th>
      <td>2020</td>
      <td>Comedy, Drama</td>
    </tr>
    <tr>
      <th>85852</th>
      <td>2019</td>
      <td>Drama</td>
    </tr>
    <tr>
      <th>85853</th>
      <td>2019</td>
      <td>Drama, Family</td>
    </tr>
    <tr>
      <th>85854</th>
      <td>2019</td>
      <td>Drama</td>
    </tr>
  </tbody>
</table>
</div>



##### 5.1.4.1.2 column vs index access


```python
df['duration'][0:10]
```




    0     45
    1     70
    2     53
    3    100
    4     68
    5     60
    6     85
    7    120
    8    120
    9     55
    Name: duration, dtype: int64




```python
# df[0]['duration'] # will return an error
```


```python
my_list = [[10, 20, 30]]*4
mydf = pd.DataFrame(my_list, 
                    index=['a','b','c','d'], 
                    columns=['alpha', 'beta', 'gamma'])
mydf
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>alpha</th>
      <th>beta</th>
      <th>gamma</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>10</td>
      <td>20</td>
      <td>30</td>
    </tr>
    <tr>
      <th>b</th>
      <td>10</td>
      <td>20</td>
      <td>30</td>
    </tr>
    <tr>
      <th>c</th>
      <td>10</td>
      <td>20</td>
      <td>30</td>
    </tr>
    <tr>
      <th>d</th>
      <td>10</td>
      <td>20</td>
      <td>30</td>
    </tr>
  </tbody>
</table>
</div>




```python
mydf.loc['a', 'alpha'] = 'mychange'
```


```python
# using this you will get a setting
# with copy warning (depending on your pandas warning settings)
# mydf['alpha']['a'] = 'newchange'
```

You want to use `loc` or `iloc` when setting new values to pandas dataframes.

##### 🏋️ Exercise 3: Selecting

select the first 10 rows of the country, genre, and year columns using `loc`. Repeat the same exercise using `iloc`


```python
# Cell for Ex 3
```

#### 5.1.4.2 Filtering

filtering down your selection will be BIGLY useful in your data quests

##### 5.1.4.2.1 By String

one of the first tools we'll use to filter our dataset is the `.str.contains` method. Let's take an example.


```python
# remember, if we don't remember our column mames we can quickly pull them up 
# with:
df.columns
```




    Index(['imdb_title_id', 'title', 'original_title', 'year', 'date_published',
           'genre', 'duration', 'country', 'language', 'director', 'writer',
           'production_company', 'actors', 'description', 'avg_vote', 'votes',
           'budget', 'usa_gross_income', 'worlwide_gross_income', 'metascore',
           'reviews_from_users', 'reviews_from_critics', 'duration (hours)'],
          dtype='object')




```python
[df['description'].str.contains('a.i.', na=False)]
```




    [0        False
     1         True
     2         True
     3        False
     4         True
              ...  
     85850     True
     85851    False
     85852    False
     85853    False
     85854    False
     Name: description, Length: 85855, dtype: bool]




```python
df.iloc[17920]['description']
```




    'A scientist creates Proteus--an organic super computer with artificial intelligence which becomes obsessed with human beings, and in particular the creators wife.'




```python
df[df['description'].str.contains('artificial intelligence', na=False)]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>imdb_title_id</th>
      <th>title</th>
      <th>original_title</th>
      <th>year</th>
      <th>date_published</th>
      <th>genre</th>
      <th>duration</th>
      <th>country</th>
      <th>language</th>
      <th>director</th>
      <th>writer</th>
      <th>production_company</th>
      <th>actors</th>
      <th>description</th>
      <th>avg_vote</th>
      <th>votes</th>
      <th>budget</th>
      <th>usa_gross_income</th>
      <th>worlwide_gross_income</th>
      <th>metascore</th>
      <th>reviews_from_users</th>
      <th>reviews_from_critics</th>
      <th>duration (hours)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>17920</th>
      <td>tt0075931</td>
      <td>Generazione Proteus</td>
      <td>Demon Seed</td>
      <td>1977</td>
      <td>1977-12-31</td>
      <td>Horror, Sci-Fi</td>
      <td>94</td>
      <td>USA</td>
      <td>English</td>
      <td>Donald Cammell</td>
      <td>Dean R. Koontz, Robert Jaffe</td>
      <td>Metro-Goldwyn-Mayer (MGM)</td>
      <td>Julie Christie, Fritz Weaver, Gerrit Graham, B...</td>
      <td>A scientist creates Proteus--an organic super ...</td>
      <td>6.3</td>
      <td>7994</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>55.0</td>
      <td>71.0</td>
      <td>81.0</td>
      <td>1.566667</td>
    </tr>
    <tr>
      <th>44484</th>
      <td>tt0382992</td>
      <td>Stealth - Arma suprema</td>
      <td>Stealth</td>
      <td>2005</td>
      <td>2005-09-02</td>
      <td>Action, Adventure, Sci-Fi</td>
      <td>121</td>
      <td>USA</td>
      <td>English, Korean, Russian, Spanish</td>
      <td>Rob Cohen</td>
      <td>W.D. Richter</td>
      <td>Columbia Pictures</td>
      <td>Josh Lucas, Jessica Biel, Jamie Foxx, Sam Shep...</td>
      <td>Deeply ensconced in a top-secret military prog...</td>
      <td>5.1</td>
      <td>51365</td>
      <td>$ 135000000</td>
      <td>$ 32116746</td>
      <td>$ 79268322</td>
      <td>35.0</td>
      <td>401.0</td>
      <td>150.0</td>
      <td>2.016667</td>
    </tr>
    <tr>
      <th>65411</th>
      <td>tt2209764</td>
      <td>Transcendence</td>
      <td>Transcendence</td>
      <td>2014</td>
      <td>2014-04-17</td>
      <td>Action, Drama, Sci-Fi</td>
      <td>119</td>
      <td>UK, China, USA</td>
      <td>English</td>
      <td>Wally Pfister</td>
      <td>Jack Paglen</td>
      <td>Alcon Entertainment</td>
      <td>Johnny Depp, Rebecca Hall, Paul Bettany, Cilli...</td>
      <td>A scientist's drive for artificial intelligenc...</td>
      <td>6.3</td>
      <td>213720</td>
      <td>$ 100000000</td>
      <td>$ 23022309</td>
      <td>$ 103039258</td>
      <td>42.0</td>
      <td>554.0</td>
      <td>373.0</td>
      <td>1.983333</td>
    </tr>
    <tr>
      <th>68589</th>
      <td>tt2769184</td>
      <td>Debug</td>
      <td>Debug</td>
      <td>2014</td>
      <td>2015-02-07</td>
      <td>Horror, Sci-Fi</td>
      <td>86</td>
      <td>Canada</td>
      <td>English</td>
      <td>David Hewlett</td>
      <td>David Hewlett</td>
      <td>Copperheart Entertainment</td>
      <td>Tenika Davis, Jason Momoa, Adrian Holmes, Kjar...</td>
      <td>Six young computer hackers, sent to work on a ...</td>
      <td>4.3</td>
      <td>2244</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>38.0</td>
      <td>30.0</td>
      <td>1.433333</td>
    </tr>
    <tr>
      <th>71500</th>
      <td>tt3502284</td>
      <td>Kikaidâ Reboot</td>
      <td>Kikaidâ Reboot</td>
      <td>2014</td>
      <td>2014-05-24</td>
      <td>Action</td>
      <td>110</td>
      <td>Japan</td>
      <td>Japanese</td>
      <td>Ten Shimoyama</td>
      <td>Shôtarô Ishinomori, Kento Shimoyama</td>
      <td>Asatsu-DK</td>
      <td>Jingi Irie, Kazushige Nagashima, Aimi Satsukaw...</td>
      <td>Komyoji Nobuhiko is a genius and leader in rob...</td>
      <td>5.6</td>
      <td>110</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>2.0</td>
      <td>2.0</td>
      <td>1.833333</td>
    </tr>
    <tr>
      <th>75759</th>
      <td>tt4788944</td>
      <td>Robot Sound</td>
      <td>Robot Sound</td>
      <td>2016</td>
      <td>2016-01-27</td>
      <td>Sci-Fi</td>
      <td>117</td>
      <td>South Korea</td>
      <td>Korean, English</td>
      <td>Ho-jae Lee</td>
      <td>Soyoung Lee</td>
      <td>NaN</td>
      <td>Erik Brown, Soo-bin Chae, Dean Dawson, Lee Han...</td>
      <td>The plot revolves around a robotic satellite w...</td>
      <td>6.9</td>
      <td>191</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 2843718</td>
      <td>NaN</td>
      <td>3.0</td>
      <td>4.0</td>
      <td>1.950000</td>
    </tr>
    <tr>
      <th>75907</th>
      <td>tt4839424</td>
      <td>Qi che ren zong dong yuan</td>
      <td>Qi che ren zong dong yuan</td>
      <td>2015</td>
      <td>2015-07-03</td>
      <td>Animation, Adventure, Family</td>
      <td>85</td>
      <td>China</td>
      <td>Mandarin</td>
      <td>Jianrong Zhuo</td>
      <td>NaN</td>
      <td>Xiamen Lanhuoyan Film Animation Co.</td>
      <td>Christopher Petrosian, Dawei Hu, Xinxuan Liu, ...</td>
      <td>The film revolves around a genius engineer who...</td>
      <td>1.1</td>
      <td>121</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>2.0</td>
      <td>NaN</td>
      <td>1.416667</td>
    </tr>
    <tr>
      <th>76214</th>
      <td>tt4937114</td>
      <td>Rogue Warrior: Robot Fighter</td>
      <td>Rogue Warrior: Robot Fighter</td>
      <td>2016</td>
      <td>2016-09-02</td>
      <td>Action, Sci-Fi</td>
      <td>101</td>
      <td>USA</td>
      <td>English</td>
      <td>Neil Johnson</td>
      <td>Neil Johnson</td>
      <td>Empire Motion pictures</td>
      <td>Tracey Birdsall, William Kircher, Daz Crawford...</td>
      <td>In the distant future, humanity is overthrown ...</td>
      <td>4.9</td>
      <td>2574</td>
      <td>$ 3800000</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>22.0</td>
      <td>26.0</td>
      <td>1.683333</td>
    </tr>
    <tr>
      <th>79921</th>
      <td>tt6197070</td>
      <td>Blood Machines</td>
      <td>Blood Machines</td>
      <td>2019</td>
      <td>2020-09-01</td>
      <td>Adventure, Music, Sci-Fi</td>
      <td>50</td>
      <td>France</td>
      <td>English</td>
      <td>Raphaël Hernandez, Seth Ickerman</td>
      <td>Raphaël Hernandez, Seth Ickerman</td>
      <td>Logical Pictures</td>
      <td>Elisa Lasowski, Anders Heinrichsen, Christian ...</td>
      <td>An artificial intelligence escapes her spacesh...</td>
      <td>6.1</td>
      <td>2023</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>70.0</td>
      <td>55.0</td>
      <td>0.833333</td>
    </tr>
    <tr>
      <th>83905</th>
      <td>tt8196068</td>
      <td>Twisted Pair</td>
      <td>Twisted Pair</td>
      <td>2018</td>
      <td>2018-10-03</td>
      <td>Drama, Fantasy, Sci-Fi</td>
      <td>89</td>
      <td>USA</td>
      <td>English</td>
      <td>Neil Breen</td>
      <td>Neil Breen</td>
      <td>Neil Breen Films</td>
      <td>Neil Breen, Sara Meritt, Siohbon Chevy Ebrahim...</td>
      <td>Identical twin brothers become hybrid A.I (art...</td>
      <td>5.9</td>
      <td>1313</td>
      <td>$ 3</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>69.0</td>
      <td>4.0</td>
      <td>1.483333</td>
    </tr>
    <tr>
      <th>84615</th>
      <td>tt8712750</td>
      <td>A.M.I.</td>
      <td>A.M.I.</td>
      <td>2019</td>
      <td>2019-07-02</td>
      <td>Horror, Thriller</td>
      <td>77</td>
      <td>Canada</td>
      <td>English</td>
      <td>Rusty Nixon</td>
      <td>Rusty Nixon, Evan Tylor</td>
      <td>1160594 B.C.</td>
      <td>Debs Howard, Philip Granger, Bonnie Hay, Sam R...</td>
      <td>A seventeen year old girl forms a co-dependent...</td>
      <td>3.9</td>
      <td>1399</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>91.0</td>
      <td>13.0</td>
      <td>1.283333</td>
    </tr>
    <tr>
      <th>85361</th>
      <td>tt9308170</td>
      <td>Özgür Dünya</td>
      <td>Özgür Dünya</td>
      <td>2019</td>
      <td>2019-03-22</td>
      <td>Action, Adventure, Family</td>
      <td>122</td>
      <td>Turkey</td>
      <td>Turkish</td>
      <td>Faruk Aksoy, Sevki Es</td>
      <td>Faruk Aksoy, Hüseyin Aksu</td>
      <td>Ay Yapim</td>
      <td>Murat Serezli, Rabia Soyturk, Gürbey Ileri, Ha...</td>
      <td>The story of a game managed by artificial inte...</td>
      <td>2.3</td>
      <td>340</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 50537</td>
      <td>NaN</td>
      <td>2.0</td>
      <td>NaN</td>
      <td>2.033333</td>
    </tr>
  </tbody>
</table>
</div>



or if you know the exact string you are looking for


```python
df[df['title'] == "Fight Club"]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>imdb_title_id</th>
      <th>title</th>
      <th>original_title</th>
      <th>year</th>
      <th>date_published</th>
      <th>genre</th>
      <th>duration</th>
      <th>country</th>
      <th>language</th>
      <th>director</th>
      <th>writer</th>
      <th>production_company</th>
      <th>actors</th>
      <th>description</th>
      <th>avg_vote</th>
      <th>votes</th>
      <th>budget</th>
      <th>usa_gross_income</th>
      <th>worlwide_gross_income</th>
      <th>metascore</th>
      <th>reviews_from_users</th>
      <th>reviews_from_critics</th>
      <th>duration (hours)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>32487</th>
      <td>tt0137523</td>
      <td>Fight Club</td>
      <td>Fight Club</td>
      <td>1999</td>
      <td>1999-10-29</td>
      <td>Drama</td>
      <td>139</td>
      <td>USA, Germany</td>
      <td>English</td>
      <td>David Fincher</td>
      <td>Chuck Palahniuk, Jim Uhls</td>
      <td>Fox 2000 Pictures</td>
      <td>Edward Norton, Brad Pitt, Meat Loaf, Zach Gren...</td>
      <td>An insomniac office worker and a devil-may-car...</td>
      <td>8.8</td>
      <td>1807440</td>
      <td>$ 63000000</td>
      <td>$ 37030102</td>
      <td>$ 101218804</td>
      <td>66.0</td>
      <td>3758.0</td>
      <td>370.0</td>
      <td>2.316667</td>
    </tr>
  </tbody>
</table>
</div>



##### 5.1.4.2.2 By numerical value


```python
df[df['votes'] > 1000]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>imdb_title_id</th>
      <th>title</th>
      <th>original_title</th>
      <th>year</th>
      <th>date_published</th>
      <th>genre</th>
      <th>duration</th>
      <th>country</th>
      <th>language</th>
      <th>director</th>
      <th>writer</th>
      <th>production_company</th>
      <th>actors</th>
      <th>description</th>
      <th>avg_vote</th>
      <th>votes</th>
      <th>budget</th>
      <th>usa_gross_income</th>
      <th>worlwide_gross_income</th>
      <th>metascore</th>
      <th>reviews_from_users</th>
      <th>reviews_from_critics</th>
      <th>duration (hours)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>4</th>
      <td>tt0002130</td>
      <td>L'Inferno</td>
      <td>L'Inferno</td>
      <td>1911</td>
      <td>1911-03-06</td>
      <td>Adventure, Drama, Fantasy</td>
      <td>68</td>
      <td>Italy</td>
      <td>Italian</td>
      <td>Francesco Bertolini, Adolfo Padovan</td>
      <td>Dante Alighieri</td>
      <td>Milano Film</td>
      <td>Salvatore Papa, Arturo Pirovano, Giuseppe de L...</td>
      <td>Loosely adapted from Dante's Divine Comedy and...</td>
      <td>7.0</td>
      <td>2237</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>31.0</td>
      <td>14.0</td>
      <td>1.133333</td>
    </tr>
    <tr>
      <th>11</th>
      <td>tt0002844</td>
      <td>Fantômas - À l'ombre de la guillotine</td>
      <td>Fantômas - À l'ombre de la guillotine</td>
      <td>1913</td>
      <td>1913-05-12</td>
      <td>Crime, Drama</td>
      <td>54</td>
      <td>France</td>
      <td>French</td>
      <td>Louis Feuillade</td>
      <td>Marcel Allain, Louis Feuillade</td>
      <td>Société des Etablissements L. Gaumont</td>
      <td>René Navarre, Edmund Breon, Georges Melchior, ...</td>
      <td>Inspector Juve is tasked to investigate and ca...</td>
      <td>7.0</td>
      <td>1944</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>9.0</td>
      <td>28.0</td>
      <td>0.900000</td>
    </tr>
    <tr>
      <th>13</th>
      <td>tt0003037</td>
      <td>Juve contre Fantômas</td>
      <td>Juve contre Fantômas</td>
      <td>1913</td>
      <td>1913-09-08</td>
      <td>Crime, Drama</td>
      <td>61</td>
      <td>France</td>
      <td>French</td>
      <td>Louis Feuillade</td>
      <td>Marcel Allain, Louis Feuillade</td>
      <td>Société des Etablissements L. Gaumont</td>
      <td>René Navarre, Edmund Breon, Georges Melchior, ...</td>
      <td>In Part Two of Louis Feuillade's 5 1/2-hour ep...</td>
      <td>7.0</td>
      <td>1349</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>8.0</td>
      <td>23.0</td>
      <td>1.016667</td>
    </tr>
    <tr>
      <th>16</th>
      <td>tt0003165</td>
      <td>Le mort qui tue</td>
      <td>Le mort qui tue</td>
      <td>1913</td>
      <td>1913-11-06</td>
      <td>Crime, Drama, Mystery</td>
      <td>90</td>
      <td>France</td>
      <td>French</td>
      <td>Louis Feuillade</td>
      <td>Marcel Allain, Louis Feuillade</td>
      <td>Société des Etablissements L. Gaumont</td>
      <td>René Navarre, Edmund Breon, Georges Melchior, ...</td>
      <td>After a body disappears from inside the prison...</td>
      <td>7.0</td>
      <td>1050</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>6.0</td>
      <td>18.0</td>
      <td>1.500000</td>
    </tr>
    <tr>
      <th>18</th>
      <td>tt0003419</td>
      <td>Lo studente di Praga</td>
      <td>Der Student von Prag</td>
      <td>1913</td>
      <td>1913-08-22</td>
      <td>Drama, Fantasy, Horror</td>
      <td>85</td>
      <td>Germany</td>
      <td>German, English</td>
      <td>Paul Wegener, Stellan Rye</td>
      <td>Hanns Heinz Ewers, Hanns Heinz Ewers</td>
      <td>Deutsche Bioscop GmbH</td>
      <td>Paul Wegener, Grete Berger, Lyda Salmonova, Jo...</td>
      <td>Balduin, a student of Prague, leaves his royst...</td>
      <td>6.5</td>
      <td>1768</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>20.0</td>
      <td>26.0</td>
      <td>1.416667</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>85811</th>
      <td>tt9860728</td>
      <td>Falling Inn Love - Ristrutturazione con amore</td>
      <td>Falling Inn Love</td>
      <td>2019</td>
      <td>2019-08-29</td>
      <td>Comedy, Romance</td>
      <td>98</td>
      <td>USA</td>
      <td>English</td>
      <td>Roger Kumble</td>
      <td>Elizabeth Hackett, Hilary Galanoy</td>
      <td>NaN</td>
      <td>Christina Milian, Adam Demos, Jeffrey Bowyer-C...</td>
      <td>When city girl Gabriela spontaneously enters a...</td>
      <td>5.6</td>
      <td>14108</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>265.0</td>
      <td>32.0</td>
      <td>1.633333</td>
    </tr>
    <tr>
      <th>85817</th>
      <td>tt9866700</td>
      <td>Paranormal Investigation</td>
      <td>Paranormal Investigation</td>
      <td>2018</td>
      <td>2018-12-01</td>
      <td>Horror, Thriller</td>
      <td>92</td>
      <td>France</td>
      <td>French</td>
      <td>Franck Phelizon</td>
      <td>NaN</td>
      <td>Baril Pictures</td>
      <td>Jose Atuncar, Claudine Bertin, Cedric Henquez,...</td>
      <td>When a young man becomes possessed after playi...</td>
      <td>3.7</td>
      <td>1299</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>334.0</td>
      <td>11.0</td>
      <td>1.533333</td>
    </tr>
    <tr>
      <th>85837</th>
      <td>tt9894470</td>
      <td>VFW</td>
      <td>VFW</td>
      <td>2019</td>
      <td>2020-02-14</td>
      <td>Action, Crime, Horror</td>
      <td>92</td>
      <td>USA</td>
      <td>English</td>
      <td>Joe Begos</td>
      <td>Max Brallier, Matthew McArdle</td>
      <td>Fangoria</td>
      <td>Stephen Lang, William Sadler, Fred Williamson,...</td>
      <td>A group of old war veterans put their lives on...</td>
      <td>6.1</td>
      <td>4178</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 23101</td>
      <td>72.0</td>
      <td>83.0</td>
      <td>94.0</td>
      <td>1.533333</td>
    </tr>
    <tr>
      <th>85839</th>
      <td>tt9898858</td>
      <td>Coffee &amp; Kareem</td>
      <td>Coffee &amp; Kareem</td>
      <td>2020</td>
      <td>2020-04-03</td>
      <td>Action, Comedy</td>
      <td>88</td>
      <td>USA</td>
      <td>English</td>
      <td>Michael Dowse</td>
      <td>Shane Mack</td>
      <td>Pacific Electric Picture Company</td>
      <td>Ed Helms, Taraji P. Henson, Terrence Little Ga...</td>
      <td>Twelve-year-old Kareem Manning hires a crimina...</td>
      <td>5.1</td>
      <td>10627</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>35.0</td>
      <td>388.0</td>
      <td>64.0</td>
      <td>1.466667</td>
    </tr>
    <tr>
      <th>85843</th>
      <td>tt9900782</td>
      <td>Kaithi</td>
      <td>Kaithi</td>
      <td>2019</td>
      <td>2019-10-25</td>
      <td>Action, Thriller</td>
      <td>145</td>
      <td>India</td>
      <td>Tamil</td>
      <td>Lokesh Kanagaraj</td>
      <td>Lokesh Kanagaraj, Pon Parthiban</td>
      <td>Dream Warrior Pictures</td>
      <td>Karthi, Narain, Ramana, George Maryan, Harish ...</td>
      <td>A recently released prisoner becomes involved ...</td>
      <td>8.5</td>
      <td>8400</td>
      <td>INR 240000000</td>
      <td>NaN</td>
      <td>$ 524061</td>
      <td>NaN</td>
      <td>188.0</td>
      <td>8.0</td>
      <td>2.416667</td>
    </tr>
  </tbody>
</table>
<p>29362 rows × 23 columns</p>
</div>



##### 🏋️ Exercise 4: Filtering

* Filter `df` for all the movies that are longer than 2 hours
* Filter `df` for all movies where 'day' is in the title


```python
# Cell for Ex 4
```

#### 5.1.4.3 Select, filter, operation

The real power of Pandas comes in its tools for grouping and aggregating data. Here we'll look at *value counts* and the basics of *group-by* operations.


```python
# a basic select, filter, operate procedure would look like:
df[df['country'] == 'USA']['duration'].describe()
```




    count    28511.000000
    mean        93.050437
    std         18.576873
    min         42.000000
    25%         84.000000
    50%         91.000000
    75%        100.000000
    max        398.000000
    Name: duration, dtype: float64



we can invert the selection with `~`


```python
df[~(df['country'] == 'USA')]['duration'].describe()
```




    count    57344.000000
    mean       103.981410
    std         23.459158
    min         41.000000
    25%         90.000000
    50%         99.000000
    75%        112.000000
    max        808.000000
    Name: duration, dtype: float64



In preparation for grouping the data, let's bin the instances by their duration (we could have chosen any numerical column). For that, we'll use ``pd.cut``.  The documentation for ``pd.cut`` can be found [here](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.cut.html). It is used to bin values into discrete intervals.  This is like a histogram where for each *bin* along the range of data values, you count the number of occurrences of that bin.  in our example, we'll use 10 bins and let Pandas decide how to evenly divide the range into the bins.  Let's see it in action.

```
df['duration_group'] = pd.cut(df['duration'], 10)
df.head()
df.dtypes
```


```python
df['duration_group'] = pd.cut(df['duration'], 10)
```


```python
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>imdb_title_id</th>
      <th>title</th>
      <th>original_title</th>
      <th>year</th>
      <th>date_published</th>
      <th>genre</th>
      <th>duration</th>
      <th>country</th>
      <th>language</th>
      <th>director</th>
      <th>writer</th>
      <th>production_company</th>
      <th>actors</th>
      <th>description</th>
      <th>avg_vote</th>
      <th>votes</th>
      <th>budget</th>
      <th>usa_gross_income</th>
      <th>worlwide_gross_income</th>
      <th>metascore</th>
      <th>reviews_from_users</th>
      <th>reviews_from_critics</th>
      <th>duration (hours)</th>
      <th>duration_group</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>tt0000009</td>
      <td>Miss Jerry</td>
      <td>Miss Jerry</td>
      <td>1894</td>
      <td>1894-10-09</td>
      <td>Romance</td>
      <td>45</td>
      <td>USA</td>
      <td>None</td>
      <td>Alexander Black</td>
      <td>Alexander Black</td>
      <td>Alexander Black Photoplays</td>
      <td>Blanche Bayliss, William Courtenay, Chauncey D...</td>
      <td>The adventures of a female reporter in the 1890s.</td>
      <td>5.9</td>
      <td>154</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>0.750000</td>
      <td>(40.233, 117.7]</td>
    </tr>
    <tr>
      <th>1</th>
      <td>tt0000574</td>
      <td>The Story of the Kelly Gang</td>
      <td>The Story of the Kelly Gang</td>
      <td>1906</td>
      <td>1906-12-26</td>
      <td>Biography, Crime, Drama</td>
      <td>70</td>
      <td>Australia</td>
      <td>None</td>
      <td>Charles Tait</td>
      <td>Charles Tait</td>
      <td>J. and N. Tait</td>
      <td>Elizabeth Tait, John Tait, Norman Campbell, Be...</td>
      <td>True story of notorious Australian outlaw Ned ...</td>
      <td>6.1</td>
      <td>589</td>
      <td>$ 2250</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>7.0</td>
      <td>7.0</td>
      <td>1.166667</td>
      <td>(40.233, 117.7]</td>
    </tr>
    <tr>
      <th>2</th>
      <td>tt0001892</td>
      <td>Den sorte drøm</td>
      <td>Den sorte drøm</td>
      <td>1911</td>
      <td>1911-08-19</td>
      <td>Drama</td>
      <td>53</td>
      <td>Germany, Denmark</td>
      <td>NaN</td>
      <td>Urban Gad</td>
      <td>Urban Gad, Gebhard Schätzler-Perasini</td>
      <td>Fotorama</td>
      <td>Asta Nielsen, Valdemar Psilander, Gunnar Helse...</td>
      <td>Two men of high rank are both wooing the beaut...</td>
      <td>5.8</td>
      <td>188</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>5.0</td>
      <td>2.0</td>
      <td>0.883333</td>
      <td>(40.233, 117.7]</td>
    </tr>
    <tr>
      <th>3</th>
      <td>tt0002101</td>
      <td>Cleopatra</td>
      <td>Cleopatra</td>
      <td>1912</td>
      <td>1912-11-13</td>
      <td>Drama, History</td>
      <td>100</td>
      <td>USA</td>
      <td>English</td>
      <td>Charles L. Gaskill</td>
      <td>Victorien Sardou</td>
      <td>Helen Gardner Picture Players</td>
      <td>Helen Gardner, Pearl Sindelar, Miss Fielding, ...</td>
      <td>The fabled queen of Egypt's affair with Roman ...</td>
      <td>5.2</td>
      <td>446</td>
      <td>$ 45000</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>25.0</td>
      <td>3.0</td>
      <td>1.666667</td>
      <td>(40.233, 117.7]</td>
    </tr>
    <tr>
      <th>4</th>
      <td>tt0002130</td>
      <td>L'Inferno</td>
      <td>L'Inferno</td>
      <td>1911</td>
      <td>1911-03-06</td>
      <td>Adventure, Drama, Fantasy</td>
      <td>68</td>
      <td>Italy</td>
      <td>Italian</td>
      <td>Francesco Bertolini, Adolfo Padovan</td>
      <td>Dante Alighieri</td>
      <td>Milano Film</td>
      <td>Salvatore Papa, Arturo Pirovano, Giuseppe de L...</td>
      <td>Loosely adapted from Dante's Divine Comedy and...</td>
      <td>7.0</td>
      <td>2237</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>31.0</td>
      <td>14.0</td>
      <td>1.133333</td>
      <td>(40.233, 117.7]</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.dtypes
```




    imdb_title_id              object
    title                      object
    original_title             object
    year                       object
    date_published             object
    genre                      object
    duration                    int64
    country                    object
    language                   object
    director                   object
    writer                     object
    production_company         object
    actors                     object
    description                object
    avg_vote                  float64
    votes                       int64
    budget                     object
    usa_gross_income           object
    worlwide_gross_income      object
    metascore                 float64
    reviews_from_users        float64
    reviews_from_critics      float64
    duration (hours)          float64
    duration_group           category
    dtype: object



Pandas includes an array of useful functionality for manipulating and analyzing tabular data.
We'll take a look at two of these here.

The ``pandas.value_counts`` returns statistics on the unique values within each column.

We can use it, for example, to break down the movies by their duration group that we just created:

```
pd.value_counts(df['duration_group'], sort=False)
```


```python
pd.value_counts(df['duration_group'], sort=False)
```




    (40.233, 117.7]    72368
    (117.7, 194.4]     13197
    (194.4, 271.1]       228
    (271.1, 347.8]        40
    (347.8, 424.5]        11
    (424.5, 501.2]         4
    (501.2, 577.9]         4
    (577.9, 654.6]         1
    (654.6, 731.3]         1
    (731.3, 808.0]         1
    Name: duration_group, dtype: int64



What happens if we try this on a continuous valued variable?

```
pd.value_counts(df['duration'])
```


```python
pd.value_counts(df['duration'])
```




    90     5162
    95     3194
    100    3106
    92     2418
    93     2414
           ... 
    279       1
    301       1
    345       1
    729       1
    319       1
    Name: duration, Length: 266, dtype: int64



##### 🏋️ Exercise 5: `value_counts, unique, nunique`

We can do a little data exploration with this by seeing how common different values are. Play around with these pandas methods:

* `value_counts()`
* `unique()`
* `nunique()`

Also be sure to use:

* selection
* filteration
* (and you are already using operation with the above mentioned pandas methods, value_counts, unique, nunique (: )

Do so with 3 different columns in the dataframe


```python
# Cell for Exercise 5
```

#### 5.1.4.4 Group-by Operation

One of the killer features of the Pandas dataframe is the ability to do group-by operations.
You can visualize the group-by like this (image borrowed from the [Python Data Science Handbook](http://shop.oreilly.com/product/0636920034919.do))

![image](https://swcarpentry.github.io/r-novice-gapminder/fig/12-plyr-fig1.png)

#### 5.1.4.5 Summary statistics with groupby: `value_counts`,  `count`, `describe`

Let's break take this in smaller steps.
Recall our ``duration_group`` column.

```
pd.value_counts(df['duration_group'])
```


```python
pd.value_counts(df['duration_group'])
```




    (40.233, 117.7]    72368
    (117.7, 194.4]     13197
    (194.4, 271.1]       228
    (271.1, 347.8]        40
    (347.8, 424.5]        11
    (501.2, 577.9]         4
    (424.5, 501.2]         4
    (731.3, 808.0]         1
    (654.6, 731.3]         1
    (577.9, 654.6]         1
    Name: duration_group, dtype: int64



`groupby` allows us to look at the number of values for each column and each value.  The group by documentation is [here](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.groupby.html).  Basically, `groupby` allows us to create *groups* of records based on their values. Let's count how many records, or rows, in our data set fall into each bin of our duration data. 

```
df.groupby(['duration_group']).count()
```


```python
df.groupby(['duration_group']).count()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>imdb_title_id</th>
      <th>title</th>
      <th>original_title</th>
      <th>year</th>
      <th>date_published</th>
      <th>genre</th>
      <th>duration</th>
      <th>country</th>
      <th>language</th>
      <th>director</th>
      <th>writer</th>
      <th>production_company</th>
      <th>actors</th>
      <th>description</th>
      <th>avg_vote</th>
      <th>votes</th>
      <th>budget</th>
      <th>usa_gross_income</th>
      <th>worlwide_gross_income</th>
      <th>metascore</th>
      <th>reviews_from_users</th>
      <th>reviews_from_critics</th>
      <th>duration (hours)</th>
    </tr>
    <tr>
      <th>duration_group</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>(40.233, 117.7]</th>
      <td>72368</td>
      <td>72368</td>
      <td>72368</td>
      <td>72368</td>
      <td>72368</td>
      <td>72368</td>
      <td>72368</td>
      <td>72315</td>
      <td>71618</td>
      <td>72309</td>
      <td>71474</td>
      <td>68922</td>
      <td>72304</td>
      <td>70464</td>
      <td>72368</td>
      <td>72368</td>
      <td>19493</td>
      <td>12123</td>
      <td>24645</td>
      <td>10759</td>
      <td>65972</td>
      <td>63321</td>
      <td>72368</td>
    </tr>
    <tr>
      <th>(117.7, 194.4]</th>
      <td>13197</td>
      <td>13197</td>
      <td>13197</td>
      <td>13197</td>
      <td>13197</td>
      <td>13197</td>
      <td>13197</td>
      <td>13186</td>
      <td>13122</td>
      <td>13171</td>
      <td>12528</td>
      <td>12211</td>
      <td>13192</td>
      <td>12990</td>
      <td>13197</td>
      <td>13197</td>
      <td>4133</td>
      <td>3153</td>
      <td>6298</td>
      <td>2506</td>
      <td>12017</td>
      <td>10493</td>
      <td>13197</td>
    </tr>
    <tr>
      <th>(194.4, 271.1]</th>
      <td>228</td>
      <td>228</td>
      <td>228</td>
      <td>228</td>
      <td>228</td>
      <td>228</td>
      <td>228</td>
      <td>228</td>
      <td>221</td>
      <td>226</td>
      <td>221</td>
      <td>207</td>
      <td>228</td>
      <td>226</td>
      <td>228</td>
      <td>228</td>
      <td>70</td>
      <td>40</td>
      <td>59</td>
      <td>28</td>
      <td>215</td>
      <td>188</td>
      <td>228</td>
    </tr>
    <tr>
      <th>(271.1, 347.8]</th>
      <td>40</td>
      <td>40</td>
      <td>40</td>
      <td>40</td>
      <td>40</td>
      <td>40</td>
      <td>40</td>
      <td>40</td>
      <td>40</td>
      <td>40</td>
      <td>39</td>
      <td>39</td>
      <td>40</td>
      <td>38</td>
      <td>40</td>
      <td>40</td>
      <td>10</td>
      <td>5</td>
      <td>9</td>
      <td>8</td>
      <td>37</td>
      <td>37</td>
      <td>40</td>
    </tr>
    <tr>
      <th>(347.8, 424.5]</th>
      <td>11</td>
      <td>11</td>
      <td>11</td>
      <td>11</td>
      <td>11</td>
      <td>11</td>
      <td>11</td>
      <td>11</td>
      <td>10</td>
      <td>11</td>
      <td>11</td>
      <td>10</td>
      <td>11</td>
      <td>11</td>
      <td>11</td>
      <td>11</td>
      <td>1</td>
      <td>3</td>
      <td>3</td>
      <td>1</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
    <tr>
      <th>(424.5, 501.2]</th>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
    </tr>
    <tr>
      <th>(501.2, 577.9]</th>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>4</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
    </tr>
    <tr>
      <th>(577.9, 654.6]</th>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>(654.6, 731.3]</th>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>(731.3, 808.0]</th>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>



Now, let's find the mean of each of the columns for each ``duration_group``.  *Notice* what happens to the non-numeric columns.

```
df.groupby(['duration_group']).mean()
```


```python
df.groupby(['duration_group']).mean()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>duration</th>
      <th>avg_vote</th>
      <th>votes</th>
      <th>metascore</th>
      <th>reviews_from_users</th>
      <th>reviews_from_critics</th>
      <th>duration (hours)</th>
    </tr>
    <tr>
      <th>duration_group</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>(40.233, 117.7]</th>
      <td>93.147026</td>
      <td>5.786671</td>
      <td>6604.507932</td>
      <td>54.153267</td>
      <td>35.944037</td>
      <td>24.517601</td>
      <td>1.552450</td>
    </tr>
    <tr>
      <th>(117.7, 194.4]</th>
      <td>136.552550</td>
      <td>6.488513</td>
      <td>25010.089414</td>
      <td>63.042298</td>
      <td>100.725639</td>
      <td>45.365958</td>
      <td>2.275876</td>
    </tr>
    <tr>
      <th>(194.4, 271.1]</th>
      <td>220.394737</td>
      <td>6.997368</td>
      <td>30003.302632</td>
      <td>76.500000</td>
      <td>94.711628</td>
      <td>29.015957</td>
      <td>3.673246</td>
    </tr>
    <tr>
      <th>(271.1, 347.8]</th>
      <td>302.975000</td>
      <td>6.810000</td>
      <td>4201.275000</td>
      <td>79.375000</td>
      <td>19.378378</td>
      <td>21.513514</td>
      <td>5.049583</td>
    </tr>
    <tr>
      <th>(347.8, 424.5]</th>
      <td>384.636364</td>
      <td>7.181818</td>
      <td>2602.545455</td>
      <td>89.000000</td>
      <td>18.333333</td>
      <td>18.100000</td>
      <td>6.410606</td>
    </tr>
    <tr>
      <th>(424.5, 501.2]</th>
      <td>454.000000</td>
      <td>7.700000</td>
      <td>2589.000000</td>
      <td>59.000000</td>
      <td>19.250000</td>
      <td>24.500000</td>
      <td>7.566667</td>
    </tr>
    <tr>
      <th>(501.2, 577.9]</th>
      <td>547.500000</td>
      <td>7.875000</td>
      <td>206.500000</td>
      <td>NaN</td>
      <td>1.500000</td>
      <td>8.666667</td>
      <td>9.125000</td>
    </tr>
    <tr>
      <th>(577.9, 654.6]</th>
      <td>580.000000</td>
      <td>5.800000</td>
      <td>157.000000</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>9.666667</td>
    </tr>
    <tr>
      <th>(654.6, 731.3]</th>
      <td>729.000000</td>
      <td>7.800000</td>
      <td>1126.000000</td>
      <td>87.000000</td>
      <td>13.000000</td>
      <td>30.000000</td>
      <td>12.150000</td>
    </tr>
    <tr>
      <th>(731.3, 808.0]</th>
      <td>808.000000</td>
      <td>7.700000</td>
      <td>473.000000</td>
      <td>77.000000</td>
      <td>5.000000</td>
      <td>23.000000</td>
      <td>13.466667</td>
    </tr>
  </tbody>
</table>
</div>



You can specify a groupby using the names of table columns and compute other functions, such as the ``sum``, ``count``, ``std``, and ``describe``.

```
df.groupby(['duration_group'])['metascore'].describe()
```


```python
df.groupby(['duration_group'])['metascore'].describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>count</th>
      <th>mean</th>
      <th>std</th>
      <th>min</th>
      <th>25%</th>
      <th>50%</th>
      <th>75%</th>
      <th>max</th>
    </tr>
    <tr>
      <th>duration_group</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>(40.233, 117.7]</th>
      <td>10759.0</td>
      <td>54.153267</td>
      <td>17.655622</td>
      <td>1.0</td>
      <td>41.00</td>
      <td>55.0</td>
      <td>67.00</td>
      <td>100.0</td>
    </tr>
    <tr>
      <th>(117.7, 194.4]</th>
      <td>2506.0</td>
      <td>63.042298</td>
      <td>16.265137</td>
      <td>9.0</td>
      <td>52.00</td>
      <td>64.0</td>
      <td>75.00</td>
      <td>100.0</td>
    </tr>
    <tr>
      <th>(194.4, 271.1]</th>
      <td>28.0</td>
      <td>76.500000</td>
      <td>20.532720</td>
      <td>10.0</td>
      <td>69.75</td>
      <td>82.0</td>
      <td>90.00</td>
      <td>100.0</td>
    </tr>
    <tr>
      <th>(271.1, 347.8]</th>
      <td>8.0</td>
      <td>79.375000</td>
      <td>12.070478</td>
      <td>56.0</td>
      <td>72.25</td>
      <td>84.5</td>
      <td>88.25</td>
      <td>90.0</td>
    </tr>
    <tr>
      <th>(347.8, 424.5]</th>
      <td>1.0</td>
      <td>89.000000</td>
      <td>NaN</td>
      <td>89.0</td>
      <td>89.00</td>
      <td>89.0</td>
      <td>89.00</td>
      <td>89.0</td>
    </tr>
    <tr>
      <th>(424.5, 501.2]</th>
      <td>1.0</td>
      <td>59.000000</td>
      <td>NaN</td>
      <td>59.0</td>
      <td>59.00</td>
      <td>59.0</td>
      <td>59.00</td>
      <td>59.0</td>
    </tr>
    <tr>
      <th>(501.2, 577.9]</th>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>(577.9, 654.6]</th>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>(654.6, 731.3]</th>
      <td>1.0</td>
      <td>87.000000</td>
      <td>NaN</td>
      <td>87.0</td>
      <td>87.00</td>
      <td>87.0</td>
      <td>87.00</td>
      <td>87.0</td>
    </tr>
    <tr>
      <th>(731.3, 808.0]</th>
      <td>1.0</td>
      <td>77.000000</td>
      <td>NaN</td>
      <td>77.0</td>
      <td>77.00</td>
      <td>77.0</td>
      <td>77.00</td>
      <td>77.0</td>
    </tr>
  </tbody>
</table>
</div>



The simplest version of a groupby looks like this, and you can use almost any aggregation function you wish (mean, median, sum, minimum, maximum, standard deviation, count, etc.)

```
<data object>.groupby(<grouping values>).<aggregate>()
```

You can even group by multiple values: for example we can look at the metascore grouped by the ``duration_group`` and ``country``.


```python
df.groupby(['duration_group', 'country'])['metascore'].describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th></th>
      <th>count</th>
      <th>mean</th>
      <th>std</th>
      <th>min</th>
      <th>25%</th>
      <th>50%</th>
      <th>75%</th>
      <th>max</th>
    </tr>
    <tr>
      <th>duration_group</th>
      <th>country</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="5" valign="top">(40.233, 117.7]</th>
      <th>Afghanistan, France</th>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Afghanistan, France, Germany, UK</th>
      <td>1.0</td>
      <td>64.0</td>
      <td>NaN</td>
      <td>64.0</td>
      <td>64.0</td>
      <td>64.0</td>
      <td>64.0</td>
      <td>64.0</td>
    </tr>
    <tr>
      <th>Afghanistan, Iran</th>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Afghanistan, Ireland, Japan, Iran, Netherlands</th>
      <td>1.0</td>
      <td>83.0</td>
      <td>NaN</td>
      <td>83.0</td>
      <td>83.0</td>
      <td>83.0</td>
      <td>83.0</td>
      <td>83.0</td>
    </tr>
    <tr>
      <th>Albania</th>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>...</th>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th rowspan="2" valign="top">(501.2, 577.9]</th>
      <th>Philippines, Netherlands, Sweden</th>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>Russia</th>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>(577.9, 654.6]</th>
      <th>Soviet Union</th>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>(654.6, 731.3]</th>
      <th>France</th>
      <td>1.0</td>
      <td>87.0</td>
      <td>NaN</td>
      <td>87.0</td>
      <td>87.0</td>
      <td>87.0</td>
      <td>87.0</td>
      <td>87.0</td>
    </tr>
    <tr>
      <th>(731.3, 808.0]</th>
      <th>Argentina</th>
      <td>1.0</td>
      <td>77.0</td>
      <td>NaN</td>
      <td>77.0</td>
      <td>77.0</td>
      <td>77.0</td>
      <td>77.0</td>
      <td>77.0</td>
    </tr>
  </tbody>
</table>
<p>5565 rows × 8 columns</p>
</div>



##### 🏋️ Exercise 6: Group-by

<ol>
<li>use <code>pd.cut</code> to perform a grouping of one or more of the dataframe columns
<li>use <code>groupby</code> to group by that (those) columns and then perform
<li>three different statistical summaries in three separate instances




```python
# Cell for excercise 6
```
