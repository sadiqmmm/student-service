class Client < ApplicationRecord
  has_secure_password

  validates :subdomain, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  has_many :portfolio_app_users, dependent: :destroy
  has_many :portfolio_items, dependent: :destroy
end
