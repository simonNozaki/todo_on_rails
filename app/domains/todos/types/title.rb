# Title value object
class Todos::Types::Title
  include ObjectConst
  include StringConst

  # @param [String] value
  def initialize(value)
    raise Exceptions::ObjectValidationError.new(TITLE_ERROR_BLANK) if value.empty?
    raise Exceptions::ObjectValidationError.new(TITLE_ERROR_TOO_LONG) if value.length > TITLE_MAX_LENGTH
    @value = value
  end

  attr_reader :value

  # @param [Todos::Types::Title] title
  def ==(title)
    @value == title.value
  end

  def to_s
    "Title(value=#{@value})"
  end
end
