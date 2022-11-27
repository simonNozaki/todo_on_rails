require 'rails_helper'

describe 'CompleteTodosUsecase' do
  use_case = Todos::Usecases::CompleteTodosUsecase.new
  Title = Todos::Types::Title

  context 'when a user exists' do
    it 'should complete the todo' do
      todo_item = FactoryBot.create(:todo_item)
      result = use_case.execute(todo_item.id, todo_item.user_id)
      expect(result).to be_instance_of Todos::Todo
      expect(result.id).to eq(todo_item.id.to_s)
      expect(result.state).to eq(:done)
      expect(result.title).to eq(Title.new(todo_item.title))
      expect(result.sub_todos).to eq([])
    end
  end
end
