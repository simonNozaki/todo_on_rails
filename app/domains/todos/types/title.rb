# Title value object
class Todos::Types::Title
  include ObjectConst

  # @param [String] value
  def initialize(value)
    raise Exceptions::ObjectValidationError.new(TITLE_CONSTRAINT_ERROR_BLANK) if value.empty?
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
