class V1::SubTodosController < ApplicationController
  include(Todos::Usecases)
  include(V1::Structs)
  include(V1::Validators)
  include(Exceptions)

  def create
    contract = CreateSubTodosRequestContract.new.call(
      user_id: params[:sub_todo][:user_id],
      id: params[:sub_todo][:id],
      title: params[:sub_todo][:title],
      deadline: params[:sub_todo][:deadline],
      comment: params[:sub_todo][:comment]
    )

    raise(ObjectValidationError.new(get_errors(contract))) if contract.errors.present?

    request = CreateSubTodosRequest.new(
      params[:sub_todo][:user_id],
      params[:sub_todo][:id],
      params[:sub_todo][:title],
      params[:sub_todo][:deadline],
      params[:sub_todo][:comment]
    )

    result = CreateSubTodosUsecase.new.execute(request)
    render({
             json: {
               user_id: request.user_id,
               todo_id: request.id,
               id: result.id
             }
           })
  end

  private
    # @param [Dry::Validation::Result] contract
    def get_errors(contract)
      contract.errors.map { |k,v| "#{k} is nil" }
    end
end
