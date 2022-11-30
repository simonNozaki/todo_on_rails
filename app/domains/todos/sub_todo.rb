module Todos
  # Sub todo entity
  class SubTodo

    # @param [String] id
    # @param [Todos::Types::Title] title
    # @param [symbol] state
    # @param [Todos::Types::Deadline] deadline
    # @param [Todos::Types::Comment] comment
    def initialize(id, title, state, deadline, comment)
      @id = id
      @title = title
      @state = state
      @deadline = deadline
      @comment = comment
    end

    attr_reader :id, :title, :state, :deadline, :comment

    # Easy factory method
    # @param [Todos::Types::Title] title
    # @param [Symbol] state
    # @param [Todos::Types::Deadline] deadline
    # @param [Todos::Types::Comment] comment
    def self.of(title, state, deadline, comment)
      self.new(
        SecureRandom.uuid.to_s,
        title,
        state,
        deadline,
        comment
      )
    end

    # @param [Todos::SubTodo] sub_todo
    def ==(sub_todo)
      @id == sub_todo.id
    end

    def to_s
      "SubTodo(id=#{@id}, title=#{@title}, state=#{@state}, deadline=#{@deadline}, comment=#{@comment}"
    end
  end
end
