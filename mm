{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "provenance": [],
      "mount_file_id": "1n01q1i7wD-VQwOR4Qwvncu76QCrvwtkk",
      "authorship_tag": "ABX9TyMHjEEaXpaG4f+rsZ8obJkz",
      "include_colab_link": true
    },
    "kernelspec": {
      "name": "python3",
      "display_name": "Python 3"
    },
    "language_info": {
      "name": "python"
    }
  },
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "view-in-github",
        "colab_type": "text"
      },
      "source": [
        "<a href=\"https://colab.research.google.com/github/Marian-magdy/Marian-magdy/blob/main/mm\" target=\"_parent\"><img src=\"https://colab.research.google.com/assets/colab-badge.svg\" alt=\"Open In Colab\"/></a>"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 1000
        },
        "id": "DtgoW2PfcwKZ",
        "outputId": "407f6cd6-415d-4810-8073-fdff26e3f90d"
      },
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "     Item_Identifier  Item_Weight Item_Fat_Content  Item_Visibility  \\\n",
            "0              FDA15        9.300          Low Fat         0.016047   \n",
            "1              DRC01        5.920          Regular         0.019278   \n",
            "2              FDN15       17.500          Low Fat         0.016760   \n",
            "3              FDX07       19.200          Regular         0.000000   \n",
            "4              NCD19        8.930          Low Fat         0.000000   \n",
            "...              ...          ...              ...              ...   \n",
            "8518           FDF22        6.865          Low Fat         0.056783   \n",
            "8519           FDS36        8.380          Regular         0.046982   \n",
            "8520           NCJ29       10.600          Low Fat         0.035186   \n",
            "8521           FDN46        7.210          Regular         0.145221   \n",
            "8522           DRG01       14.800          Low Fat         0.044878   \n",
            "\n",
            "                  Item_Type  Item_MRP Outlet_Identifier  \\\n",
            "0                     Dairy  249.8092            OUT049   \n",
            "1               Soft Drinks   48.2692            OUT018   \n",
            "2                      Meat  141.6180            OUT049   \n",
            "3     Fruits and Vegetables  182.0950            OUT010   \n",
            "4                 Household   53.8614            OUT013   \n",
            "...                     ...       ...               ...   \n",
            "8518            Snack Foods  214.5218            OUT013   \n",
            "8519           Baking Goods  108.1570            OUT045   \n",
            "8520     Health and Hygiene   85.1224            OUT035   \n",
            "8521            Snack Foods  103.1332            OUT018   \n",
            "8522            Soft Drinks   75.4670            OUT046   \n",
            "\n",
            "      Outlet_Establishment_Year Outlet_Size Outlet_Location_Type  \\\n",
            "0                          1999      Medium               Tier 1   \n",
            "1                          2009      Medium               Tier 3   \n",
            "2                          1999      Medium               Tier 1   \n",
            "3                          1998         NaN               Tier 3   \n",
            "4                          1987        High               Tier 3   \n",
            "...                         ...         ...                  ...   \n",
            "8518                       1987        High               Tier 3   \n",
            "8519                       2002         NaN               Tier 2   \n",
            "8520                       2004       Small               Tier 2   \n",
            "8521                       2009      Medium               Tier 3   \n",
            "8522                       1997       Small               Tier 1   \n",
            "\n",
            "            Outlet_Type  Item_Outlet_Sales  \n",
            "0     Supermarket Type1          3735.1380  \n",
            "1     Supermarket Type2           443.4228  \n",
            "2     Supermarket Type1          2097.2700  \n",
            "3         Grocery Store           732.3800  \n",
            "4     Supermarket Type1           994.7052  \n",
            "...                 ...                ...  \n",
            "8518  Supermarket Type1          2778.3834  \n",
            "8519  Supermarket Type1           549.2850  \n",
            "8520  Supermarket Type1          1193.1136  \n",
            "8521  Supermarket Type2          1845.5976  \n",
            "8522  Supermarket Type1           765.6700  \n",
            "\n",
            "[8523 rows x 12 columns]\n"
          ]
        },
        {
          "output_type": "display_data",
          "data": {
            "text/plain": [
              "<Figure size 432x288 with 1 Axes>"
            ],
            "image/png": "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\n"
          },
          "metadata": {
            "needs_background": "light"
          }
        },
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "<class 'pandas.core.frame.DataFrame'>\n",
            "RangeIndex: 8523 entries, 0 to 8522\n",
            "Data columns (total 12 columns):\n",
            " #   Column                     Non-Null Count  Dtype  \n",
            "---  ------                     --------------  -----  \n",
            " 0   Item_Identifier            8523 non-null   object \n",
            " 1   Item_Weight                7060 non-null   float64\n",
            " 2   Item_Fat_Content           8523 non-null   object \n",
            " 3   Item_Visibility            8523 non-null   float64\n",
            " 4   Item_Type                  8523 non-null   object \n",
            " 5   Item_MRP                   8523 non-null   float64\n",
            " 6   Outlet_Identifier          8523 non-null   object \n",
            " 7   Outlet_Establishment_Year  8523 non-null   int64  \n",
            " 8   Outlet_Size                6113 non-null   object \n",
            " 9   Outlet_Location_Type       8523 non-null   object \n",
            " 10  Outlet_Type                8523 non-null   object \n",
            " 11  Item_Outlet_Sales          8523 non-null   float64\n",
            "dtypes: float64(4), int64(1), object(7)\n",
            "memory usage: 799.2+ KB\n"
          ]
        },
        {
          "output_type": "execute_result",
          "data": {
            "text/plain": [
              "Item_Identifier                 0\n",
              "Item_Weight                     0\n",
              "Item_Fat_Content                0\n",
              "Item_Visibility                 0\n",
              "Item_Type                       0\n",
              "Item_MRP                        0\n",
              "Outlet_Identifier               0\n",
              "Outlet_Establishment_Year       0\n",
              "Outlet_Size                  2410\n",
              "Outlet_Location_Type            0\n",
              "Outlet_Type                     0\n",
              "Item_Outlet_Sales               0\n",
              "dtype: int64"
            ]
          },
          "metadata": {},
          "execution_count": 51
        }
      ],
      "source": [
        "# #-the problem\n",
        "# The data scientists at BigMart have collected 2013 sales data for 1559 products across 10 stores in different cities.\n",
        "# Also, certain attributes of each product and store have been defined. The aim of this data science project is to build a \n",
        "# predictive model and find out the sales of each product at a particular store ,\n",
        "# Using this model, BigMart will try to understand the properties of products and stores which play a key role in increasing sales\n",
        "# #-hypothesis generation\n",
        "# alternate hypothesis\n",
        "#sales increase with low weight ,low fat content,high visibility,recent est.year,outlet size\n",
        "# null hypothesis\n",
        "#sales not related to item type,mrp,outlet location,outlet type\n",
        "# #-loading data and packages\n",
        "import pandas as pd\n",
        "import numpy as np\n",
        "df=pd.read_csv('/content/drive/MyDrive/Train.csv')\n",
        "df.head()\n",
        "#data structure and content\n",
        "#Sorting Pandas Dataframe \n",
        "df=pd.read_csv('/content/drive/MyDrive/Train.csv')\n",
        " #Add by variable name(s) to sort\n",
        "newdf = df.sort_values(by='Item_Outlet_Sales')\n",
        "newdf\n",
        "#Let’s look at the some of the visualizations to understand below behavior of variable(s) .\n",
        "# The distribution of item_weight\n",
        "# Relation between ageitem_weight and sales; and\n",
        "# If sales are normally distributed or not?\n",
        "#Remove Duplicate Values based on values of variables \"Item_identifier\" and \"Outlet_identifier\"\n",
        "rem_dup=df.drop_duplicates(['Item_Identifier', 'Outlet_Identifier'])\n",
        "print(rem_dup)\n",
        "#To understand the count, average and sum of variable, use dataframe.describe() with Pandas groupby().\n",
        "test= df.groupby(['Item_Fat_Content'])\n",
        "test.describe()\n",
        "test= df.groupby(['Outlet_Size'])\n",
        "test.describe()\n",
        "#null\n",
        "# Identify missing values of dataframe\n",
        "df.isnull()\n",
        "#exploratory data analysis\n",
        "import pandas as pd\n",
        "import numpy as np\n",
        "import matplotlib.pyplot as plt\n",
        "import seaborn as sns \n",
        "%matplotlib inline\n",
        "df.boxplot(column=['Item_Weight'])\n",
        "plt.show()\n",
        "df.shape\n",
        "df.info()\n",
        "df.describe()\n",
        "df.isnull().sum()\n",
        "#outlet_Size 2410 categorical,itewm_weight 1463 numerical\n",
        "#we will replace item weight by mean,outlet size by mode\n",
        "mean1=df['Item_Weight'].mean()\n",
        "df['Item_Weight'].replace(np.nan,mean1,inplace=True)\n",
        "df.isnull().sum()\n",
        "mode1=df"
      ]
    }
  ]
}