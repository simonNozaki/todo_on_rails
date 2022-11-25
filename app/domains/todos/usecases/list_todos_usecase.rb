# Usecase of list todos associated to a user
class Todos::Usecases::ListTodosUsecase
  def initialize
    @repository = Todos::TodoItemRepository.new
  end

  # @param [String] user_id
  def execute(user_id)
    @repository.find_by_user_id(user_id)
  end

end
