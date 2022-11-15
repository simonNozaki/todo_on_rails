module Domain
  module Users

    # Usecase of list todos associated to a user
    class ListTodosUsecase
      def initialize
        @repository = Domain::Todos::TodoItemRepository.new
      end

      # @param [String] user_id
      def execute(user_id)
        todos = @repository.find_by_user_id(user_id)
        {
          items: todos
        }
      end
    end

  end
end

