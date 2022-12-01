module V1::Structs
  # Struct for response of creating todos
  CreateTodoResponse = Concurrent::ImmutableStruct.new(:user_id, :id)

  # Struct for response of completed todos
  CompleteTodoResponse = Concurrent::ImmutableStruct.new(:user_id, :id)

  # Struct for request of creating subtodos
  CreateSubTodosRequest = Concurrent::ImmutableStruct.new(:user_id, :id, :title, :deadline, :comment)

  # Struct for response of creating subtodos
  CreateSubTodosResponse = Concurrent::ImmutableStruct.new(:user_id, :todo_id, :id)
end
