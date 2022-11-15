class V1::TodosController < ApplicationController

  def initialize
    @list_todos_usecase = ListTodosUsecase.new
  end

  def show
    user_id = params[:id]
    todos = @list_todos_usecase.execute(user_id)

    render json: todos
  end
end
