<a href="https://colab.research.google.com/github/wesleybeckner/python_foundations/blob/main/notebooks/solutions/SOLN_S5_Pandas.ipynb" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>

# Python Foundations, Session 5: Pandas

**Instructor**: Wesley Beckner<br>

**Contact**: wesleybeckner@gmail.com

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


```python
# I could od it htis way...
# PROS
# I only have to import once for everything I might use in this package
# GOOD FOR WHEN I WILL USE LOTS OF MODULES/FUNCTIONS
# import sklearn
# dataset = sklearn.datasets.load_wine()

# or i could do it this way...
# PROS
# save on memory
# the namespace variable is load_wine vs sklearn.datasets.load_wine
# GOOD IF I DO NOT PLAN TO USE ANyTHIGN ELSE IN SKLEARN
from sklearn.datasets import load_wine
dataset = load_wine()
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

    /usr/local/lib/python3.7/dist-packages/IPython/core/interactiveshell.py:2718: DtypeWarning: Columns (3) have mixed types.Specify dtype option on import or set low_memory=False.
      interactivity=interactivity, compiler=compiler, result=result)


We can do this in a similar way with excel files. 


```python
pd.read_excel('https://raw.githubusercontent.com/wesleybeckner/ds_for_engineers/main/data/truffle_margin/margin_data.xlsx')
```





  <div id="df-61b9fbfa-d668-4c7e-aee1-23b4c8d6fd89">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-61b9fbfa-d668-4c7e-aee1-23b4c8d6fd89')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-61b9fbfa-d668-4c7e-aee1-23b4c8d6fd89 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-61b9fbfa-d668-4c7e-aee1-23b4c8d6fd89');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>




#### 5.1.2.2 from lists


```python
my_list = [[1, 2, 3], [3, 4, 5], [5, 6, 7], [7, 8, 9]]
pd.DataFrame(my_list)
```





  <div id="df-dc5baa39-1715-4bfe-874c-598360a5d089">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-dc5baa39-1715-4bfe-874c-598360a5d089')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-dc5baa39-1715-4bfe-874c-598360a5d089 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-dc5baa39-1715-4bfe-874c-598360a5d089');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>





```python
pd.DataFrame([[1, 2, 3], [3, 4, 5], [5, 6, 7], [7, 8, 9]],
                   index=['a', 'b', 'c', 'd'], columns=['x', 'y', 'z'])
```





  <div id="df-2f492fc0-86af-4b4b-8409-a6864ec8abbc">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-2f492fc0-86af-4b4b-8409-a6864ec8abbc')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-2f492fc0-86af-4b4b-8409-a6864ec8abbc button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-2f492fc0-86af-4b4b-8409-a6864ec8abbc');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>




#### 5.1.2.3 from dictionaries


```python
from_dict = pd.DataFrame({'A': ['apple', 'airplane'], 'B': ['bannana', 'bubbles']})
from_dict
```





  <div id="df-6248a349-1ee0-43dd-8e9b-78493483da2f">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-6248a349-1ee0-43dd-8e9b-78493483da2f')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-6248a349-1ee0-43dd-8e9b-78493483da2f button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-6248a349-1ee0-43dd-8e9b-78493483da2f');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>





```python
from_dict.to_dict()
```




    {'A': {0: 'apple', 1: 'airplane'}, 'B': {0: 'bannana', 1: 'bubbles'}}



#### 🏋️ Exercise 2: Create a DataFrame

Create a dictionary with the following keys: `movies, songs, books`. In each key list your top 5 favorites in the cooresponding category. Then use `pd.DataFrame` to turn this into a dictionary.


```python
# Cell for Ex 2
my_dict = {'movies': ['Return of the King', 'The King', 'Harold and Maud', 
                      'Soul', 'Hook'],
           'songs': ['Claire de Lune', 'All The Things You Are',
                     'Brain Wax', 'Assasin', 'Run Away'],
           'books': ['Lonesome Dove', 'Sapiens', 'Black Swan',
                     'Ishmael', 'Road Less Traveled']}

