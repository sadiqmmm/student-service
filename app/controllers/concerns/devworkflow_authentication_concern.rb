module DevworkflowAuthenticationConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_devworkflow_current_user
  end

  def set_current_user
    if session[:devworkflow_user_id]
      @devworkflow_current_user = DevworkflowUser.find(session[:devworkflow_user_id])
    end
  end
end
