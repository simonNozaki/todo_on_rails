require 'rails_helper'

RSpec.describe "Create todos use case", type: :request do
  use_case = Todos::Usecases::CreateTodosUsecase.new

  context "with not existing a user" do
    it 'should raise error' do
      req = {
        user_id: "0",
        title: "review",
        state: TestHelper::State::TODO_STATE[:unprocessed],
        deadline: "2022-11-22",
        comment: ""
      }
      expect { use_case.execute(req) }.to raise_error Exceptions::ResourceNotFoundError
    end
  end

  context "with a user" do
    it 'should create a todo' do
      user = FactoryBot.create(:user)
      req = {
        user_id: user.id,
        title: "review",
        state: TestHelper::State::TODO_STATE[:unprocessed],
        deadline: get_week_later,
        comment: ""
      }

      result = use_case.execute(req)

      expect(result).to be_instance_of(Todos::Todo)
      expect(result.title.value).to be(req[:title])
      expect(result.id.present?).to be_truthy
      expect(TodoItem.where(id: result.id, user_id: user.id)).to exist
    end
  end
end