my_df = pd.DataFrame(my_dict)
```

#### 5.1.2.4 on `pandas.Series`

pandas `Series` objects will percolate in our experience here and there, however they are not so important as for us to wish to spend dedicated time on them. For now, know that they are a lower-level data collection in the pandas framework. You can think of them as an individual column or row in the pandas dataframe. For more practice with these you can refer to [this documentation](https://www.w3resource.com/python-exercises/pandas/index-data-series.php)

### 5.1.3 Viewing pandas dataframes

The ``head()`` and ``tail()`` methods show us the first and last rows of the data.

```
df.head()
df.tail()
```


```python
df.head()
```





  <div id="df-c80caa5d-4260-45f3-88bd-ac597f151c79">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-c80caa5d-4260-45f3-88bd-ac597f151c79')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-c80caa5d-4260-45f3-88bd-ac597f151c79 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-c80caa5d-4260-45f3-88bd-ac597f151c79');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>





```python
df.tail()
```





  <div id="df-ae595a61-bfc5-489f-be4d-8ea8ee9234e2">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-ae595a61-bfc5-489f-be4d-8ea8ee9234e2')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-ae595a61-bfc5-489f-be4d-8ea8ee9234e2 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-ae595a61-bfc5-489f-be4d-8ea8ee9234e2');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
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





  <div id="df-dbd24862-2d5e-49f0-8733-372c1cb99d0e">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-dbd24862-2d5e-49f0-8733-372c1cb99d0e')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-dbd24862-2d5e-49f0-8733-372c1cb99d0e button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-dbd24862-2d5e-49f0-8733-372c1cb99d0e');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>




#### 🏋️ Exercise 3: Viewing DataFrames

Using the dataframe you made in exercise 1, return the following attributes: the datatype stored in each column, the column names, the indices, and the shape.


```python
my_df
```





  <div id="df-c276c660-ea1b-40b3-bcf5-6354a9d82b1d">
    <div class="colab-df-container">
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
      <th>movies</th>
      <th>songs</th>
      <th>books</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Return of the King</td>
      <td>Claire de Lune</td>
      <td>Lonesome Dove</td>
    </tr>
    <tr>
      <th>1</th>
      <td>The King</td>
      <td>All The Things You Are</td>
      <td>Sapiens</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Harold and Maud</td>
      <td>Brain Wax</td>
      <td>Black Swan</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Soul</td>
      <td>Assasin</td>
      <td>Ishmael</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Hook</td>
      <td>Run Away</td>
      <td>Road Less Traveled</td>
    </tr>
  </tbody>
</table>
</div>
      <button class="colab-df-convert" onclick="convertToInteractive('df-c276c660-ea1b-40b3-bcf5-6354a9d82b1d')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-c276c660-ea1b-40b3-bcf5-6354a9d82b1d button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-c276c660-ea1b-40b3-bcf5-6354a9d82b1d');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>





```python
# Cell for Ex 3
my_df.dtypes
```




    movies    object
    songs     object
    books     object
    dtype: object




```python
my_df.columns
```




    Index(['movies', 'songs', 'books'], dtype='object')




```python
my_df.index
```




    RangeIndex(start=0, stop=5, step=1)




```python
my_df.shape
```




    (5, 3)



### 5.1.4 Manipulating data with ``pandas``

Here we'll cover some key features of manipulating data with pandas

#### 5.1.4.1 Selection

Access columns by name using square-bracket indexing:

```
df['duration']
```


```python
df[['duration', 'title']]
```





  <div id="df-5dddbbd1-e937-441a-9c84-3d6d4d8918ee">
    <div class="colab-df-container">
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
      <th>title</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>45</td>
      <td>Miss Jerry</td>
    </tr>
    <tr>
      <th>1</th>
      <td>70</td>
      <td>The Story of the Kelly Gang</td>
    </tr>
    <tr>
      <th>2</th>
      <td>53</td>
      <td>Den sorte drøm</td>
    </tr>
    <tr>
      <th>3</th>
      <td>100</td>
      <td>Cleopatra</td>
    </tr>
    <tr>
      <th>4</th>
      <td>68</td>
      <td>L'Inferno</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>85850</th>
      <td>95</td>
      <td>Le lion</td>
    </tr>
    <tr>
      <th>85851</th>
      <td>103</td>
      <td>De Beentjes van Sint-Hildegard</td>
    </tr>
    <tr>
      <th>85852</th>
      <td>130</td>
      <td>Padmavyuhathile Abhimanyu</td>
    </tr>
    <tr>
      <th>85853</th>
      <td>98</td>
      <td>Sokagin Çocuklari</td>
    </tr>
    <tr>
      <th>85854</th>
      <td>74</td>
      <td>La vida sense la Sara Amat</td>
    </tr>
  </tbody>
</table>
<p>85855 rows × 2 columns</p>
</div>
      <button class="colab-df-convert" onclick="convertToInteractive('df-5dddbbd1-e937-441a-9c84-3d6d4d8918ee')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-5dddbbd1-e937-441a-9c84-3d6d4d8918ee button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-5dddbbd1-e937-441a-9c84-3d6d4d8918ee');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>




Mathematical operations on columns happen *element-wise*:

```
df['duration'] / 60
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





  <div id="df-5318856b-80c3-4104-8b81-37051ec8023a">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-5318856b-80c3-4104-8b81-37051ec8023a')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-5318856b-80c3-4104-8b81-37051ec8023a button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-5318856b-80c3-4104-8b81-37051ec8023a');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
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
df.loc[[0,1,2,3], [df.columns[1]]]
```





  <div id="df-dba6019d-4902-434b-bef5-2dd751a6dfa5">
    <div class="colab-df-container">
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
      <th>1</th>
      <td>The Story of the Kelly Gang</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Den sorte drøm</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Cleopatra</td>
    </tr>
  </tbody>
</table>
</div>
      <button class="colab-df-convert" onclick="convertToInteractive('df-dba6019d-4902-434b-bef5-2dd751a6dfa5')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-dba6019d-4902-434b-bef5-2dd751a6dfa5 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-dba6019d-4902-434b-bef5-2dd751a6dfa5');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>





```python
df.loc[:5:2, [df.columns[1]]]
```





  <div id="df-a288380a-7b64-400a-973e-783dd4030528">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-a288380a-7b64-400a-973e-783dd4030528')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-a288380a-7b64-400a-973e-783dd4030528 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-a288380a-7b64-400a-973e-783dd4030528');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>





```python
df.iloc[-5:, [3,5]]
```





  <div id="df-8bc4a5c3-31cd-485c-8fbc-5d5bae950a85">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-8bc4a5c3-31cd-485c-8fbc-5d5bae950a85')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-8bc4a5c3-31cd-485c-8fbc-5d5bae950a85 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-8bc4a5c3-31cd-485c-8fbc-5d5bae950a85');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
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





  <div id="df-02f3d4b8-cf3a-459b-9853-5376fcabce20">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-02f3d4b8-cf3a-459b-9853-5376fcabce20')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-02f3d4b8-cf3a-459b-9853-5376fcabce20 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-02f3d4b8-cf3a-459b-9853-5376fcabce20');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>





```python
mydf.loc[['a', 'b'], ['beta']]
```





  <div id="df-e4665fbf-505c-4f49-ad24-7e1815cdab56">
    <div class="colab-df-container">
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
      <th>beta</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>20</td>
    </tr>
    <tr>
      <th>b</th>
      <td>20</td>
    </tr>
  </tbody>
</table>
</div>
      <button class="colab-df-convert" onclick="convertToInteractive('df-e4665fbf-505c-4f49-ad24-7e1815cdab56')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-e4665fbf-505c-4f49-ad24-7e1815cdab56 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-e4665fbf-505c-4f49-ad24-7e1815cdab56');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>





```python
mydf.loc['a', 'alpha'] = 'mychange'
```


```python
mydf
```





  <div id="df-8abcb21f-1861-4776-969f-2a887a387ae9">
    <div class="colab-df-container">
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
      <td>mychange</td>
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-8abcb21f-1861-4776-969f-2a887a387ae9')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-8abcb21f-1861-4776-969f-2a887a387ae9 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-8abcb21f-1861-4776-969f-2a887a387ae9');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>





```python
# using this you will get a setting
# with copy warning (depending on your pandas warning settings)
mydf['alpha']['a'] = 'newchange'
```

    /usr/local/lib/python3.7/dist-packages/ipykernel_launcher.py:3: SettingWithCopyWarning: 
    A value is trying to be set on a copy of a slice from a DataFrame
    
    See the caveats in the documentation: https://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html#returning-a-view-versus-a-copy
      This is separate from the ipykernel package so we can avoid doing imports until


You want to use `loc` or `iloc` when setting new values to pandas dataframes.

##### 🏋️ Exercise 4: Selecting

select the first 10 rows of the country, genre, and year columns using `loc`. Repeat the same exercise using `iloc`


```python
# Cell for Ex 4
df.loc[:9, ['country', 'genre', 'year']]
```





  <div id="df-5373382a-47e5-4597-acd1-0da0f03eaabf">
    <div class="colab-df-container">
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
      <th>country</th>
      <th>genre</th>
      <th>year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>USA</td>
      <td>Romance</td>
      <td>1894</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Australia</td>
      <td>Biography, Crime, Drama</td>
      <td>1906</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Germany, Denmark</td>
      <td>Drama</td>
      <td>1911</td>
    </tr>
    <tr>
      <th>3</th>
      <td>USA</td>
      <td>Drama, History</td>
      <td>1912</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Italy</td>
      <td>Adventure, Drama, Fantasy</td>
      <td>1911</td>
    </tr>
    <tr>
      <th>5</th>
      <td>USA</td>
      <td>Biography, Drama</td>
      <td>1912</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Germany</td>
      <td>Biography, Drama, Romance</td>
      <td>1919</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Italy</td>
      <td>Drama, History</td>
      <td>1913</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Romania</td>
      <td>History, War</td>
      <td>1912</td>
    </tr>
    <tr>
      <th>9</th>
      <td>France, USA</td>
      <td>Drama</td>
      <td>1912</td>
    </tr>
  </tbody>
</table>
</div>
      <button class="colab-df-convert" onclick="convertToInteractive('df-5373382a-47e5-4597-acd1-0da0f03eaabf')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-5373382a-47e5-4597-acd1-0da0f03eaabf button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-5373382a-47e5-4597-acd1-0da0f03eaabf');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>





```python
df.iloc[:10, [7, 5, 3]]
```





  <div id="df-9397334b-e7fb-4a58-a81b-df2994acf030">
    <div class="colab-df-container">
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
      <th>country</th>
      <th>genre</th>
      <th>year</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>USA</td>
      <td>Romance</td>
      <td>1894</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Australia</td>
      <td>Biography, Crime, Drama</td>
      <td>1906</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Germany, Denmark</td>
      <td>Drama</td>
      <td>1911</td>
    </tr>
    <tr>
      <th>3</th>
      <td>USA</td>
      <td>Drama, History</td>
      <td>1912</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Italy</td>
      <td>Adventure, Drama, Fantasy</td>
      <td>1911</td>
    </tr>
    <tr>
      <th>5</th>
      <td>USA</td>
      <td>Biography, Drama</td>
      <td>1912</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Germany</td>
      <td>Biography, Drama, Romance</td>
      <td>1919</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Italy</td>
      <td>Drama, History</td>
      <td>1913</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Romania</td>
      <td>History, War</td>
      <td>1912</td>
    </tr>
    <tr>
      <th>9</th>
      <td>France, USA</td>
      <td>Drama</td>
      <td>1912</td>
    </tr>
  </tbody>
</table>
</div>
      <button class="colab-df-convert" onclick="convertToInteractive('df-9397334b-e7fb-4a58-a81b-df2994acf030')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-9397334b-e7fb-4a58-a81b-df2994acf030 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-9397334b-e7fb-4a58-a81b-df2994acf030');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>





```python
df.columns
```




    Index(['imdb_title_id', 'title', 'original_title', 'year', 'date_published',
           'genre', 'duration', 'country', 'language', 'director', 'writer',
           'production_company', 'actors', 'description', 'avg_vote', 'votes',
           'budget', 'usa_gross_income', 'worlwide_gross_income', 'metascore',
           'reviews_from_users', 'reviews_from_critics', 'duration (hours)'],
          dtype='object')



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
df['description'].str.contains('A.I.', na=False)
```


