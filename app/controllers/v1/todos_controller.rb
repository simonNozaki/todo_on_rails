class V1::TodosController < ApplicationController
  include(Todos::Usecases)
  include(V1::Structs)

  # Execute the use case that return todo items associated with a user
  def show
    # TODO idをuser_idと誤解している... POSTで受け取るようにする
    user_id = params[:id]
    todo_entities = ListTodosUsecase.new.execute(user_id)
    todos = create_list_response(todo_entities)

    render json: {
      items: todos
    }
  end

  # Execute the use case that create a todo item
  def create
    request = params[:todo]
    result = CreateTodosUsecase.new.execute(request)

    render(json: CreateTodoResponse.new(request[:user_id], result.id).to_h)
  end

  # Execute the use case that complete a todo item
  def complete
    id = params[:todo][:id]
    user_id = params[:todo][:user_id]
    result = CompleteTodosUsecase.new.execute(id, user_id)

    render(json: CompleteTodoResponse.new(user_id, result.id).to_h)
  end

  private
    # Transform domain object to raw response
    # @param [Array] todo_entities
    def create_list_response(todo_entities)
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
