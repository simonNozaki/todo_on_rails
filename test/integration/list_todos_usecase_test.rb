require "test_helper"

class ListTodosUsecaseTest < ActionDispatch::IntegrationTest
  def setup
    @todo_item_main_1 = todo_items(:main_todo_item_1)
    @todo_item_main_2 = todo_items(:main_todo_item_2)
    @sub_todo_item_1 = sub_todo_items(:sub_todo_item_1)
    @sub_todo_item_2 = sub_todo_items(:sub_todo_item_2)
    @use_case = Todos::Usecases::ListTodosUsecase.new
  end

  test "should return empty array" do
    result = @use_case.execute("0")
    assert_equal({ items: [] }, result)
  end

  test "should return an item associated with main user" do
    result = @use_case.execute(users(:michael).id)
    assert_equal(
      {
        items: [
          {
            id: @todo_item_main_1.id.to_s,
            title: @todo_item_main_1.title,
            state: :unprocessed,
            deadline: @todo_item_main_1.deadline.to_datetime,
            comment: @todo_item_main_1.comment,
            sub_todos: []
          }
        ]
      },
      result
    )
  end

  test "should have sub todos associated with main user" do
    result = @use_case.execute(users(:archer).id)
    assert_equal 1, result[:items].size
    assert_equal 2, result[:items][0][:sub_todos].length
    sub_todos = result[:items][0][:sub_todos].sort_by { |item| item[:id] }
    assert_equal @sub_todo_item_1[:id], sub_todos[0][:id].to_i
  end
end
