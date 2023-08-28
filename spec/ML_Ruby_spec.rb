# frozen_string_literal: true

RSpec.describe MLRuby do
  it "has a version number" do
    expect(MLRuby::VERSION).not_to be nil
  end

  it "should generate ML based prediction correctly!" do
    ml = MLRuby::LinearRegression::Model.new([[1],[2],[3],[4], [5], [6]], [[400], [678], [700], [760], [790], [825]])
    prediction = ml.predict([[7]])
    expect(prediction).not_to be nil
  end
end
