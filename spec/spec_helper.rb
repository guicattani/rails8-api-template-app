# frozen_string_literal: true

require 'rake'
require 'active_record'
require 'pry'
require 'dotenv'
Dotenv.load

RSpec.configure do |config|
  Kernel.srand config.seed
  config.filter_run_when_matching :focus
  config.order = :random
  config.profile_examples = 10

  # use documentation formatter if we have a low number of tests
  config.formatter = :documentation if config.files_to_run.count < 20

  config.example_status_persistence_file_path = "./spec/examples.txt"
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
