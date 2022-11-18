require "test_helper"

class TitleTest < ActionDispatch::IntegrationTest
  test "should raise error with blank" do
    assert_raises(Exceptions::ObjectValidationError) { Todos::Types::Title.new('') }
  end

  test "should create domain object" do
    assert_equal "coding", Todos::Types::Title.new("coding").value
  end
end
