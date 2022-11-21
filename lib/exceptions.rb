module Exceptions
  # General runtime exception for some resource(s) not found
  class ResourceNotFoundError < StandardError
    def initialize(msg = "")
      super(msg)
    end
  end
  class ResourceUndefinedError < StandardError
    def initialize(msg = "")
      super(msg)
    end
  end
  class ObjectValidationError < StandardError
    def initialize(msg = "")
      super(msg)
    end
  end
end