require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  describe("GET /v1/users/:id") do
    context("with not existing user") do
      it 'should handle runtime error(user not found)' do
        # TODO Force checking user_id
      end
    end
    context("with an existing user") do
      it("should get empty response") do
        user = FactoryBot.create(:user)

        get(:show, { params: { id: user.id } })
        result = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(result['items'].size).to eq(0)
      end

      it("should get response(items: 1)") do
        todo_item = FactoryBot.create(:todo_item)

        get(:show, { params: { id: todo_item.user_id } })
        result = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(result['items'].size).to eq(1)
      end
    end
  end
end
