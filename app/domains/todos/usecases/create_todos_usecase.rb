# Use case of creating a todo
class Todos::Usecases::CreateTodosUsecase
  def initialize
    @repository = Todos::TodoItemRepository.new
  end

  # Execute use case
  # @param request
  # @return [Todos::Todo] a created todo entity
  def execute(request)
    user_id = Users::Types::UserId.new(request[:user_id])
    raise Exceptions::ResourceNotFoundError.new('', 'User', user_id.value) unless User.where(id: user_id.value).exists?

    title = Todos::Types::Title.new(request[:title])
    deadline = Todos::Types::Deadline.new(request[:deadline])
    comment = Todos::Types::Comment.new(request[:comment])
    todo = Todos::Todo.of(
      title,
      :unprocessed,
      deadline,
      comment
    )

    @repository.save(todo, user_id)

    todo
  end
end
