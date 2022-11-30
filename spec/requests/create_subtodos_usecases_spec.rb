require 'rails_helper'

RSpec.describe Todos::Usecases::CreateSubTodosUsecase, type: :request do
  use_case = Todos::Usecases::CreateSubTodosUsecase.new
  SubTodo = Todos::SubTodo
  CreateSubTodosRequest = V1::Structs::CreateSubTodosRequest

  context("with a existing user") do
    it("should create a sub todo associated with a todo") do
      todo_item = FactoryBot.create(:todo_item)
      request = CreateSubTodosRequest.new(todo_item.user_id, todo_item.id, "coding", get_week_later, "")

      result = use_case.execute(request)

      expect(result).to(be_instance_of(SubTodo))
      expect(result.title.value).to(eq(request[:title]))
      expect(result.state).to(eq(:unprocessed))
    end
  end

  context("with not existing resource") do
    it("should raise ResourceNotFoundError(user not found)") do
      user = FactoryBot.create(:user)
      request = CreateSubTodosRequest.new(user.id, "0", "coding", get_week_later, "")

      expect { use_case.execute(request) }.to(raise_error(Exceptions::ResourceNotFoundError))
    end

    it("should raise ResourceNotFoundError(todo not found)") do
      todo_item = FactoryBot.create(:todo_item)
      request = CreateSubTodosRequest.new("0", todo_item.id, "coding", get_week_later, "")

      expect { use_case.execute(request) }.to(raise_error(Exceptions::ResourceNotFoundError))
    end
  end
end
