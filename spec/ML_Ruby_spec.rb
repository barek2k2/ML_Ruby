# frozen_string_literal: true

RSpec.describe MLRuby do
  it "has a version number" do
    expect(MLRuby::VERSION).not_to be nil
  end

  it "should generate ML based prediction/forecasting correctly!" do
    ml = MLRuby::LinearRegression::Model.new([[1],[2],[3]], [[100], [400], [430]])
    prediction = ml.predict([[4]])
    expect(prediction).not_to be nil
    expect(prediction).to be > 0
  end

  it "should generate ML based prediction using random forest regression!", focus: true do
    ml = MLRuby::RandomForestRegression::Model.new(
      [[3, 1500, 0],
       [2, 1200, 1],
       [4, 1800, 0],
       [3, 1600, 1],
       [5, 2200, 1]
      ],
      [300000, 250000, 400000, 350000, 500000]
    )
    prediction = ml.predict([[4, 5068, 0], [3, 1760, 1]])
    expect(prediction).not_to be nil
    expect(prediction).to be_an_instance_of(Array)
    expect(prediction.count).to eq(2)
  end

  it "should generate a classifier based on some attributes which can classify or categorize new item" do
    data = [[720, 60000, 1],
            [650, 40000, 0],
            [780, 80000, 1],
            [600, 30000, 0],
            [700, 55000, 1],
            [750, 70000, 1]]
    ml = MLRuby::DecisionTreeClassifier::Model.new(data)
    prediction1 = ml.predict([[180, 10000]])
    prediction2 = ml.predict([[5000, 50000]])
    expect(prediction1).to be 0
    expect(prediction2).to be 1
  end

  it "should return similar/recommended items" do
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

  it "should detect spam message in a messaging system" do
    training_messages = [
      ["Hey, congratulations! You have won a free iPhone.", "spam"],
      ["Meeting canceled, see you later.", "not_spam"],
      ["Buy one get one free. Limited time offer!", "spam"],
      ["Can you please send me the report?", "not_spam"],
      ["Meeting at 3 PM today.", "not_spam"],
      ["Claim your prize now. You have won $1000!", "spam"],
      ["Please reschedule the meeting on the next following day", "not_spam"],
    ]
    ml = MLRuby::NaturalLanguageProcessing::TextClassifier::Model.new(training_messages)
    new_messages = [
      "Welcome!, you have won 2.5 million dollars",
      "Hello, can we schedule a meeting?",
      "Important report attached.",
      "Have your 50% discount on the next deal!",
    ]
    predictions = ml.predict(new_messages)
    expect(predictions).to be_a(Array)
    expect(predictions[0][1]).to eq('spam')
    expect(predictions[1][1]).to eq('not_spam')
    expect(predictions[2][1]).to eq('not_spam')
    expect(predictions[3][1]).to eq('spam')
  end

end
