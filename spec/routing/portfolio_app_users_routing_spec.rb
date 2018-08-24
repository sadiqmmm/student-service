require "rails_helper"

RSpec.describe PortfolioAppUsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/portfolio_app_users").to route_to("portfolio_app_users#index")
    end

    it "routes to #new" do
      expect(:get => "/portfolio_app_users/new").to route_to("portfolio_app_users#new")
    end

    it "routes to #show" do
      expect(:get => "/portfolio_app_users/1").to route_to("portfolio_app_users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/portfolio_app_users/1/edit").to route_to("portfolio_app_users#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/portfolio_app_users").to route_to("portfolio_app_users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/portfolio_app_users/1").to route_to("portfolio_app_users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/portfolio_app_users/1").to route_to("portfolio_app_users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/portfolio_app_users/1").to route_to("portfolio_app_users#destroy", :id => "1")
    end
  end
end
