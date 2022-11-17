module Todos
  # TODO item entity
  class Todo

    # @param [String] id
    # @param [String] title
    # @param [Const::Todo::TodoState] state
    # @param [DateTime] deadline
    # @param [String] comment
    # @param [Array] sub_todos
    def initialize(id, title, state, deadline, comment, sub_todos)
      @id = id
      @title = title
      @state = state
      @deadline = deadline
      @comment = comment
      @sub_todos = sub_todos
    end

    # Easy factory method
    # @param [String] title
    # @param [Const::Todo::TodoState] state
    # @param [DateTime] deadline
    # @param [String] comment
    def self.of(title, state, deadline, comment)
      self.new(
        SecureRandom.uuid.to_s,
        title,
        state,
        deadline,
        comment,
        nil
      )
    end

    attr_reader :id, :title, :state, :deadline, :comment, :sub_todos

    # @param [Todos::Todo] todo
    def ==(todo)
      @id == todo.id
    end

    def to_s
      "Todo(id=#{@id}, title=#{@title}, state=#{@state}, deadline=#{@deadline}, comment=#{@comment}, sub_todos=#{@sub_todos})"
    end
  end
end

