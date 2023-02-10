# frozen_string_literal: true

RSpec.configure do |config|
  config.before { allow($stdout).to receive(:puts) }

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec::Matchers.define :be_of_color do |expected|
  match do |actual|
    actual.color == expected
  end
end
