# frozen_string_literal: false

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

module FactoryBot
  module Analytics

    def self.track_factories
      @factory_bot_results = {}

      ActiveSupport::Notifications.subscribe("factory_bot.run_factory") do |_name, _start, _finish, _id, payload|
        factory_name = payload[:name]
        strategy_name = payload[:strategy]
        @factory_bot_results[factory_name] ||= {}
        @factory_bot_results[factory_name][strategy_name] ||= 0
        @factory_bot_results[factory_name][strategy_name] += 1
      end
    end

    def self.print_statistics
      return nil if @factory_bot_results.blank?

      puts "\nFactory Bot Run Results.. [strategies per factory]:"
      rows = @factory_bot_results.map do |r|
        [r.first, r.last.fetch(:create, 0),
         r.last.fetch(:build, 0), r.last.fetch(:build_stubbed, 0)]
      end
      rows = rows.sort_by { |t| [t[1], t[3]] }.reverse
      print_as_table(rows)
    end

    def self.print_as_table(data)
      table = Terminal::Table.new headings: %w[Factory Created Built Stubbed], rows: data
      table.align_column(0, :right)
      table.align_column(1, :center)
      table.align_column(2, :center)
      table.align_column(3, :center)

      puts table
    end

    def self.enabled?
      @enabled ||= ActiveModel::Type::Boolean.new.cast(ENV.fetch("ENABLE_FACTORY_BOT_ANALYSIS", true))
    end

  end
end

RSpec.configure do |config|
  config.before(:suite) do
    FactoryBot::Analytics.track_factories if FactoryBot::Analytics.enabled?
  end

  config.after(:suite) do
    FactoryBot::Analytics.print_statistics if FactoryBot::Analytics.enabled?
  end
end
