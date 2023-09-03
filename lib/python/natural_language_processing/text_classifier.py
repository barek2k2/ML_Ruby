import nltk
import random
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
import sys
import ast

# Download NLTK data if not already downloaded
nltk.download('stopwords')
nltk.download('punkt')

class TextClassifier:
    def __init__(self):
        self.vectorizer = None
        self.classifier = None

    def extract_features(self, text):
        words = set(word_tokenize(text))
        features = {word: (word not in stopwords.words('english')) for word in words}
        return features

    def train(self, texts):
        random.shuffle(texts)

        # Create feature sets
        labeled_data = [(self.extract_features(text), label) for text, label in texts]

        # Train the Naive Bayes classifier
        self.classifier = nltk.NaiveBayesClassifier.train(labeled_data)

    def test_accuracy(self, texts):
        # Create feature sets
        labeled_data = [(self.extract_features(text), label) for text, label in texts]

        # Calculate accuracy
        accuracy = nltk.classify.accuracy(self.classifier, labeled_data)
        return accuracy

    def classify_text(self, text):
        features = self.extract_features(text)
        prediction = self.classifier.classify(features)
        return prediction

# Sample dataset: spam and ham texts
texts = ast.literal_eval(sys.argv[1])

# Create and train the text_classifier
text_classifier = TextClassifier()
text_classifier.train(texts)

# Make predictions on new texts
new_texts = ast.literal_eval(sys.argv[2])

new_prediction = []
for text in new_texts:
    prediction = text_classifier.classify_text(text)
    new_prediction.append([text, prediction])

print(new_prediction)