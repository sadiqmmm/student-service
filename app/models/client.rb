class Client < ApplicationRecord
  has_secure_password

  has_many :portfolio_app_users, dependent: :destroy
end
