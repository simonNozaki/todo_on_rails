class HealthchecksController < ApplicationController
  def index
    render status: :ok
  end
end
