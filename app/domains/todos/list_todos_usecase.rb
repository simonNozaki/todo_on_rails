module Todos

  # Usecase of list todos associated to a user
  class ListTodosUsecase
    def initialize
      @repository = Todos::TodoItemRepository.new
    end

    # @param [String] user_id
    def execute(user_id)
      todos = @repository.find_by_user_id(user_id)
      result = todos.map { |todo|
        {
          id: todo.id,
          title: todo.title,
          state: todo.state,
          deadline: todo.deadline,
          comment: todo.comment,
          sub_todos: todo.sub_todos
        }
      }
      {
        items: result
      }
    end
  end

end

