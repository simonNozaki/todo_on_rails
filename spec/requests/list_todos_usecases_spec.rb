require 'rails_helper'

RSpec.describe "List todos use case", type: :request do
  before do
    @use_case = Todos::Usecases::ListTodosUsecase.new
  end

  context "with not existing user" do
    it 'should get empty result' do
      result = @use_case.execute('0')
      expect(result).to eq({ :items => [] })
    end
  end

  context "with an existing user" do
    it 'should create a todo' do
      todo_item = FactoryBot.create(:todo_item)
      result = @use_case.execute(todo_item.user_id)
      expect(result[:items]).to eq(
                                  [
                                    {
                                      id: todo_item.id.to_s,
                                      title: todo_item.title,
                                      state: :in_progress,
                                      deadline: todo_item.deadline.to_datetime,
                                      comment: todo_item.comment,
                                      sub_todos: []
                                    }
                                  ]
                                )
    end

    it 'should create a todo with sub todo' do
      sub_todo_item = FactoryBot.create(:sub_todo_item)
      todo_item = TodoItem.find(sub_todo_item.todo_item_id)

      result = @use_case.execute(todo_item.user_id)

      expect(result[:items].size).to eq(1)
      expect(result[:items][0][:sub_todos].size).to eq(1)
      # レスポンスに含まれるIDの存在判定しやすいように...
      sub_todo_ids = result[:items][0][:sub_todos]
                       .map { |item| item[:id].to_s }
                       .to_set
      expect(sub_todo_ids.include?(sub_todo_item.id.to_s)).to be_truthy
    end
  end
end