```python
for i in df.loc[df['description'].str.contains('A\.I\.', na=False)]['description']:
  print(i)
```

    An American journalist prenteds to be infected with A.I.D.S. to investigate the syndrome and provoke a public reaction.
    A twenty-something drag queen dies of A.I.D.S., but when his adoring ghost returns to the side of his surviving lover, he finds his lover doesn't exactly miss him.
    A three-paneled look at the worldwide A.I.D.S. crisis. Three tragic stories taking place in South Africa, China, and Montréal.
    A young programmer is selected to participate in a ground-breaking experiment in synthetic intelligence by evaluating the human qualities of a highly advanced humanoid A.I.
    In 2029 an ex-military drifter risks his life to protect a woman from her dangerous ex in the lawless State of Jefferson. He's aided by his A.I. implant Clyde who proves partner and friend.
    In a post-apocalyptic society, living underground as protection from pollution, the main concern is getting enough food and finding other survivors. A pollution-resistant android with A.I. is developed to help obtain this.



```python
df[df['description'].str.contains('artificial intelligence', na=False)]
```





  <div id="df-94f66a96-5ac6-4e55-9f8d-539dad33024c">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-94f66a96-5ac6-4e55-9f8d-539dad33024c')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-94f66a96-5ac6-4e55-9f8d-539dad33024c button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-94f66a96-5ac6-4e55-9f8d-539dad33024c');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>





```python
df.iloc[17920]#['description']
```




    imdb_title_id                                                    tt0075931
    title                                                  Generazione Proteus
    original_title                                                  Demon Seed
    year                                                                  1977
    date_published                                                  1977-12-31
    genre                                                       Horror, Sci-Fi
    duration                                                                94
    country                                                                USA
    language                                                           English
    director                                                    Donald Cammell
    writer                                        Dean R. Koontz, Robert Jaffe
    production_company                               Metro-Goldwyn-Mayer (MGM)
    actors                   Julie Christie, Fritz Weaver, Gerrit Graham, B...
    description              A scientist creates Proteus--an organic super ...
    avg_vote                                                               6.3
    votes                                                                 7994
    budget                                                                 NaN
    usa_gross_income                                                       NaN
    worlwide_gross_income                                                  NaN
    metascore                                                               55
    reviews_from_users                                                      71
    reviews_from_critics                                                    81
    duration (hours)                                                   1.56667
    Name: 17920, dtype: object



or if you know the exact string you are looking for


```python
df['title'] == "Fight Club"
```




    0        False
    1        False
    2        False
    3        False
    4        False
             ...  
    85850    False
    85851    False
    85852    False
    85853    False
    85854    False
    Name: title, Length: 85855, dtype: bool




```python
df[df['title'] == "Fight Club"]
```





  <div id="df-5c299950-636f-4b93-8b9a-a1b60b134df0">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-5c299950-636f-4b93-8b9a-a1b60b134df0')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-5c299950-636f-4b93-8b9a-a1b60b134df0 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-5c299950-636f-4b93-8b9a-a1b60b134df0');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>




##### 5.1.4.2.2 By numerical value


```python
df[df['votes'] > 1000]
```





  <div id="df-7d342923-359b-4802-be14-6bc0c080a608">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-7d342923-359b-4802-be14-6bc0c080a608')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-7d342923-359b-4802-be14-6bc0c080a608 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-7d342923-359b-4802-be14-6bc0c080a608');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>




##### 🏋️ Exercise 5: Filtering

* Filter `df` for all the movies that are longer than 2 hours
* Filter `df` for all movies where 'day' is in the title


