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

end
