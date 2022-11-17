# Usecase of list todos associated to a user
class Todos::Usecases::ListTodosUsecase
  def initialize
    @repository = Todos::TodoItemRepository.new
  end

  # @param [String] user_id
  def execute(user_id)
    todos = @repository.find_by_user_id(user_id)
    result = to_response(todos)
    {
      items: result
    }
  end

  private
    # 生のレスポンスに返却する
    # @param [Array] todo_entities
    def to_response(todo_entities)
      todo_entities.map { |todo|
        sub_todo = todo.sub_todos.map { |t|
          {
            id: t.id,
            title: t.title,
            state: t.state,
            deadline: t.deadline,
            comment: t.comment
          }
        }
        {
          id: todo.id,
          title: todo.title,
          state: todo.state,
          deadline: todo.deadline,
          comment: todo.comment,
          sub_todos: sub_todo
        }
      }
    end
end
