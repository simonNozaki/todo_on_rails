ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # @param [Time] time
  # @param [Integer] days
  def get_days_later(time, days)
    time + (60*60*24*days)
  end

  # @return [String] time string
  def get_week_later
    get_days_later(Time.now, 7).to_s
  end

  TODO_STATE = {
    :unprocessed => "0",
    :in_progress => "1",
    :done => "2",
    :gone => "3"
  }.freeze
end
