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
