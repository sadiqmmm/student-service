module AuthenticationConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_client
  end

  def set_current_client
    if session[:client_id]
      @current_client = Client.find(session[:client_id])
    end
  end
end
