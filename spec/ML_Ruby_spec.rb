# frozen_string_literal: true

RSpec.describe MLRuby do
  it "has a version number" do
    expect(MLRuby::VERSION).not_to be nil
  end

  it "should generate ML based prediction/forcast correctly!" do
    ml = MLRuby::LinearRegression::Model.new([[1],[2],[3]], [[100], [400], [430]])
    prediction = ml.predict([[4]]).to_f
    expect(prediction).not_to be nil
    expect(prediction).to be > 0
  end

  it "should generate ML based classifier which can classify or categorize new item" do
    data = [[720, 60000, 1],
            [650, 40000, 0],
            [780, 80000, 1],
            [600, 30000, 0],
            [700, 55000, 1],
            [750, 70000, 1]]
    ml = MLRuby::DecisionTreeClassifier::Model.new(data)
    prediction1 = ml.predict([[180, 10000]]).to_i
    prediction2 = ml.predict([[5000, 50000]]).to_i
    expect(prediction1).to be 0
    expect(prediction2).to be 1
  end

  it "should implements k-nearest neighbors" do
    products = [
      {
        "id": 1,
        "name": "iPhone 12",
        "price": 799,
        "screen_size": 6.1,
        "camera_quality": 12,
        "battery_capacity": 2815
      },
      {
        "id": 2,
        "name": "Samsung Galaxy S21",
        "price": 799,
        "screen_size": 6.2,
        "camera_quality": 12,
        "battery_capacity": 4000
      },
      {
        "id": 3,
        "name": "Google Pixel 6",
        "price": 699,
        "screen_size": 6.0,
        "camera_quality": 16,
        "battery_capacity": 3700
      },
      {
        "id": 4,
        "name": "OnePlus 9 Pro",
        "price": 799,
        "screen_size": 6.7,
        "camera_quality": 16,
        "battery_capacity": 4500
      },
      {
        "id": 5,
        "name": "Xiaomi Mi 11",
        "price": 699,
        "screen_size": 6.81,
        "camera_quality": 12,
        "battery_capacity": 4600
      }
    ]
    feature_names = ["price", "screen_size", "camera_quality", "battery_capacity"]
    ml = MLRuby::KNearestNeighbors::Model.new(products, feature_names, 2)
    similar_products = ml.similar_with(4)
    expect(similar_products).to be_a(Array)
    expect(similar_products.length > 0).to be true
  end

end
