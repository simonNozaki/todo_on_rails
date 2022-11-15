module Domain
  module Users

    class TodoItemRepository
      # Return todos array associated with a user
      # @param [String] id
      # @return [Todo]
      def find_by_user_id(id)
        todos = TodoItem.find_by_user_id(id)
        raise Exceptions::ResourceNotFoundError unless todos
        todos.map do |todo|
          state = to_state_symbol(todo.state)
          Domain::Todos::Todo.new(todo.id, todo.title, state, todo.deadline, todo.comment, todo.sub_todo_items)
        end
      end

      private
        # from state code to symbol
        # @@param [String] state_code
        def to_state_symbol(state_code)
          case state_code
          when "0" then :unprocessed
          when "1" then :in_progress
          when "2" then :done
          when "3" then :gone
          else raise Exceptions::ResourceUndefinedError
          end
        end
    end

  end
end