```python
df.loc[df['duration'] > 120]

df.loc[df['title'].str.contains('day')]
```





  <div id="df-b6e83f1a-a6c4-45b8-9117-789f4cb204f6">
    <div class="colab-df-container">
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
      <th>80674</th>
      <td>tt6493286</td>
      <td>1987 - When the day comes</td>
      <td>1987</td>
      <td>2017</td>
      <td>2017-12-27</td>
      <td>Drama</td>
      <td>129</td>
      <td>South Korea</td>
      <td>Korean</td>
      <td>Joon-Hwan Jang</td>
      <td>Kyung-chan Kim</td>
      <td>Woojeung Film</td>
      <td>Yoon-seok Kim, Jung-woo Ha, Hae-Jin Yoo, Tae-r...</td>
      <td>In 1987 Korea under an oppressive military reg...</td>
      <td>7.7</td>
      <td>3462</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 53833618</td>
      <td>NaN</td>
      <td>21.0</td>
      <td>19.0</td>
      <td>2.15</td>
    </tr>
  </tbody>
</table>
</div>
      <button class="colab-df-convert" onclick="convertToInteractive('df-b6e83f1a-a6c4-45b8-9117-789f4cb204f6')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-b6e83f1a-a6c4-45b8-9117-789f4cb204f6 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-b6e83f1a-a6c4-45b8-9117-789f4cb204f6');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>





```python
# bitwise operators are & |
# contrast this iwht and / or
```


