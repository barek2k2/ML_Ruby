# frozen_string_literal: true

require_relative "ML_Ruby/version"
require 'json'

module MLRuby
  PYTHON_PATH = `which python3`.gsub("\n","")
  class Error < StandardError; end
  module LinearRegression
    class Model
      def initialize(x, y)
        @x = x
        @y = y
      end
      def predict(next_x)
        script_path = "#{Gem.loaded_specs['ML_Ruby'].gem_dir}/lib/python/linear_regression.py"
        result = `#{MLRuby::PYTHON_PATH} #{script_path} "#{@x}, #{@y}, #{next_x}"`
        result
      end
    end
  end

  module DecisionTreeClassifier
    class Model
      def initialize(data)
        @data = data
      end
      def predict(next_x)
        script_path = "#{Gem.loaded_specs['ML_Ruby'].gem_dir}/lib/python/decision_tree_classifier.py"
        result = `#{MLRuby::PYTHON_PATH} #{script_path} "#{@data}, #{next_x}"`
        result
      end
    end
  end

  module KNearestNeighbors
    class Model
      def initialize(items, features=[], n_neighbors=3)
        @items = items.to_json
        @features = features
        @n_neighbors = n_neighbors
      end
      def similar_with(id)
        script_path = "#{Gem.loaded_specs['ML_Ruby'].gem_dir}/lib/python/k_nearest_neighbors.py"
        result = `#{MLRuby::PYTHON_PATH} #{script_path} '#{@items}' '#{@features}' '#{id}' '#{@n_neighbors}'`
        JSON.parse(result.gsub(/'([^']+)'/, '"\1"'))
      end
    end
  end

end
