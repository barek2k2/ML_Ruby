import numpy as np
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.svm import SVC
from sklearn.metrics import classification_report
import sys
import ast

class SupportVectorMachine:
    def __init__(self, documents, categories):
      self.documents = documents
      self.categories = categories

    def fit_and_transform(self):
      self.vectorizer = TfidfVectorizer(max_features=1000, stop_words='english')
      X = self.vectorizer.fit_transform(self.documents)
      self.classifier = SVC(kernel='linear')
      self.classifier.fit(X, self.categories)


documents = ast.literal_eval(sys.argv[1])
categories = ast.literal_eval(sys.argv[2])
new_documents = ast.literal_eval(sys.argv[3])

support_vector_machine_model = SupportVectorMachine(documents, categories)
support_vector_machine_model.fit_and_transform()

new_text_vectorized = support_vector_machine_model.vectorizer.transform(new_documents)
predicted_topics = support_vector_machine_model.classifier.predict(new_text_vectorized)
print(predicted_topics)
