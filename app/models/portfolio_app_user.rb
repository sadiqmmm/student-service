class PortfolioAppUser < ApplicationRecord
  has_secure_password

  belongs_to :client
  belongs_to :app_template
end
