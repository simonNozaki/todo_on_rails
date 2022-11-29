class V1::UsersController < ApplicationController
  include(Todos::Usecases)

  # Execute the use case that return todo items associated with a user
  def show
    user_id = params[:id]
    todo_entities = ListTodosUsecase.new.execute(user_id)
    todos = create_list_response(todo_entities)

    render({ json:
               { items: todos }
           })
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
