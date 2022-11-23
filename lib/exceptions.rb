module Exceptions
  # General runtime exception for some resource(s) not found
  class ResourceNotFoundError < StandardError
    def initialize(msg = "", resource = "", id = "")
      super(msg)
      @resource = resource
      @id = id
    end
    attr_reader :resource, :id
  end

  class ResourceUndefinedError < StandardError
    def initialize(msg = "", key = "", value = "")
      super(msg)
      @key = key
      @value = value
    end
    attr_reader :key, :value
  end

  class ObjectValidationError < StandardError
    def initialize(msg = "")
      super(msg)
    end
  end

  # General runtime error
  class TodoRuntimeError < StandardError
    def initialize(msg = "")
      super(msg)
      @message = msg
    end
    attr_reader :message
  end
end