```python
# Cell for Ex 5
df.loc[(df['duration'] > 120) &
       (df['title'].str.contains('day'))]
```





  <div id="df-f704486e-7a5e-4bb0-8129-38516606ad40">
    <div class="colab-df-container">
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
      <th>10237</th>
      <td>tt0053652</td>
      <td>Bidaya wa nihaya</td>
      <td>Bidaya wa nihaya</td>
      <td>1960</td>
      <td>1960-10-31</td>
      <td>Drama</td>
      <td>130</td>
      <td>Egypt</td>
      <td>Arabic</td>
      <td>Salah Abouseif</td>
      <td>Salah Abouseif, Salah Erzine</td>
      <td>NaN</td>
      <td>Farid Shawqi, Omar Sharif, Aminah Rizq, Amal Z...</td>
      <td>After the death of the father, the family cons...</td>
      <td>7.9</td>
      <td>445</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>1.0</td>
      <td>2.166667</td>
    </tr>
    <tr>
      <th>17861</th>
      <td>tt0075765</td>
      <td>Black Sunday</td>
      <td>Black Sunday</td>
      <td>1977</td>
      <td>1977</td>
      <td>Adventure, Crime, Drama</td>
      <td>143</td>
      <td>USA</td>
      <td>English</td>
      <td>John Frankenheimer</td>
      <td>Thomas Harris, Ernest Lehman</td>
      <td>Paramount Pictures</td>
      <td>Robert Shaw, Bruce Dern, Marthe Keller, Fritz ...</td>
      <td>Black Sunday is the powerful story of a Black ...</td>
      <td>6.8</td>
      <td>6569</td>
      <td>NaN</td>
      <td>$ 15769322</td>
      <td>$ 15769322</td>
      <td>57.0</td>
      <td>85.0</td>
      <td>56.0</td>
      <td>2.383333</td>
    </tr>
    <tr>
      <th>22001</th>
      <td>tt0089324</td>
      <td>Idaya Kovil</td>
      <td>Idaya Kovil</td>
      <td>1985</td>
      <td>1985</td>
      <td>Drama, Romance</td>
      <td>160</td>
      <td>India</td>
      <td>Tamil, Telugu</td>
      <td>Mani Ratnam</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Ambika, Mohan, Radha</td>
      <td>Shankar, a budding singer loses his love, Gowr...</td>
      <td>6.2</td>
      <td>110</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>2.666667</td>
    </tr>
    <tr>
      <th>22424</th>
      <td>tt0090725</td>
      <td>Al-Bidaya</td>
      <td>Al-Bidaya</td>
      <td>1986</td>
      <td>1986</td>
      <td>Comedy, Drama, Fantasy</td>
      <td>123</td>
      <td>Egypt</td>
      <td>Arabic</td>
      <td>Salah Abouseif</td>
      <td>Lenine El-Ramli</td>
      <td>NaN</td>
      <td>Hamdy Ahmed, Safiyyah El-Umari, Gamil Ratib, Y...</td>
      <td>After a crash, a group of passengers are stran...</td>
      <td>7.4</td>
      <td>331</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>1.0</td>
      <td>1.0</td>
      <td>2.050000</td>
    </tr>
    <tr>
      <th>27458</th>
      <td>tt0107474</td>
      <td>Madadayo - Il compleanno</td>
      <td>Mâdadayo</td>
      <td>1993</td>
      <td>1993-05-15</td>
      <td>Drama</td>
      <td>134</td>
      <td>Japan</td>
      <td>Japanese, English</td>
      <td>Akira Kurosawa, Ishirô Honda</td>
      <td>Akira Kurosawa, Hyakken Uchida</td>
      <td>DENTSU Music And Entertainment</td>
      <td>Tatsuo Matsumura, Hisashi Igawa, George Tokoro...</td>
      <td>Following World War II, a retired professor ap...</td>
      <td>7.3</td>
      <td>4834</td>
      <td>$ 11900000</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>76.0</td>
      <td>41.0</td>
      <td>27.0</td>
      <td>2.233333</td>
    </tr>
    <tr>
      <th>36700</th>
      <td>tt0213969</td>
      <td>Padayappa</td>
      <td>Padayappa</td>
      <td>1999</td>
      <td>1999-04-10</td>
      <td>Action, Comedy, Drama</td>
      <td>181</td>
      <td>India</td>
      <td>Tamil</td>
      <td>K.S. Ravikumar</td>
      <td>K.S. Ravikumar</td>
      <td>Arunachala Cine Creations</td>
      <td>Shivaji Ganesan, Rajinikanth, Ramya Krishnan, ...</td>
      <td>The death of Padaiyappa's father destroys his ...</td>
      <td>8.1</td>
      <td>5336</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>INR 440000000</td>
      <td>NaN</td>
      <td>7.0</td>
      <td>1.0</td>
      <td>3.016667</td>
    </tr>
    <tr>
      <th>37637</th>
      <td>tt0237682</td>
      <td>Sadayam</td>
      <td>Sadayam</td>
      <td>1992</td>
      <td>1992-01-01</td>
      <td>Drama, Thriller</td>
      <td>147</td>
      <td>India</td>
      <td>Malayalam</td>
      <td>Sibi Malayil</td>
      <td>M.T. Vasudevan Nair</td>
      <td>NH Studioz</td>
      <td>Mohanlal, Janardanan, Kaveri, Mahesh, Mathu, M...</td>
      <td>Sadayam follows the final days of a condemned ...</td>
      <td>8.3</td>
      <td>594</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>4.0</td>
      <td>1.0</td>
      <td>2.450000</td>
    </tr>
    <tr>
      <th>40140</th>
      <td>tt0283878</td>
      <td>Amida-do dayori</td>
      <td>Amida-do dayori</td>
      <td>2002</td>
      <td>2002-10-05</td>
      <td>Drama</td>
      <td>127</td>
      <td>Japan</td>
      <td>Japanese</td>
      <td>Takashi Koizumi</td>
      <td>Takashi Koizumi, Keishi Nagi</td>
      <td>Asmik Ace Entertainment</td>
      <td>Akira Terao, Kanako Higuchi, Shoji Arano, Hisa...</td>
      <td>An urban Japanese couple decide to move to the...</td>
      <td>7.1</td>
      <td>171</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 3143540</td>
      <td>NaN</td>
      <td>3.0</td>
      <td>2.0</td>
      <td>2.116667</td>
    </tr>
    <tr>
      <th>45150</th>
      <td>tt0400234</td>
      <td>Black Friday</td>
      <td>Black Friday</td>
      <td>2004</td>
      <td>2007-02-09</td>
      <td>Action, Crime, Drama</td>
      <td>143</td>
      <td>India</td>
      <td>Hindi</td>
      <td>Anurag Kashyap</td>
      <td>Anurag Kashyap, Hussain Zaidi</td>
      <td>Mid Day Multimedia Limited</td>
      <td>Kay Kay Menon, Pavan Malhotra, Aditya Srivasta...</td>
      <td>A film about the investigations following the ...</td>
      <td>8.5</td>
      <td>18180</td>
      <td>NaN</td>
      <td>$ 35000</td>
      <td>$ 1610897</td>
      <td>76.0</td>
      <td>67.0</td>
      <td>15.0</td>
      <td>2.383333</td>
    </tr>
    <tr>
      <th>46475</th>
      <td>tt0430710</td>
      <td>Udayananu Tharam</td>
      <td>Udayananu Tharam</td>
      <td>2005</td>
      <td>2005-01-21</td>
      <td>Comedy</td>
      <td>162</td>
      <td>India</td>
      <td>Malayalam</td>
      <td>Roshan Andrews</td>
      <td>Roshan Andrews, Sreenivasan</td>
      <td>NaN</td>
      <td>Mohanlal, Sreenivasan, Mukesh, Meena, Jagathi ...</td>
      <td>An artist performs best when he doesn't know h...</td>
      <td>7.8</td>
      <td>1931</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>9.0</td>
      <td>NaN</td>
      <td>2.700000</td>
    </tr>
    <tr>
      <th>47718</th>
      <td>tt0460592</td>
      <td>Udayon</td>
      <td>Udayon</td>
      <td>2005</td>
      <td>2005-07-15</td>
      <td>Action, Drama, Family</td>
      <td>180</td>
      <td>India</td>
      <td>Malayalam</td>
      <td>Bhadran</td>
      <td>Bhadran, Bhadran</td>
      <td>Varnnachithra</td>
      <td>Mohanlal, Jagathi Sreekumar, Manoj K. Jayan, L...</td>
      <td>Udayon movie revolves around 75 year old Suran...</td>
      <td>4.3</td>
      <td>218</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>5.0</td>
      <td>NaN</td>
      <td>3.000000</td>
    </tr>
    <tr>
      <th>50955</th>
      <td>tt0867465</td>
      <td>Vinodayathra</td>
      <td>Vinodayathra</td>
      <td>2007</td>
      <td>2007-04-06</td>
      <td>Comedy, Drama, Romance</td>
      <td>130</td>
      <td>India</td>
      <td>Malayalam</td>
      <td>Sathyan Anthikad</td>
      <td>Sathyan Anthikad</td>
      <td>NaN</td>
      <td>Dileep, Mukesh, Meera Jasmine, Seetha, Innocen...</td>
      <td>Journey of Vinod from an irresponsible man to ...</td>
      <td>7.1</td>
      <td>744</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>2.166667</td>
    </tr>
    <tr>
      <th>52912</th>
      <td>tt1039989</td>
      <td>Sunday</td>
      <td>Sunday</td>
      <td>2008</td>
      <td>2008-01-25</td>
      <td>Action, Comedy, Mystery</td>
      <td>135</td>
      <td>India</td>
      <td>Hindi</td>
      <td>Rohit Shetty</td>
      <td>Robin Bhatt, Robin Bhatt</td>
      <td>Big Screen Entertainment</td>
      <td>Ajay Devgn, Ayesha Takia, Arshad Warsi, Irrfan...</td>
      <td>An amnesiac woman fears a missing day in her l...</td>
      <td>5.3</td>
      <td>2487</td>
      <td>INR 160000000</td>
      <td>NaN</td>
      <td>$ 7029441</td>
      <td>NaN</td>
      <td>15.0</td>
      <td>7.0</td>
      <td>2.250000</td>
    </tr>
    <tr>
      <th>53125</th>
      <td>tt1051907</td>
      <td>Kabadayi</td>
      <td>Kabadayi</td>
      <td>2007</td>
      <td>2007-12-14</td>
      <td>Action, Crime, Drama</td>
      <td>140</td>
      <td>Turkey</td>
      <td>Turkish</td>
      <td>Ömer Vargi</td>
      <td>Mevlut Acik, Fatih Demir</td>
      <td>Fida Film</td>
      <td>Sener Sen, Kenan Imirzalioglu, Ismail Hacioglu...</td>
      <td>Ali Osman is living a quiet life after years o...</td>
      <td>7.8</td>
      <td>19639</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 14760067</td>
      <td>NaN</td>
      <td>15.0</td>
      <td>6.0</td>
      <td>2.333333</td>
    </tr>
    <tr>
      <th>56569</th>
      <td>tt1292642</td>
      <td>Allah Ke Banday</td>
      <td>Allah Ke Banday</td>
      <td>2010</td>
      <td>2010-11-26</td>
      <td>Action, Crime, Drama</td>
      <td>123</td>
      <td>India</td>
      <td>Hindi, Marathi</td>
      <td>Faruk Kabir</td>
      <td>Faruk Kabir, Sarim Momin</td>
      <td>Rising Star Entertainment</td>
      <td>Varun Bhagwat, Vikram Gokhale, Zakir Hussain, ...</td>
      <td>Two impoverished youth take to crime, are held...</td>
      <td>6.2</td>
      <td>293</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 1063</td>
      <td>NaN</td>
      <td>7.0</td>
      <td>7.0</td>
      <td>2.050000</td>
    </tr>
    <tr>
      <th>64382</th>
      <td>tt2083355</td>
      <td>The Best Man Holiday</td>
      <td>The Best Man Holiday</td>
      <td>2013</td>
      <td>2014-07-03</td>
      <td>Comedy, Drama</td>
      <td>123</td>
      <td>USA</td>
      <td>English</td>
      <td>Malcolm D. Lee</td>
      <td>Malcolm D. Lee, Malcolm D. Lee</td>
      <td>Universal Pictures</td>
      <td>Monica Calhoun, Morris Chestnut, Melissa De So...</td>
      <td>When college friends reunite after 15 years ov...</td>
      <td>6.7</td>
      <td>14631</td>
      <td>$ 17000000</td>
      <td>$ 70525195</td>
      <td>$ 72835710</td>
      <td>59.0</td>
      <td>65.0</td>
      <td>58.0</td>
      <td>2.050000</td>
    </tr>
    <tr>
      <th>66043</th>
      <td>tt2292693</td>
      <td>Friday Killer</td>
      <td>Friday Killer</td>
      <td>2011</td>
      <td>2011-09-29</td>
      <td>Action</td>
      <td>139</td>
      <td>Thailand</td>
      <td>Thai</td>
      <td>Yuthlert Sippapak</td>
      <td>NaN</td>
      <td>Pranakorn Films</td>
      <td>Ploy Jindachote, Jaran 'See Tao' Petcharoen, S...</td>
      <td>Pae Uzi is a professional hitman who was relea...</td>
      <td>6.4</td>
      <td>130</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 108295</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>1.0</td>
      <td>2.316667</td>
    </tr>
    <tr>
      <th>67799</th>
      <td>tt2556308</td>
      <td>Holiday</td>
      <td>Holiday</td>
      <td>2014</td>
      <td>2014-06-06</td>
      <td>Action, Thriller</td>
      <td>160</td>
      <td>India</td>
      <td>Hindi</td>
      <td>A.R. Murugadoss</td>
      <td>A.R. Murugadoss, A.R. Murugadoss</td>
      <td>Cape of Good Films</td>
      <td>Akshay Kumar, Sonakshi Sinha, Freddy Daruwala,...</td>
      <td>A military officer uses his intellect and figh...</td>
      <td>7.2</td>
      <td>24965</td>
      <td>INR 500000000</td>
      <td>$ 706893</td>
      <td>$ 1390054</td>
      <td>NaN</td>
      <td>71.0</td>
      <td>2.0</td>
      <td>2.666667</td>
    </tr>
    <tr>
      <th>67895</th>
      <td>tt2574698</td>
      <td>Gunday</td>
      <td>Gunday</td>
      <td>2014</td>
      <td>2014-02-14</td>
      <td>Action, Drama, Romance</td>
      <td>152</td>
      <td>India</td>
      <td>Hindi, Bengali</td>
      <td>Ali Abbas Zafar</td>
      <td>Ali Abbas Zafar, Sanjay Masoomm</td>
      <td>Yash Raj Films</td>
      <td>Ranveer Singh, Arjun Kapoor, Priyanka Chopra, ...</td>
      <td>The lives of Calcutta's most powerful Gunday, ...</td>
      <td>2.4</td>
      <td>57453</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 843232</td>
      <td>NaN</td>
      <td>889.0</td>
      <td>21.0</td>
      <td>2.533333</td>
    </tr>
    <tr>
      <th>73614</th>
      <td>tt4073682</td>
      <td>Bugday</td>
      <td>Bugday</td>
      <td>2017</td>
      <td>2017-11-24</td>
      <td>Drama, Sci-Fi</td>
      <td>123</td>
      <td>Turkey, Germany, France, Sweden, Qatar</td>
      <td>English</td>
      <td>Semih Kaplanoglu</td>
      <td>Leyla Ipekci, Semih Kaplanoglu</td>
      <td>Kaplan Film</td>
      <td>Jean-Marc Barr, Ermin Bravo, Grigoriy Dobrygin...</td>
      <td>This film was inspired by a chapter from the Q...</td>
      <td>6.1</td>
      <td>1287</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 74017</td>
      <td>NaN</td>
      <td>9.0</td>
      <td>28.0</td>
      <td>2.050000</td>
    </tr>
    <tr>
      <th>76246</th>
      <td>tt4944460</td>
      <td>Everyday I Love You</td>
      <td>Everyday I Love You</td>
      <td>2015</td>
      <td>2015-11-08</td>
      <td>Drama, Romance</td>
      <td>122</td>
      <td>Philippines</td>
      <td>Filipino, Tagalog, English</td>
      <td>Mae Czarina Cruz</td>
      <td>Roumella Monge, John Raphael Gonzaga</td>
      <td>ABS-CBN Film Productions</td>
      <td>Enrique Gil, Liza Soberano, Gerald Anderson, A...</td>
      <td>Two people bound together in the same journey ...</td>
      <td>7.0</td>
      <td>405</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 2212624</td>
      <td>NaN</td>
      <td>4.0</td>
      <td>1.0</td>
      <td>2.033333</td>
    </tr>
    <tr>
      <th>78538</th>
      <td>tt5732522</td>
      <td>Holiday Makers</td>
      <td>Holiday Makers</td>
      <td>2016</td>
      <td>2016-09-20</td>
      <td>Comedy</td>
      <td>121</td>
      <td>Bulgaria</td>
      <td>Bulgarian</td>
      <td>Ivaylo Penchev</td>
      <td>Ivaylo Penchev, Bojan Petrov</td>
      <td>NaN</td>
      <td>Phillip Avramov, Milena Avramova, Vasil Banov,...</td>
      <td>The life of a tourist is Hell!</td>
      <td>6.8</td>
      <td>275</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>1.0</td>
      <td>2.016667</td>
    </tr>
    <tr>
      <th>80497</th>
      <td>tt6411322</td>
      <td>Holiday Inn: The New Irving Berlin Musical - Live</td>
      <td>Holiday Inn: The New Irving Berlin Musical - Live</td>
      <td>2017</td>
      <td>2017-01-14</td>
      <td>Musical</td>
      <td>128</td>
      <td>USA</td>
      <td>English</td>
      <td>David Horn</td>
      <td>Gordon Greenberg, Chad Hodge</td>
      <td>BroadwayHD</td>
      <td>Corbin Bleu, Bryce Pinkham, Lora Lee Gayer, Mo...</td>
      <td>Roundabout Theatre Company's live stage produc...</td>
      <td>7.4</td>
      <td>145</td>
      <td>NaN</td>
      <td>$ 144550</td>
      <td>$ 144550</td>
      <td>NaN</td>
      <td>5.0</td>
      <td>1.0</td>
      <td>2.133333</td>
    </tr>
    <tr>
      <th>80674</th>
      <td>tt6493286</td>
      <td>1987 - When the day comes</td>
      <td>1987</td>
      <td>2017</td>
      <td>2017-12-27</td>
      <td>Drama</td>
      <td>129</td>
      <td>South Korea</td>
      <td>Korean</td>
      <td>Joon-Hwan Jang</td>
      <td>Kyung-chan Kim</td>
      <td>Woojeung Film</td>
      <td>Yoon-seok Kim, Jung-woo Ha, Hae-Jin Yoo, Tae-r...</td>
      <td>In 1987 Korea under an oppressive military reg...</td>
      <td>7.7</td>
      <td>3462</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 53833618</td>
      <td>NaN</td>
      <td>21.0</td>
      <td>19.0</td>
      <td>2.150000</td>
    </tr>
    <tr>
      <th>80966</th>
      <td>tt6649794</td>
      <td>Sunday Holiday</td>
      <td>Sunday Holiday</td>
      <td>2017</td>
      <td>2017-07-14</td>
      <td>Comedy, Drama</td>
      <td>135</td>
      <td>India</td>
      <td>Malayalam</td>
      <td>Jis Joy</td>
      <td>Jis Joy, Urasu</td>
      <td>Maqtro Pictures</td>
      <td>Asif Ali, Aparna Balamurali, Sreenivasan, Lal ...</td>
      <td>Unni Mukundan who is very passionate about his...</td>
      <td>7.1</td>
      <td>1029</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 228878</td>
      <td>NaN</td>
      <td>11.0</td>
      <td>1.0</td>
      <td>2.250000</td>
    </tr>
    <tr>
      <th>81283</th>
      <td>tt6827298</td>
      <td>Love Today</td>
      <td>Love Today</td>
      <td>1997</td>
      <td>1997-05-09</td>
      <td>Drama, Romance</td>
      <td>151</td>
      <td>India</td>
      <td>Tamil</td>
      <td>Balasekaran</td>
      <td>Balasekaran</td>
      <td>Super Good Films</td>
      <td>Rajan P. Dev, Dhamu, Karan, Bindu Panikkar, Ra...</td>
      <td>Ganesh is obsessively in love with Sandhya, bu...</td>
      <td>6.9</td>
      <td>165</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>2.516667</td>
    </tr>
    <tr>
      <th>81649</th>
      <td>tt6998574</td>
      <td>Oru Kidayin Karunai Manu</td>
      <td>Oru Kidayin Karunai Manu</td>
      <td>2017</td>
      <td>2017-06-02</td>
      <td>Drama</td>
      <td>121</td>
      <td>India</td>
      <td>Tamil</td>
      <td>Suresh Sangaiah</td>
      <td>Suresh Sangaiah</td>
      <td>Eros International</td>
      <td>Raveena Ravi, Vidharth</td>
      <td>The newlywed Ramamoorthy and his clan are head...</td>
      <td>7.7</td>
      <td>282</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>2.0</td>
      <td>1.0</td>
      <td>2.016667</td>
    </tr>
    <tr>
      <th>82686</th>
      <td>tt7502214</td>
      <td>Seven Sundays</td>
      <td>Seven Sundays</td>
      <td>2017</td>
      <td>2017-10-11</td>
      <td>Comedy, Drama</td>
      <td>128</td>
      <td>Philippines</td>
      <td>Filipino, Tagalog</td>
      <td>Cathy Garcia-Molina</td>
      <td>Vanessa R. Valdez, Roumella Monge</td>
      <td>Star Cinema</td>
      <td>Ronaldo Valdez, Aga Muhlach, Dingdong Dantes, ...</td>
      <td>The Bonifacio siblings reunite when they find ...</td>
      <td>7.8</td>
      <td>322</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 214641</td>
      <td>NaN</td>
      <td>8.0</td>
      <td>NaN</td>
      <td>2.133333</td>
    </tr>
    <tr>
      <th>83173</th>
      <td>tt7760084</td>
      <td>Padayottam</td>
      <td>Padayottam</td>
      <td>2018</td>
      <td>2018-09-14</td>
      <td>Comedy, Crime</td>
      <td>134</td>
      <td>India</td>
      <td>Malayalam</td>
      <td>Rafeek Ibrahim, Nithin Michael</td>
      <td>Arun A.R., Ajai Rahul</td>
      <td>Weekend Blockbusters</td>
      <td>Biju Menon, Dileesh Pothan, Saiju Kurup, Sudhi...</td>
      <td>The story revolves around a local don Chenkal ...</td>
      <td>6.2</td>
      <td>404</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>$ 142058</td>
      <td>NaN</td>
      <td>6.0</td>
      <td>1.0</td>
      <td>2.233333</td>
    </tr>
    <tr>
      <th>84345</th>
      <td>tt8499638</td>
      <td>Saturday Fiction</td>
      <td>Saturday Fiction</td>
      <td>2019</td>
      <td>2019-09-04</td>
      <td>Drama, History</td>
      <td>126</td>
      <td>China</td>
      <td>Mandarin, English, Japanese, French</td>
      <td>Ye Lou</td>
      <td>Yingli Ma</td>
      <td>United Entertainment Partners</td>
      <td>Li Gong, Mark Chao, Pascal Greggory, Xiangli H...</td>
      <td>Yu Jin is working undercover gathering intelli...</td>
      <td>5.9</td>
      <td>250</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>51.0</td>
      <td>3.0</td>
      <td>23.0</td>
      <td>2.100000</td>
    </tr>
  </tbody>
