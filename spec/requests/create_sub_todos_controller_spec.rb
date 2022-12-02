require 'rails_helper'

RSpec.describe V1::SubTodosController, type: :controller do
  it("should be validated on controller by 1 validation error") do
    todo_item = FactoryBot.create(:todo_item)
    post(:create, { params: { sub_todo: {
      user_id: "",
      id: todo_item.id,
      title: "coding",
      deadline: get_week_later,
      comment: ""
    } } })
    result = JSON.parse(response.body)

    expect(response).to(have_http_status(400))
    expect(result).to(eq({ "error" => ["user_id is nil"] }))
  end
end
