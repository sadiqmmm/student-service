module ClientFromSubdomainConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_client_from_subdomain
  end

  def set_client_from_subdomain
    @client = Client.find_by(subdomain: request.subdomain)
  end
end
