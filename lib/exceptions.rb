module Exceptions
  # General runtime exception for some resource(s) not found
  class ResourceNotFoundError < StandardError; end
  class ResourceUndefinedError < StandardError; end
  class ObjectValidationError < StandardError; end
end