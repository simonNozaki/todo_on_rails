class ApplicationController < ActionController::API
  include Exceptions

  rescue_from StandardError do |e|
    to_internal_server_error(e.message)
  end
  rescue_from ObjectValidationError do |e|
    to_bad_request(e.message)
  end
  rescue_from ResourceNotFoundError do |e|
    to_bad_request(e.message)
  end
  rescue_from ResourceUndefinedError do |e|
    to_bad_request(e.message)
  end

  private
    # @param [String] message
    def to_bad_request(message)
      to_response(400, message)
    end

    # @param [String] message
    def to_internal_server_error(message)
      to_response(500, message)
    end

    # @param [String] message
    # @param [Integer] status
    def to_response(status, message)
      response = {
        error: message
      }
      render json: response, status: status
    end
end
