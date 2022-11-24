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

  describe "GET /v1/todos/:user_id" do
    context "with not existing user" do
      it 'should handle runtime error(user not found)' do
        # TODO Force checking user_id
      end
    end
    context "with an existing user" do
      it "should get empty response" do
        user = FactoryBot.create(:user)

        get(:show, { params: { id: user.id } })
        result = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(result['items'].size).to eq(0)
      end

      it "should get response(items: 1)" do
        todo_item = FactoryBot.create(:todo_item)

        get(:show, { params: { id: todo_item.user_id } })
        result = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(result['items'].size).to eq(1)
      end
    end
  end
end