</table>
</div>
      <button class="colab-df-convert" onclick="convertToInteractive('df-f704486e-7a5e-4bb0-8129-38516606ad40')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-f704486e-7a5e-4bb0-8129-38516606ad40 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-f704486e-7a5e-4bb0-8129-38516606ad40');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>




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



we can invert the filter with `~`


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





  <div id="df-34af064e-c5f7-4dc3-9a97-75d816d93b02">
    <div class="colab-df-container">
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
      <button class="colab-df-convert" onclick="convertToInteractive('df-34af064e-c5f7-4dc3-9a97-75d816d93b02')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-34af064e-c5f7-4dc3-9a97-75d816d93b02 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-34af064e-c5f7-4dc3-9a97-75d816d93b02');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
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
pd.value_counts(df['duration_group'], sort=True)
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



##### 🏋️ Exercise 6: `value_counts, unique, nunique`

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
# Cell for Exercise 6
df['director'].nunique()

# i want ot filter for USA movies, select the directors, and 
# tell me the unique directors
df.loc[df['country'] == 'USA']['director'].nunique()
```




    12463



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
# apply, filter two methods that work along with gorupby
# to filter according to groups
```


```python
df.groupby('duration_group')\
      .filter(lambda x: x['title'].count() > 100)\
      .groupby('duration_group')[['avg_vote']].describe()
```





  <div id="df-d3afc9e6-d7fc-4fc3-9a7e-c43e02cdd850">
    <div class="colab-df-container">
      <div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th colspan="8" halign="left">avg_vote</th>
    </tr>
    <tr>
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
      <td>72368.0</td>
      <td>5.786671</td>
      <td>1.212224</td>
      <td>1.0</td>
      <td>5.1</td>
      <td>6.0</td>
      <td>6.6</td>
      <td>9.8</td>
    </tr>
    <tr>
      <th>(117.7, 194.4]</th>
      <td>13197.0</td>
      <td>6.488513</td>
      <td>1.181584</td>
      <td>1.0</td>
      <td>5.9</td>
      <td>6.7</td>
      <td>7.3</td>
      <td>9.9</td>
    </tr>
    <tr>
      <th>(194.4, 271.1]</th>
      <td>228.0</td>
      <td>6.997368</td>
      <td>1.058672</td>
      <td>2.4</td>
      <td>6.4</td>
      <td>7.0</td>
      <td>7.7</td>
      <td>9.2</td>
    </tr>
    <tr>
      <th>(271.1, 347.8]</th>
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
      <th>(347.8, 424.5]</th>
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
      <th>(424.5, 501.2]</th>
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
      <th>(731.3, 808.0]</th>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>
      <button class="colab-df-convert" onclick="convertToInteractive('df-d3afc9e6-d7fc-4fc3-9a7e-c43e02cdd850')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-d3afc9e6-d7fc-4fc3-9a7e-c43e02cdd850 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-d3afc9e6-d7fc-4fc3-9a7e-c43e02cdd850');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
  </div>





