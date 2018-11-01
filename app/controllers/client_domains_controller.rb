class ClientDomainsController < ApplicationController
  include AuthenticationConcern

  def index
    @client_domains = @current_client.client_domains
    render json: @client_domains
  end

  def create
    @client_domain = @current_client.client_domains.new(client_domain_params)

    if @client_domain.save
      render json: @client_domain, status: :created
    else
      render json: @client_domain.errors, status: :unprocessable_entity
    end
  end

  private

    def client_domain_params
      params.require(:client_domain).permit(
        :url,
      )
    end
end
