class TodoItem < ApplicationRecord
  belongs_to :user
  has_many :sub_todo_items
  include Exceptions
  before_save :raise_on_not_undefined_state

  private
    def raise_on_not_undefined_state
      raise TodoAppRuntimeError.new('state is blank') if state.to_s.blank?
    end
end