```python
df.groupby(['duration_group'])[['avg_vote']].describe()
```





  <div id="df-2ebd1494-9f4f-4b9a-a09b-7a104966e192">
    <div class="colab-df-container">
      <div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th colspan="8" halign="left">avg_vote</th>
    </tr>
    <tr>
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
      <td>72368.0</td>
      <td>5.786671</td>
      <td>1.212224</td>
      <td>1.0</td>
      <td>5.10</td>
      <td>6.0</td>
      <td>6.600</td>
      <td>9.8</td>
    </tr>
    <tr>
      <th>(117.7, 194.4]</th>
      <td>13197.0</td>
      <td>6.488513</td>
      <td>1.181584</td>
      <td>1.0</td>
      <td>5.90</td>
      <td>6.7</td>
      <td>7.300</td>
      <td>9.9</td>
    </tr>
    <tr>
      <th>(194.4, 271.1]</th>
      <td>228.0</td>
      <td>6.997368</td>
      <td>1.058672</td>
      <td>2.4</td>
      <td>6.40</td>
      <td>7.0</td>
      <td>7.700</td>
      <td>9.2</td>
    </tr>
    <tr>
      <th>(271.1, 347.8]</th>
      <td>40.0</td>
      <td>6.810000</td>
      <td>1.199530</td>
      <td>3.4</td>
      <td>6.35</td>
      <td>7.1</td>
      <td>7.600</td>
      <td>8.7</td>
    </tr>
    <tr>
      <th>(347.8, 424.5]</th>
      <td>11.0</td>
      <td>7.181818</td>
      <td>0.526912</td>
      <td>6.5</td>
      <td>7.00</td>
      <td>7.1</td>
      <td>7.300</td>
      <td>8.5</td>
    </tr>
    <tr>
      <th>(424.5, 501.2]</th>
      <td>4.0</td>
      <td>7.700000</td>
      <td>0.476095</td>
      <td>7.4</td>
      <td>7.40</td>
      <td>7.5</td>
      <td>7.800</td>
      <td>8.4</td>
    </tr>
    <tr>
      <th>(501.2, 577.9]</th>
      <td>4.0</td>
      <td>7.875000</td>
      <td>1.004573</td>
      <td>7.0</td>
      <td>7.30</td>
      <td>7.6</td>
      <td>8.175</td>
      <td>9.3</td>
    </tr>
    <tr>
      <th>(577.9, 654.6]</th>
      <td>1.0</td>
      <td>5.800000</td>
      <td>NaN</td>
      <td>5.8</td>
      <td>5.80</td>
      <td>5.8</td>
      <td>5.800</td>
      <td>5.8</td>
    </tr>
    <tr>
      <th>(654.6, 731.3]</th>
      <td>1.0</td>
      <td>7.800000</td>
      <td>NaN</td>
      <td>7.8</td>
      <td>7.80</td>
      <td>7.8</td>
      <td>7.800</td>
      <td>7.8</td>
    </tr>
    <tr>
      <th>(731.3, 808.0]</th>
      <td>1.0</td>
      <td>7.700000</td>
      <td>NaN</td>
      <td>7.7</td>
      <td>7.70</td>
      <td>7.7</td>
      <td>7.700</td>
      <td>7.7</td>
    </tr>
  </tbody>
