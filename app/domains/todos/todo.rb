module Todos
  # TODO item entity
  class Todo

    # @param [String] id
    # @param [Todos::Types::Title] title
    # @param [Symbol] state
    # @param [Todos::Types::Deadline] deadline
    # @param [Todos::Types::Comment] comment
    # @param [Array] sub_todos
    def initialize(id, title, state, deadline, comment, sub_todos)
      raise Exceptions::ObjectLogicError.new("State #{state} not found") unless TODO_STATES.include?(state)
      @id = id
      @title = title
      @state = state
      @deadline = deadline
      @comment = comment
      @sub_todos = sub_todos
    end

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
        comment,
        []
      )
    end

    attr_reader :id, :title, :state, :deadline, :comment, :sub_todos

    # Make this todo done
    def complete
      raise(Exceptions::ObjectLogicError.new('Todo cannot be done because of state: gone')) if @state == :gone
      @state = :done
    end

    # @param [Todos::Todo] todo
    def ==(todo)
      @id == todo.id
    end

    def to_s
      "Todo(id=#{@id}, title=#{@title}, state=#{@state}, deadline=#{@deadline}, comment=#{@comment}, sub_todos=#{@sub_todos})"
    end

    private
      TODO_STATES = Set[:unprocessed,
                        :in_progress,
                        :done,
                        :gone].map(&:freeze).freeze
  end
end

