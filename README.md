# MLRuby

Machine Learning based Ruby gem used for forcasting or predicting anything(for example: next month billing forcast, upcoming sales order etc). Linear Regression algorithm is used powered by Python3 under the hood.

## Installation

Make sure you have Python3 installed at `/usr/bin/python3` in your Machine.

    $ gem install ML_Ruby

## Usage
Lets say you have 3 days sales order data those represents as 1,2,3 like this `[[1],[2],[3]]` as input feature and 
you have amount of corresponding sales order like this `[[100], [400], [430]]` as target variables. Now you would like to predict your sales order on day 4

```
 ml = MLRuby::LinearRegression::Model.new([[1],[2],[3]], [[100], [400], [430]])
 prediction = ml.predict([[4]]).to_f
 puts prediction
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/barek2k2/ML_Ruby/.
