module V1::Structs
  # Struct for response of creating todos
  CreateTodoResponse = Concurrent::ImmutableStruct.new(:user_id, :id)
end
