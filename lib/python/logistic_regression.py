import numpy as np
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report, confusion_matrix
import sys
import ast

class LogisticRegressionModel:
  def __init__(self, data):
    self.data = data

  def process_data(self):
    self.X = self.data[0]
    self.y = self.data[1]

  def train(self):
    self.model = LogisticRegression()
    self.model.fit(self.X, self.y)

  def predict(self, new_predictions):
    return self.model.predict(new_predictions)

data = ast.literal_eval(sys.argv[1])
logistic_regression_model = LogisticRegressionModel(data)
logistic_regression_model.process_data()
logistic_regression_model.train()
predictions = data[2]
print(logistic_regression_model.predict(predictions))