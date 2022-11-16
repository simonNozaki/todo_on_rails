module Todos
  # Sub todo entity
  class SubTodo

    # @param [String] id
    # @param [String] title
    # @param [Const::Todo::TodoState] state
    # @param [DateTime] deadline
    # @param [String] comment
    def initialize(id, title, state, deadline, comment)
      @id = id
      @title = title
      @state = state
      @deadline = deadline
      @comment = comment
    end

    attr_reader :id, :title, :state, :deadline, :comment

    # @param [Todos::SubTodo] sub_todo
    def ==(sub_todo)
      @id == sub_todo.id
    end

    def to_s
      "Todo(id=#{@id}, title=#{@title}, state=#{@state}, deadline=#{@deadline}, comment=#{@comment}"
    end
  end
end
