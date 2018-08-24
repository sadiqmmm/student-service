require 'rails_helper'

RSpec.describe "PortfolioAppUsers", type: :request do
  describe "GET /portfolio_app_users" do
    it "works! (now write some real specs)" do
      get portfolio_app_users_path
      expect(response).to have_http_status(200)
    end
  end
end
