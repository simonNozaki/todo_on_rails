# Deadline domain object
class Todos::Types::Deadline
  include ObjectConst

  # @param [Time] value
  # @param [Time] now Base date time to compare future deadline date time.
  def initialize(value, now=Time.now)
    raise Exceptions::ObjectValidationError.new(DEADLINE_ERROR_NOT_AHEAD) if value < now
    @value = value
  end

  attr_reader :value

  # @param [String] datetime_string
  # @param [String] now_string
  def self.from_s(datetime_string, now_string=Time.now.to_s)
    v = Time.parse(datetime_string)
    now = Time.parse(now_string)
    self.new(v, now)
  end

  # @param [Todos::Usecases::Deadline] deadline
  def ==(deadline)
    @value == deadline.value
  end

  def to_s
    "Deadline(value=#{@value})"
  end
end
