require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  test "should rescue runtime error(title blank)" do
    user_michael = users(:michael)
    req = {
      user_id: user_michael.id,
      title: "",
      state: TODO_STATE[:unprocessed],
      deadline: get_week_later,
      comment: ""
    }
    post v1_todos_url, params: { todo: req }
    result = JSON.parse(response.body)
    assert_response :bad_request
    assert_equal "Title should not be blank", result['error']
  end

  test "should rescue runtime error(user not found)" do
    req = {
      user_id: "0",
      title: "coding",
      state: TODO_STATE[:unprocessed],
      deadline: get_week_later,
      comment: ""
    }
    post v1_todos_url, params: { todo: req }
    result = JSON.parse(response.body)
    assert_response :bad_request
    assert_equal "Resource User with id 0 not found.", result['error']
  end
end
