class V1::TodosController < ApplicationController
  include Todos::Usecases

  # Execute the use case that return todo items associated with a user
  def show
    user_id = params[:id]
    todos = ListTodosUsecase.new.execute(user_id)

    render json: todos
  end

  # Execute the use case that create a todo item
  def create
    request = params[:todo]
    result = CreateTodosUsecase.new.execute(request)

    render json: {
      user_id: request[:user_id],
      id: result.id
    }
  end

end
