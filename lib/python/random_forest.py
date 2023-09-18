import numpy as np
from sklearn.ensemble import RandomForestRegressor

import sys
import ast

class RandomForestModel:
  def __init__(self, data):
    self.data = data

  def process_data(self):
    self.X = self.data[0]
    self.y = self.data[1]
    self.new_prediction = self.data[2]

  def train(self):
    self.model = RandomForestRegressor(n_estimators=100, random_state=42)
    self.model.fit(self.X, self.y)

  def predict(self):
    prediction = self.model.predict(self.new_prediction)
    return prediction


data = ast.literal_eval(sys.argv[1])
random_forest_regression_model = RandomForestModel(data)
random_forest_regression_model.process_data()
random_forest_regression_model.train()
prediction = random_forest_regression_model.predict()
print(prediction)

# Simulated house data as NumPy arrays
# X contains features like number of bedrooms, square footage, real estate approval.
# y contains the corresponding house prices
##X = np.array([[3, 1500, 0], [2, 1200, 1], [4, 1800, 0], [3, 1600, 1], [5, 2200, 1]])
##y = np.array([300000, 250000, 400000, 350000, 500000])

# Create a Random Forest Regressor
##rf_regressor = RandomForestRegressor(n_estimators=100, random_state=42)

# Train the model on the entire dataset (you can use X_train and y_train from your previous code)
##rf_regressor.fit(X, y)

# New data for prediction
##new_data = np.array([[4, 5068, 0], [3, 1760, 1]])

# Make predictions on the new data
##predictions = rf_regressor.predict(new_data)
##print(predictions)
