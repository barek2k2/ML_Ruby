from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import sys
import ast

class DecisionTreeClassifierModel:
  def __init__(self, data):
    self.data = data

  def process_data(self):
    self.X = [row[:2] for row in self.data[0]]
    self.y = [row[2] for row in self.data[0]]
    self.new_prediction = self.data[1]

  def train(self):
    self.model = DecisionTreeClassifier()
    self.model.fit(self.X, self.y)

  def predict(self):
    prediction = self.model.predict(self.new_prediction)
    return prediction[0]

data = ast.literal_eval(sys.argv[1])
decision_tree_classifier_model = DecisionTreeClassifierModel(data)
decision_tree_classifier_model.process_data()
decision_tree_classifier_model.train()
predicted_class = decision_tree_classifier_model.predict()
print(predicted_class)