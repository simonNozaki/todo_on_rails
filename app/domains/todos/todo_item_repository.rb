module Todos

  class TodoItemRepository
    # Return todos entities array associated with a user
    # @param [String] id
    # @return [Array]
    def find_by_user_id(id)
      todos = TodoItem.where(user_id: id)
      return [] unless todos

      todos.map do |item|
        Todos::Todo.new(
          item.id.to_s,
          item.title,
          to_state_symbol(item.state),
          item.deadline.to_datetime,
          item.comment,
          item.sub_todo_items.map { |sub_item|
            Todos::SubTodo.new(
              sub_item.id,
              sub_item.title,
              to_state_symbol(sub_item.state),
              sub_item.deadline,
              sub_item.comment
            )
          }
        )
      end
    end

    private
      TODO_STATE = {
        "0" => :unprocessed,
        "1" => :in_progress,
        "2" => :done,
        "3" => :gone
      }.freeze

      # Return a symbol associated with state column value
      # @param [String] status_code
      def to_state_symbol(status_code)
        s = TODO_STATE[status_code]
        raise Exceptions::ResourceUndefinedError unless s
        s
      end
  end
end
