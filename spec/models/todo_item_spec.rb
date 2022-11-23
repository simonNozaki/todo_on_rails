require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  describe "TodoItem" do
    context "success to save" do
      it "should build a todo" do
        todo_item = FactoryBot.build(:todo_item)
        expect(todo_item).to be_valid
      end
    end

    context "fail to save" do
      it "should raise TodoRuntimeError(state blank)" do
        todo_item = FactoryBot.build(:todo_item, state: nil)
        expect { todo_item.save }.to raise_error Exceptions::TodoRuntimeError
      end
    end
  end
end
