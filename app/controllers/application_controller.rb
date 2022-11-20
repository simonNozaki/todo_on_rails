class ApplicationController < ActionController::API
  include Exceptions

  rescue_from StandardError, with: :to_internal_server_error
  rescue_from ObjectValidationError, with: :to_bad_request
  rescue_from ResourceNotFoundError, with: :to_bad_request
  rescue_from ResourceUndefinedError, with: :to_bad_request

  private
    def to_bad_request
      to_response(400)
    end

    def to_internal_server_error
      to_response(500)
    end

    # @param [Integer] status
    def to_response(status)
      render json: "", status: status
    end
end