</table>
</div>
      <button class="colab-df-convert" onclick="convertToInteractive('df-2ebd1494-9f4f-4b9a-a09b-7a104966e192')"
              title="Convert this dataframe to an interactive table."
              style="display:none;">

  <svg xmlns="http://www.w3.org/2000/svg" height="24px"viewBox="0 0 24 24"
       width="24px">
    <path d="M0 0h24v24H0V0z" fill="none"/>
    <path d="M18.56 5.44l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94zm-11 1L8.5 8.5l.94-2.06 2.06-.94-2.06-.94L8.5 2.5l-.94 2.06-2.06.94zm10 10l.94 2.06.94-2.06 2.06-.94-2.06-.94-.94-2.06-.94 2.06-2.06.94z"/><path d="M17.41 7.96l-1.37-1.37c-.4-.4-.92-.59-1.43-.59-.52 0-1.04.2-1.43.59L10.3 9.45l-7.72 7.72c-.78.78-.78 2.05 0 2.83L4 21.41c.39.39.9.59 1.41.59.51 0 1.02-.2 1.41-.59l7.78-7.78 2.81-2.81c.8-.78.8-2.07 0-2.86zM5.41 20L4 18.59l7.72-7.72 1.47 1.35L5.41 20z"/>
  </svg>
      </button>

  <style>
    .colab-df-container {
      display:flex;
      flex-wrap:wrap;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }
  </style>

      <script>
        const buttonEl =
          document.querySelector('#df-2ebd1494-9f4f-4b9a-a09b-7a104966e192 button.colab-df-convert');
        buttonEl.style.display =
          google.colab.kernel.accessAllowed ? 'block' : 'none';

        async function convertToInteractive(key) {
          const element = document.querySelector('#df-2ebd1494-9f4f-4b9a-a09b-7a104966e192');
          const dataTable =
            await google.colab.kernel.invokeFunction('convertToInteractive',
                                                     [key], {});
          if (!dataTable) return;

          const docLinkHtml = 'Like what you see? Visit the ' +
            '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
            + ' to learn more about interactive tables.';
          element.innerHTML = '';
          dataTable['output_type'] = 'display_data';
          await google.colab.output.renderOutput(dataTable, element);
          const docLink = document.createElement('div');
          docLink.innerHTML = docLinkHtml;
          element.appendChild(docLink);
        }
      </script>
    </div>
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



##### 🏋️ Exercise 7: Group-by

<ol>
<li>use <code>pd.cut</code> to perform a grouping of one or more of the dataframe columns
<li>use <code>groupby</code> to group by that (those) columns and then perform
<li>three different statistical summaries in three separate instances




```python
# Cell for excercise 7
```
