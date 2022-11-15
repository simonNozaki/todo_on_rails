class HealthchecksController < ApplicationController
  def index
    response = {
      message: "OK"
    }
    render json: response
  end
end
