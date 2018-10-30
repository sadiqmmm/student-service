class ClientDomainsController < ApplicationController
  include AuthenticationConcern

  def index
    @client_domains = @current_client.client_domains
    render json: @client_domains
  end
end
