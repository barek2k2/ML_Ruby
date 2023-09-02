# MLRuby

Machine Learning based Ruby gem used for forcasting or predicting or classifying anything(for example: next month billing forcast, upcoming sales order, user approval status, generate similarities/recommendations etc). Linear Regression, DecisionTreeClassifier and k-nearest neighbors algorithms are used powered by Python3 under the hood.

## Pre-requisite
1. Please make sure you have Python3 installed in your Machine. The gem will run `which python3` to locate your installed python3 in your Machine. Usually it is installed at `/usr/bin/python3`

2. Please make sure you have `scikit-learn` and `pandas` python libraries are installed in Machine.

Here is an example of how to install these python libraries via the command line in MacOS.

`/usr/bin/python3 -m pip install scikit-learn`

`/usr/bin/python3 -m pip install pandas`

## Installation

    $ gem install ML_Ruby

## Usage
Lets say you have 3 days sales order data those represents as 1,2,3 like this `[[1],[2],[3]]` as input feature and 
you have amount of corresponding sales order like this `[[100], [400], [430]]` as target variables. Now you would like to predict your sales order on day 4

```
 ml = MLRuby::LinearRegression::Model.new([[1],[2],[3]], [[100], [400], [430]])
 prediction = ml.predict([[4]]).to_f
 puts prediction
```

Lets say you have some data like social credit score, yearly income and approval status(1 is approved and 0 is not approved). Now you would like to classify new person's approval status using DecisionTreeClassifier Algorithm
```
data =  [[720, 60000, 1],
        [650, 40000, 0],
        [780, 80000, 1],
        [600, 30000, 0],
        [700, 55000, 1],
        [750, 70000, 1]]

ml = MLRuby::DecisionTreeClassifier::Model.new(data)
prediction1 = ml.predict([[180, 10000]]).to_i
prediction2 = ml.predict([[5000, 50000]]).to_i
```

Lets assume some of products in an ecommerce system having data like
```
    products = [
      {
        "id": 1,
        "name": "iPhone 12",
        "price": 799,
        "screen_size": 6.1,
        "camera_quality": 12,
        "battery_capacity": 2815
      },
      {
        "id": 2,
        "name": "Samsung Galaxy S21",
        "price": 799,
        "screen_size": 6.2,
        "camera_quality": 12,
        "battery_capacity": 4000
      },
      {
        "id": 3,
        "name": "Google Pixel 6",
        "price": 699,
        "screen_size": 6.0,
        "camera_quality": 16,
        "battery_capacity": 3700
      },
      {
        "id": 4,
        "name": "OnePlus 9 Pro",
        "price": 799,
        "screen_size": 6.7,
        "camera_quality": 16,
        "battery_capacity": 4500
      },
      {
        "id": 5,
        "name": "Xiaomi Mi 11",
        "price": 699,
        "screen_size": 6.81,
        "camera_quality": 12,
        "battery_capacity": 4600
      }
    ]
```
Now you would like to get similar products(of id 4) with respect to product's features. You can do so like this way
```
feature_names = ["price", "screen_size", "camera_quality", "battery_capacity"]
ml = MLRuby::KNearestNeighbors::Model.new(products, feature_names, 2) # 2 is the maximum number of nearest similar/recommended items
similar_products = ml.similar_with(4)
```

```
feature_names = ["price", "camera_quality"]
ml = MLRuby::KNearestNeighbors::Model.new(products, feature_names, 2)
similar_products = ml.similar_with(4)
```



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/barek2k2/ML_Ruby/.
