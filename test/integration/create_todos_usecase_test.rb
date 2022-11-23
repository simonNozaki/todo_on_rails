require "test_helper"

class CreateTodosUsecaseTest < ActionDispatch::IntegrationTest
  def setup
    @use_case = Todos::Usecases::CreateTodosUsecase.new
  end

  test "should throws error by an empty user" do
    req = {
      user_id: "0",
      title: "review",
      state: TODO_STATE[:unprocessed],
      deadline: "2022-11-22",
      comment: ""
    }
    assert_raises(Exceptions::ResourceNotFoundError) { @use_case.execute(req) }
  end

  test "should create a todo" do
    user_michael = users(:michael)
    req = {
      user_id: user_michael.id,
      title: "review",
      state: TODO_STATE[:unprocessed],
      deadline: get_week_later,
      comment: ""
    }

    result = @use_case.execute(req)

    assert_instance_of Todos::Todo, result
    assert_equal req[:title], result.title.value
    assert result.id.present?
    assert TodoItem.where(id: result.id, user_id: user_michael.id).exists?
  end
end
