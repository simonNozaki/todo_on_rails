require 'rails_helper'

RSpec.describe V1::TodosController, type: :controller do
  describe "POST /v1/todos" do
    context "with runtime errors" do
      it "should get bad request(title blank)" do
        req = {
          user_id: '0',
          title: "",
          state: TestHelper::State::TODO_STATE[:unprocessed],
          deadline: get_week_later,
          comment: ""
        }

        post(:create, { params: { todo: req } })
        result = JSON.parse(response.body)

        expect(response).to have_http_status(:bad_request)
        expect(result['error'].present?).to be_truthy
      end
    end

    context "with an existing user" do
      it "should success to create a todo" do
        todo_item = FactoryBot.create(:todo_item)
        req = {
          user_id: todo_item.user_id,
          title: "controller testing",
          state: TestHelper::State::TODO_STATE[:unprocessed],
          deadline: get_week_later,
          comment: ""
        }

        post(:create, { params: { todo: req } })
        result = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(result['id'].present?).to be_truthy
        expect(result['user_id']).to eq(todo_item.user_id.to_s)
      end
    end
  end

  describe("PUT /v1/todos/complete") do
    context("when a user exists") do
      it("should get a response") do
        todo_item = FactoryBot.create(:todo_item)
        put(:complete, { params: { todo: { id: todo_item.id, user_id: todo_item.user_id } } })
        result = JSON.parse(response.body)

        expect(response).to(have_http_status(:ok))
        expect(result['id'].present?).to be_truthy
        expect(result['user_id']).to eq(todo_item.user_id.to_s)
      end
    end
  end
end
