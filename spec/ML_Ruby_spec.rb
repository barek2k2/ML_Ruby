# frozen_string_literal: true

RSpec.describe MLRuby do
  it "has a version number" do
    expect(MLRuby::VERSION).not_to be nil
  end

  it "should generate ML based prediction correctly!" do
    ml = MLRuby::LinearRegression::Model.new([[1],[2],[3]], [[100], [400], [430]])
    prediction = ml.predict([[4]]).to_f
    puts prediction
    expect(prediction).not_to be nil
    expect(prediction).to be > 0
  end
end
