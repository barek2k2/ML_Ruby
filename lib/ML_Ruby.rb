# frozen_string_literal: true

require_relative "ML_Ruby/version"

module MLRuby
  PYTHON_PATH = '/usr/bin/python3'
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

end
