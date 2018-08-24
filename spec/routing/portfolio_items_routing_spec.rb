require "rails_helper"

RSpec.describe PortfolioItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/portfolio_items").to route_to("portfolio_items#index")
    end

    it "routes to #new" do
      expect(:get => "/portfolio_items/new").to route_to("portfolio_items#new")
    end

    it "routes to #show" do
      expect(:get => "/portfolio_items/1").to route_to("portfolio_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/portfolio_items/1/edit").to route_to("portfolio_items#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/portfolio_items").to route_to("portfolio_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/portfolio_items/1").to route_to("portfolio_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/portfolio_items/1").to route_to("portfolio_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/portfolio_items/1").to route_to("portfolio_items#destroy", :id => "1")
    end
  end
end
