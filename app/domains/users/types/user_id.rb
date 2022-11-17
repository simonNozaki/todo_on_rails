class Users::Types::UserId
  # @param [String] value
  def initialize(value)
    raise Exceptions::ObjectValidationError.new if value.to_s.empty?
    @value = value
  end

  attr_reader :value

  # @param [Users::Types::UserId] user_id
  def ==(user_id)
    @value == user_id.value
  end

  def to_s
    "UserId(value=#{@value})"
  end
end
