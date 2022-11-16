class V1::TodosController < ApplicationController

  def show
    list_todos_usecase = Todos::ListTodosUsecase.new
    user_id = params[:id]
    todos = list_todos_usecase.execute(user_id)

    render json: todos
  end

end
