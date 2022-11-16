require "test_helper"

class ListTodosUsecaseTest < ActionDispatch::IntegrationTest
  def setup
    @todo_item_main_1 = todo_items(:main_todo_item_1)
    @todo_item_main_2 = todo_items(:main_todo_item_2)
    @sub_todo_item_1 = sub_todo_items(:sub_todo_item_1)
    @sub_todo_item_2 = sub_todo_items(:sub_todo_item_2)
    @use_case = Todos::ListTodosUsecase.new
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
    assert_equal(
      {
        items: [
          {
            id: @todo_item_main_2.id.to_s,
            title: @todo_item_main_2.title,
            state: :in_progress,
            deadline: @todo_item_main_2.deadline.to_datetime,
            comment: @todo_item_main_2.comment,
            sub_todos: [
              {
                id: @sub_todo_item_1.id.to_s,
                title: @sub_todo_item_1.title,
                state: :in_progress,
                deadline: @sub_todo_item_1.deadline.to_datetime,
                comment: @sub_todo_item_1.comment,
              },
              {
                id: @sub_todo_item_2.id.to_s,
                title: @sub_todo_item_2.title,
                state: :in_progress,
                deadline: @sub_todo_item_2.deadline.to_datetime,
                comment: @sub_todo_item_2.comment,
              }
            ]
          }
        ]
      },
      result
    )
  end
end
