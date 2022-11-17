# Title value object
class Todos::Types::Title
  # @param [String] value
  def initialize(value)
    raise Exceptions::ObjectValidationError.new if value.empty?
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
