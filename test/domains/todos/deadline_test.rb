require 'test_helper'

class DeadlineTest < ActionDispatch::IntegrationTest
  include Todos::Types

  test "should raise error by not formatted time string" do
    assert_raises(ArgumentError) { Deadline.new(Time.parse('today')) }
  end

  test "should create deadline object" do
    today = Time.parse('2022-11-17')
    deadline = Time.parse('2022-11-20')
    assert_equal "2022-11-20 00:00:00 +0900", Deadline.new(deadline, today).value.to_s
  end

  test "should create deadline object from string" do
    today = '2022-11-17'
    deadline = '2022-11-20'
    assert_equal Time.parse(deadline), Deadline.from_s(deadline, today).value
  end
end
