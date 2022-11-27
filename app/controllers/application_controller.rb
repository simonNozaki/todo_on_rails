class ApplicationController < ActionController::API
  include(Exceptions)

  rescue_from StandardError do |e|
    to_internal_server_error(e.message)
  end
  rescue_from ActiveRecord::RecordNotFound do |e|
    model_names = {
      "User": "User",
      "TodoItem": "Todo",
      "SubTodoItem": "SubTodo"
    }
    message = get_message_on_not_found(model_names[e.model], e.id)
    to_bad_request(message)
  end
  rescue_from ActionController::RoutingError do |e|
    to_not_found("Route #{e.message} not found on this server")
  end
  rescue_from TodoAppRuntimeError do |e|
    to_bad_request(e.message)
  end
  rescue_from ObjectLogicError do |e|
    to_bad_request(e.message)
  end
  rescue_from ObjectValidationError do |e|
    to_bad_request(e.message)
  end
  rescue_from ResourceNotFoundError do |e|
    message = get_message_on_not_found(e.resource, e.id)
    to_bad_request(message)
  end
  rescue_from ResourceUndefinedError do |e|
    message = "#{e.value} not defined at key #{e.key}"
    to_bad_request(message)
  end

  def handle_routing_error
    raise(ActionController::RoutingError, params[:not_found])
  end

  private
    # @param [String] resource_name
    # @param [String] id
    def get_message_on_not_found(resource_name, id)
      "Resource #{resource_name} with id #{id} not found."
    end

    # @param [String] message
    def to_bad_request(message)
      to_response(400, message)
    end

    # @param [String] message
    def to_not_found(message)
      to_response(404, message)
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
