require "test_helper"

class TodoItemTest < ActiveSupport::TestCase
  include Exceptions

  def setup
    @todo_item = todo_items(:main_todo_item_1)
  end

  test "should raise TodoRuntimeError(state blank)" do
    @todo_item.state = ''
    assert_raises(TodoRuntimeError) { @todo_item.save }
  end

  test "should raise ResourceUndefinedError(state)" do
    @todo_item.state = '5'
    assert_raises(ResourceUndefinedError) { @todo_item.save }
  end
end
