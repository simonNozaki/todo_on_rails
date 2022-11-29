class V1::TodosController < ApplicationController
  include(Todos::Usecases)
  include(V1::Structs)

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

end
