import pandas as pd
from sklearn.linear_model import LinearRegression
import datetime
import sys
import ast

data = ast.literal_eval(sys.argv[1])

X = data[0]
y = data[1]
predict = data[2]

model = LinearRegression()
model.fit(X, y)
prediction = model.predict(predict)

forecast = prediction[0][0]

print(f"{forecast:.2f}")