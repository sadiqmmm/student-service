module AuthenticationConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_client
  end

  def set_current_client
    if session[:client_id]
      @current_user = User.find(session[:user_id])
    end
  end
end
