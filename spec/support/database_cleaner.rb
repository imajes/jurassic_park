# frozen_string_literal: false

RSpec.configure do |config|
  # Clean up and initialize database before
  # running test examples
  config.before(:suite) do
    # Truncate database to clean up garbage from
    # interrupted or badly written examples
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around do |example|
    # Use really fast transaction strategy for all
    # examples except `js: true` capybara specs
    # examples except `commit_records: true` commit hooks need to be run
    should_truncate = (
      !example.metadata[:commit_records].nil? || !example.metadata[:js].nil?
    )

    DatabaseCleaner.strategy =
      if should_truncate
        [:truncation, { except: %w[] }]
      else
        :transaction
      end

    # Start transaction
    DatabaseCleaner.cleaning do
      # Run example
      example.run
    end
  end
end
