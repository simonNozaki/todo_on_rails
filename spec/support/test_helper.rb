module TestHelper
  module Datetime
    # Return N days later from now
    # @param [Time] time
    # @param [Integer] days
    def get_days_later(time, days)
      time + (60*60*24*days)
    end

    # Return a week after from now
    # @return [String] time string
    def get_week_later
      get_days_later(Time.now, 7).to_s
    end
  end

  module State
    TODO_STATE = {
      :unprocessed => "0",
      :in_progress => "1",
      :done => "2",
      :gone => "3"
    }.freeze
  end
end
