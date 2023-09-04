# MLRuby

This Ruby gem leverages Machine Learning(ML) techniques to make predictions(forecasts) and classifications in various applications. It provides capabilities such as predicting next month's billing, forecasting upcoming sales orders, determining user approval status, classifying text, generating similarity scores, and making recommendations. It uses Python3 under the hood, powered by popular machine learning techniques including NLP(Natural Language Processing), Decision Tree, K-Nearest Neighbors and Linear Regression algorithms.


# Pre-requisite
1. Please make sure you have Python3 installed in your Machine. The gem will run `which python3` to locate your installed python3 in your Machine. Usually it is installed at `/usr/bin/python3`

2. Please make sure you have `scikit-learn` and `pandas` python libraries are installed in Machine.

Here are examples of how to install these python libraries via the command line in MacOS. Install `nltk` if you really need to work with Natural Language Processing(NLP)

`/usr/bin/python3 -m pip install scikit-learn`

`/usr/bin/python3 -m pip install pandas`

`/usr/bin/python3 -m pip install nltk`

# Installation

    $ gem install ML_Ruby

# Usage
 - ### Linear Regression Algorithm - Sales Order Prediction Example
 
    Imagine you have three days' worth of sales order data represented as input features [1, 2, 3] and the corresponding sales amounts [100, 400, 430] as target variables. Now, you want to predict your sales order for day 4.
```
 ml = MLRuby::LinearRegression::Model.new([[1],[2],[3]], [[100], [400], [430]])
 prediction = ml.predict([[4]])
 puts prediction
```

 - ### Decision Tree Algorithm - User Approval Status  Example

   Suppose you have a dataset that includes features such as social credit score, yearly income, and approval status (where 1 represents approval, and 0 represents non-approval). Now, you want to classify the approval status of a new person.

```
data =  [[720, 60000, 1],
        [650, 40000, 0],
        [780, 80000, 1],
        [600, 30000, 0],
        [700, 55000, 1],
        [750, 70000, 1]]

ml = MLRuby::DecisionTreeClassifier::Model.new(data)
prediction1 = ml.predict([[180, 10000]])
prediction2 = ml.predict([[5000, 50000]])
```
 - ### K-Nearest Neighbors Algorithm - Example on Recommended/Similar products in E-Commerce based application

   Imagine you have a training dataset representing various products in an e-commerce platform, each characterized by specific features. Now, you want to find similar products to a given product (let's say, product ID 4) based on these features.

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

 - ### Natural Language Processing(NLP): Naive Bayes Algorithm - Spam Detection in a Messaging System

    In a messaging system, it's essential to identify and filter out spam text messages to ensure a smooth and secure user experience. With the capabilities of this gem, you can effectively detect spam text and take appropriate actions.
```
training_messages = [
      ["Hey, congratulations! You have won a free iPhone.", "spam"],
      ["Meeting canceled, see you later.", "not_spam"],
      ["Buy one get one free. Limited time offer!", "spam"],
      ["Can you please send me the report?", "not_spam"],
      ["Meeting at 3 PM today.", "not_spam"],
      ["Claim your prize now. You have won $1000!", "spam"],
      ["Please reschedule the meeting on the next following day", "not_spam"],
    ]

  ml = MLRuby::NaturalLanguageProcessing::TextClassifier::Model.new(training_messages)
  new_messages = [
      "Welcome!, you have won 2.5 million dollars",
      "Hello, can we schedule a meeting?",
      "Important report attached.",
      "Have your 50% discount on the next deal!",
    ]
  predictions = ml.predict(new_messages)
```
It's important to note that the size of your training dataset plays a significant role in enhancing the accuracy of the model's predictions. By incorporating real-world, authentic data and expanding the amount of training data for the model, it gains a better understanding of patterns and trends within the data which leads to more precise and reliable predictions.
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/barek2k2/ML_Ruby/.
