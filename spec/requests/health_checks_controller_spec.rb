require 'rails_helper'

RSpec.describe HealthchecksController, type: :controller do
  describe "GET /healthchecks" do
    it "should get OK" do
      get(:index)

      expect(response).to have_http_status(:ok)
    end
  end
end
