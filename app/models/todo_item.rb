class TodoItem < ApplicationRecord
  belongs_to :user
  has_many :sub_todo_items
end
