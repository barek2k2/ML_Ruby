import pandas as pd
from sklearn.linear_model import LinearRegression
import datetime
import sys
import ast

class LinearRegressionModel:
  def __init__(self, data):
    self.data = data

  def process_data(self):
    self.X = self.data[0]
    self.y = self.data[1]
    self.new_prediction = self.data[2]

  def train(self):
    self.model = LinearRegression()
    self.model.fit(self.X, self.y)

  def predict(self):
    prediction = self.model.predict(self.new_prediction)
    return prediction[0][0]

data = ast.literal_eval(sys.argv[1])
linear_regression_model = LinearRegressionModel(data)
linear_regression_model.process_data()
linear_regression_model.train()
forecast = linear_regression_model.predict()
print(f"{forecast:.2f}")