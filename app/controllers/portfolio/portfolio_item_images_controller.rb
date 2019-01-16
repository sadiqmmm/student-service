class Portfolio::PortfolioItemImagesController < ApplicationController
  before_action :set_portfolio_item, only: [:destroy]
  include AuthenticationConcern

  def destroy
    if @portfolio_item.client == @current_client
      puts "DESTROY" * 500, @portfolio_item.inspect, "destroy" * 500
    else
      render json: { status: :unauthorized }
    end
  end

  private
    def set_portfolio_item
      @portfolio_item = PortfolioItem.find(params[:id])
    end
end
