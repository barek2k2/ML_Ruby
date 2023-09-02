from sklearn.neighbors import NearestNeighbors
import sys
import ast

class Recommendation:
    def __init__(self, items, feature_names, n_neighbors=3):
        self.n_neighbors = int(n_neighbors)
        self.items = items  # List of product JSON objects
        self.feature_names = feature_names  # List of feature property names
        self.features = self.extract_features()  # Extract features dynamically
        self.nn_model = NearestNeighbors(n_neighbors=self.n_neighbors)  # KNN model with k=3 default
        self.nn_model.fit(self.features)  # Fit the KNN model during initialization

    def extract_features(self):
        # Extract features dynamically based on feature property names
        features = []
        for product in self.items:
            feature_vector = [product.get(feature, 0) for feature in self.feature_names]
            features.append(feature_vector)
        return features

    def find_similar_products(self, product_id):
        # Find the index of the product with the given ID
        product_index = None
        for i, product in enumerate(self.items):
            if product["id"] == product_id:
                product_index = i
                break

        if product_index is None:
            return None  # Product ID not found

        # Find the k-nearest neighbors to the given product
        distances, indices = self.nn_model.kneighbors([self.features[product_index]])

        # Create a list of similar items
        similar_products = []
        for i in indices[0]:
            if i != product_index:
                similar_products.append(self.items[i])

        return similar_products

# Sample data as an array of JSON objects
items = ast.literal_eval(sys.argv[1])

# Define the feature property names to be extracted dynamically
feature_names = ast.literal_eval(sys.argv[2])

# id of item
id = ast.literal_eval(sys.argv[3])

# Number of neighbors to fetch from
n_neighbors = ast.literal_eval(sys.argv[4])

# Create a Recommendation instance
recommendation = Recommendation(items, feature_names, n_neighbors)

# Find similar items to a specific product by ID (e.g., ID 2)
similar_products = recommendation.find_similar_products(id)
print(similar_products)
