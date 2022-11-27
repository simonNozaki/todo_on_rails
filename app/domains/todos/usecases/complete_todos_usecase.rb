class Todos::Usecases::CompleteTodosUsecase
  include(Users::Types)

  def initialize
    @repository = Todos::TodoItemRepository.new
  end

  # Execute use case of making todo done
  # @param [String] id
  # @param [String] user_id
  # @return [Todos::Todo] todos
  def execute(id, user_id)
    user_id = UserId.new(user_id)
    todo = @repository.find_by_id_and_user_id(id, user_id)
    todo.complete

    todo
  end
end
