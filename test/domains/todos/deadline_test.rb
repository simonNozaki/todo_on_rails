require 'test_helper'

class DeadlineTest < ActionDispatch::IntegrationTest
  test "should raise error by not formatted time string" do
    assert_raises(ArgumentError) { Todos::Types::Deadline.new(Time.parse('today')) }
  end

  test "should create deadline object" do
    today = Time.parse('2022-11-17')
    assert_equal "2022-11-17 00:00:00 +0900", Todos::Types::Deadline.new(today).value.to_s
  end

  test "should create deadline object from string" do
    today = '2022-11-17'
    assert_equal Time.parse(today), Todos::Types::Deadline.from_s(today).value
  end
end
