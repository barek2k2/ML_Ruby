# frozen_string_literal: true

require_relative "lib/ML_Ruby/version"

Gem::Specification.new do |spec|
  spec.name = "ML_Ruby"
  spec.version = MLRuby::VERSION
  spec.authors = ["Abdul Barek"]
  spec.email = ["barek2k2@gmail.com"]

  spec.summary = "Ruby gem uses Machine Learning(ML) techniques to make predictions and classifications, and it's powered by Python3 under the hood."
  spec.description = "This Ruby gem leverages Machine Learning(ML) techniques to make predictions(forecasts) and classifications in various applications. It provides capabilities such as predicting next month's billing, forecasting upcoming sales orders, identifying patient's potential findings(like Diabetes), determining user approval status, classifying text, generating similarity scores, and making recommendations. It uses Python3 under the hood, powered by popular machine learning techniques including NLP(Natural Language Processing), Decision Tree, K-Nearest Neighbors and Logistic Regression, Random Forest and Linear Regression algorithms."
  spec.homepage = "https://github.com/barek2k2/ML_Ruby"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = "https://github.com/barek2k2/ML_Ruby"
  spec.metadata["source_code_uri"] = "https://github.com/barek2k2/ML_Ruby"
  spec.metadata["changelog_uri"] = "https://github.com/barek2k2/ML_Ruby"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
