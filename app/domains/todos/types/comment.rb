# Comment domain object
class Todos::Types::Comment
  include ObjectConst

  # @param [String] value
  def initialize(value)
    if value && value.size > StringConst::COMMENT_MAX_LENGTH
      raise Exceptions::ObjectValidationError.new(COMMENT_ERROR_TOO_LONG)
    end
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
