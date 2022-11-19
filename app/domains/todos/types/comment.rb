# Comment domain object
class Todos::Types::Comment
  # @param [String] value
  def initialize(value)
    raise Exceptions::ObjectValidationError.new if value.size > StringConst::COMMENT_MAX_LENGTH
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
