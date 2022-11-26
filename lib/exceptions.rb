module Exceptions
  class TodoAppBaseRuntimeError < StandardError; end

  # General runtime exception for some resource(s) not found
  class ResourceNotFoundError < TodoAppBaseRuntimeError
    def initialize(msg = "", resource = "", id = "")
      super(msg)
      @resource = resource
      @id = id
    end
    attr_reader :resource, :id
  end

  class ResourceUndefinedError < TodoAppBaseRuntimeError
    def initialize(msg = "", key = "", value = "")
      super(msg)
      @key = key
      @value = value
    end
    attr_reader :key, :value
  end

  class ObjectValidationError < TodoAppBaseRuntimeError
    def initialize(msg = "")
      super(msg)
    end
  end

  # General runtime error
  class TodoAppRuntimeError < TodoAppBaseRuntimeError
    def initialize(msg = "")
      super(msg)
      @message = msg
    end
    attr_reader :message
  end
end