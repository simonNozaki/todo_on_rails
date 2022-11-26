class TodoItem < ApplicationRecord
  belongs_to :user
  has_many :sub_todo_items
  include Exceptions
  before_save :raise_on_not_undefined_state

  private
    TODO_STATE_CODES = %w[0 1 2 3].to_set

    def raise_on_not_undefined_state
      raise TodoAppRuntimeError.new('state is blank') if state.to_s.blank?
      raise ResourceUndefinedError.new('', 'state', state) unless TODO_STATE_CODES.include?(state)
    end
end
