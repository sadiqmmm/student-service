require 'rails_helper'

RSpec.describe "PortfolioItems", type: :request do
  describe "GET /portfolio_items" do
    it "works! (now write some real specs)" do
      get portfolio_items_path
      expect(response).to have_http_status(200)
    end
  end
end
