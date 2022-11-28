module Todos

  class TodoItemRepository
    include(Todos)
    include(Todos::Types)
    include(Users::Types)

    # Return todos entities array associated with a user
    # @param [String] id
    # @return [Array]
    def find_by_user_id(id)
      todos = TodoItem.where(user_id: id)
      return [] unless todos

      todos.map do |item|
        sub_todo = item.sub_todo_items.map { |sub_item|
          Todos::SubTodo.new(
            sub_item.id.to_s,
            sub_item.title,
            to_state_symbol(sub_item.state),
            sub_item.deadline.to_datetime,
            sub_item.comment
          )
        }
        Todos::Todo.new(
          item.id.to_s,
          item.title,
          to_state_symbol(item.state),
          item.deadline.to_datetime,
          item.comment,
          sub_todo
        )
      end
    end

    # @param [String] id
    # @param [UserId] user_id
    # @return [Todo] todos
    def find_by_id_and_user_id(id, user_id)
      record = TodoItem.where(id: id, user_id: user_id.value).first
      raise(Exceptions::ResourceNotFoundError("", "TodoItem", id)) if record.nil?

      title = Title.new(record.title)
      state = to_state_symbol(record.state)
      deadline = Deadline.new(record.deadline)
      comment = Comment.new(record.comment)
      sub_todos = record.sub_todo_items.map do |sub|
        title = Title.new(sub.title)
        state = to_state_symbol(sub.state)
        deadline = Deadline.new(sub.deadline)
        comment = Comment.new(sub.comment)
        SubTodo.new(
          sub.id.to_s,
          title,
          state,
          deadline,
          comment
        )
      end

      Todo.new(
        id.to_s,
        title,
        state,
        deadline,
        comment,
        sub_todos
      )
    end

    # @param [Todos::Todo] todo
    # @param [Users::Types::UserId] user_id
    def save(todo, user_id)
      state_code_pair = TODO_STATE
                     .filter { |k, v| v == todo.state }
                     .first
      raise(ResourceUndefinedError.new('', 'state', state)) if state_code_pair.nil?
      TodoItem.create!(
        id: todo.id,
        title: todo.title.value,
        state: state_code_pair.first,
        deadline: todo.deadline.value,
        user_id: user_id.value
      )
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
