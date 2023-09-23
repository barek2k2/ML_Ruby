# MLRuby

This Ruby gem leverages Machine Learning(ML) techniques to make predictions(forecasts) and classifications in various applications. It provides capabilities such as predicting next month's billing, forecasting upcoming sales orders, identifying patient's potential findings(like Diabetes), determining user approval status, classifying text, generating similarity scores, and making recommendations. It uses Python3 under the hood, powered by popular machine learning techniques including NLP(Natural Language Processing), Decision Tree, K-Nearest Neighbors, Logistic Regression, Random Forest and Linear Regression algorithms.


# Pre-requisite
1. Please make sure you have Python3 installed in your Machine. The gem will run `which python3` command internally in order to locate your installed python3 in your Machine. Usually it is installed at `/usr/bin/python3`

2. Please make sure you have `scikit-learn` and `pandas` python libraries are installed in your Machine.

Here are examples of how to install these python libraries via the command line in MacOS and Linux. Install `nltk` if you really need to work with Natural Language Processing(NLP)

`/usr/bin/python3 -m pip install scikit-learn`

`/usr/bin/python3 -m pip install pandas`

`/usr/bin/python3 -m pip install nltk`

# Installation

    $ gem install ML_Ruby

To include the "ML_Ruby" gem in your Ruby on Rails application, simply add the following line to your Gemfile:

```
gem 'ML_Ruby'
```  
  
After adding the gem, run the bundle install command to install it:

```
bundle install
```

# Usage
 - ### Linear Regression Algorithm - Sales Order Prediction Example
 
    Imagine you have three days' worth of sales order data represented as input features [1, 2, 3] and the corresponding sales amounts [100, 400, 430] as target variables. Now, you want to predict your sales order for day 4.
```
 ml = MLRuby::LinearRegression::Model.new([[1],[2],[3]], [[100], [400], [430]])
 prediction = ml.predict([[4]])
 puts prediction
```

 - ### Logistic Regression Algorithm - Diabetes detection Example in Health Industry
 
    Imagine you possess some patients data encompassing vital attributes such as Blood Pressure, Glucose Level, and Age, meticulously arranged as input features, accompanied by corresponding predictions for diabetes as target variables. Now you can effortlessly predict the likelihood of diabetes for any new patient.
```
 ml = MLRuby::LogisticRegression::Model.new(
   [
     [120, 80, 32],
     [140, 90, 28],
     [160, 75, 35],
     [135, 88, 30],
     [145, 92, 38]
   ],
   [1, 0, 1, 0, 1]
 )
 predictions = ml.predict([[130, 85, 30], [80, 80, 90]])
 puts predictions
```

 - ### Random Forest Regression Algorithm - Real Estate House Pricing Example
 
    Consider yourself in the dynamic field of the Real Estate market, you have some apartments/houses data(number of bed rooms, price, approval_status) represented as input features and their corresponding prices.
    
```
apartment_features = [
    [3, 1500, 0],
    [2, 1200, 1],
    [4, 1800, 0],
    [3, 1600, 1],
    [5, 2200, 1]
  ]
prices = [300000, 250000, 400000, 350000, 500000]
```    
Now if you would like to predict any new apartment's price, you can do so as below:    
```
ml = MLRuby::RandomForestRegression::Model.new(apartment_features,prices)
two_new_apartment_features = [[4, 5068, 0], [3, 1760, 1]]
prediction = ml.predict(two_new_apartment_features)
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

 - ### Natural Language Processing(NLP): Support Vector Machine Algorithm - Categorize/Classify Comments/Texts/Documents/Articles

    Imagine you're managing a customer feedback system, and you want to categorize customer comments effectively. With the capabilities of this gem, you can seamlessly classify comments/texts/documents/articles into their appropriate categories.
```
    training_documents = [
      "Machine learning techniques include neural networks and decision trees.",
      "Web development skills are essential for building modern websites.",
      "Natural language processing (NLP) is a subfield of artificial intelligence.",
      "Data science involves data analysis and statistical modeling.",
      "Computer vision is used in image and video processing applications."
    ]
    categories = ["Machine Learning", "Web Development", "Artificial Intelligence", "Data Science", "Computer Vision"]
    ml = MLRuby::NaturalLanguageProcessing::SupportVectorMachine::Model.new(training_documents, categories)
    new_documents = [
      "I am Ruby On Rails Expert",
      "I am interested in understanding natural language processing.",
      "I want to pursue an academic degree on neural networks.",
      "I have more than 12 years of professional working experience in JavaScript stack"
    ]
    predictions = ml.predict(new_documents)  
```

It's important to note that the size of your training dataset plays a significant role in enhancing the accuracy of the model's predictions. By incorporating real-world, authentic data and expanding the amount of training data for the model, it gains a better understanding of patterns and trends within the data which leads to more precise and reliable predictions.
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/barek2k2/ML_Ruby/.
