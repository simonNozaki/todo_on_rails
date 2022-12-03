require 'rails_helper'

RSpec.describe V1::SubTodosController, type: :controller do
  context("on validation error") do
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
      expect(result).to(eq({ "error" => "user_id is nil" }))
    end

    it("should be validated on controller by 2 validation error") do
      post(:create, { params: { sub_todo: {
        user_id: "",
        id: "",
        title: "coding",
        deadline: get_week_later,
        comment: ""
      } } })
      result = JSON.parse(response.body)

      expect(response).to(have_http_status(400))
      expect(result).to(eq({ "error" => "user_id is nil; id is nil" }))
    end
  end

  context("with a user existing") do
    it("should create a sub todo") do
      todo_item = FactoryBot.create(:todo_item)
      request = {
        user_id: todo_item.user_id,
        id: todo_item.id,
        title: "coding",
        deadline: get_week_later,
        comment: ""
      }
      post(:create, { params: { sub_todo: request } })
      result = JSON.parse(response.body)

      expect(response).to(have_http_status(200))
      expect(result).to(eq({
                             "user_id" => request[:user_id].to_s,
                             "todo_id" => request[:id].to_s,
                             "id" => result["id"]
                           }))
    end
  end
end
