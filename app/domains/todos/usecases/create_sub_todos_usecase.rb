class Todos::Usecases::CreateSubTodosUsecase
  include(Todos::Types)
  include(Todos)
  include(Users::Types)

  def initialize
    @repository = Todos::TodoItemRepository.new
  end

  # @param [V1::Structs::CreateSubTodosRequest] request
  # @return [Todos::SubTodos] sub_todo
  def execute(request)
    user_id = UserId.new(request.user_id)
    title = Title.new(request.title)
    deadline = Deadline.new(request.deadline)
    comment = Comment.new(request.comment)
    sub_todo = SubTodo.of(title, :unprocessed, deadline, comment)

    @repository.save_sub_todo(sub_todo, user_id, request.id)

    sub_todo
  end
end
