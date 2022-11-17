class V1::TodosController < ApplicationController

  def show
    user_id = params[:id]
    todos = Todos::Usecases::ListTodosUsecase.new.execute(user_id)

    render json: todos
  end

  def create
    request = params[:todo]
    result = Todos::Usecases::CreateTodosUsecase.new.execute(request)

    render json: {
      user_id: request[:user_id],
      id: result.id
    }
  end

end
