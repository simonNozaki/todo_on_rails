module Users

  # User entity: domain model of user(not like ActiveRecord model)
  class User
    # @param [String] id
    # @param [String] name
    # @param [Array] todos
    # @return [Domain::Users::User]
    def initialize(id, name, todos)
      @id = id
      @name = name
      @todos = todos
    end

    # Easy factory method of entity
    # @param [String] name
    # @param [Array] todos
    # @return [Domain::Users::User] user entity
    def self.of(name, todos)
      self.new(SecureRandom.uuid.to_s, name, todos)
    end

    def to_s
      "User(id=#{@id}, name=#{@name})"
    end
  end

end
