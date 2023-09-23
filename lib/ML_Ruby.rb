# frozen_string_literal: true

require_relative "ML_Ruby/version"
require 'json'

module MLRuby
  PYTHON_PATH = `which python3`.gsub("\n","")
  module LinearRegression
    class Model
      def initialize(x, y)
        @x = x
        @y = y
      end
      def predict(next_x)
        script_path = "#{Gem.loaded_specs['ML_Ruby'].gem_dir}/lib/python/linear_regression.py"
        result = `#{MLRuby::PYTHON_PATH} #{script_path} "#{@x}, #{@y}, #{next_x}"`
        result.to_f
      end
    end
  end

  module LogisticRegression
    class Model
      def initialize(x, y)
        @x = x
        @y = y
      end
      def predict(nexts)
        script_path = "#{Gem.loaded_specs['ML_Ruby'].gem_dir}/lib/python/logistic_regression.py"
        result = `#{MLRuby::PYTHON_PATH} #{script_path} "#{@x}, #{@y}, #{nexts}"`
        result.gsub("\n","").gsub("[","").gsub("]","").split(" ").map(&:to_i)
      end
    end
  end

  module RandomForestRegression
    class Model
      def initialize(x, y)
        @x = x
        @y = y
      end
      def predict(next_x)
        script_path = "#{Gem.loaded_specs['ML_Ruby'].gem_dir}/lib/python/random_forest.py"
        result = `#{MLRuby::PYTHON_PATH} #{script_path} "#{@x}, #{@y}, #{next_x}"`
        result.gsub(/\[|\]/, '').split(' ').map(&:strip).map(&:to_f)
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
        result.to_i
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

  module NaturalLanguageProcessing
    module TextClassifier
      class Model
        def initialize(training_data)
          @training_data = training_data
        end
        def predict(new_data=[])
          script_path = "#{Gem.loaded_specs['ML_Ruby'].gem_dir}/lib/python/natural_language_processing/text_classifier.py"
          result = `#{MLRuby::PYTHON_PATH} #{script_path} '#{@training_data}' '#{new_data}'`
          JSON.parse(result.gsub("'", "\""))
        end
      end
    end
    module SupportVectorMachine
      class Model
        def initialize(training_data=[], categories=[])
          @training_data = training_data
          @categories = categories
        end
        def predict(new_data=[])
          script_path = "#{Gem.loaded_specs['ML_Ruby'].gem_dir}/lib/python/natural_language_processing/support_vector_machine.py"
          result = `#{MLRuby::PYTHON_PATH} #{script_path} '#{@training_data}' '#{@categories}' '#{new_data}'`
          result.gsub("\n", "").gsub(/[\[\]]/, '').split("' '").map { |element| element.gsub(/'/, '') }
        end
      end
    end
  end

end
