class Portfolio::PortfolioItemImagesController < ApplicationController
  before_action :set_portfolio_item, only: [:destroy]
  include AuthenticationConcern

  def destroy
    list_of_images = ["thumb_image", "banner_image", "logo"]

    if @portfolio_item.client == @current_client
      if params["image_type"] && list_of_images.include?(params["image_type"])
        puts "PORTFOLIO_ITEM" * 500, @portfolio_item.thumb_image.service_url, "portfolio_item" * 500
        @portfolio_item.send(params["image_type"]).purge
        puts "PORTFOLIO_ITEM" * 500, @portfolio_item.thumb_image.service_url, "portfolio_item" * 500
        puts "params" * 500, params.inspect, "PARAMS" * 500
        render json: { status: 204 }
      else
        render json: { status: :unprocessable_entity }
      end
    else
      render json: { status: :unauthorized }
    end
  end

  private
    def set_portfolio_item
      @portfolio_item = PortfolioItem.find(params[:id])
    end
end
