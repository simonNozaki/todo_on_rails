require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  test "should rescue runtime error(title blank)" do
    req = {
      user_id: "1",
      title: "",
      state: "0",
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
      user_id: "",
      title: "coding",
      state: "0",
      deadline: get_week_later,
      comment: ""
    }
    post v1_todos_url, params: { todo: req }
    result = JSON.parse(response.body)
    assert_response :bad_request
    assert_equal "Resource User with id nil not found.", result['error']
  end

  private
    # @param [Time] time
    # @param [Integer] days
    def get_days_later(time, days)
      time + (60*60*24*days)
    end

    # @return [String] time string
    def get_week_later
      get_days_later(Time.now, 7).to_s
    end
end
