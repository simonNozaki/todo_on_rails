# Comment domain object
class Todos::Types::Comment
  # @param [String] value
  def initialize(value)
    @value = value
  end

  attr_reader :value

  # @param [Todos::Usecases::Comment] comment
  def ==(comment)
    @value == comment.value
  end

  def to_s
    "Comment(value=#{@value})"
  end
end
