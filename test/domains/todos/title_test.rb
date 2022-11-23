require "test_helper"

class TitleTest < ActionDispatch::IntegrationTest
  include(Exceptions)
  include(Todos::Types)

  test "should raise error with blank" do
    assert_raises(ObjectValidationError) { Todos::Types::Title.new('') }
  end

  test "should raise error with too long title chars" do
    title = "a" * 51
    assert_raises(ObjectValidationError) { Title.new(title) }
  end

  test "should create domain object" do
    assert_equal "coding", Todos::Types::Title.new("coding").value
  end
end
