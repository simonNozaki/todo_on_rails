# Deadline domain object
class Todos::Types::Deadline
  # @param [DateTime]
  def initialize(value)
    @value = value
  end

  attr_reader :value

  # @param [String] datetime_string
  def self.from_s(datetime_string)
    v = Time.parse(datetime_string)
    self.new(v)
  end

  # @param [Todos::Usecases::Deadline] deadline
  def ==(deadline)
    @value == deadline.value
  end

  def to_s
    "Deadline(value=#{@value})"
  end
end
