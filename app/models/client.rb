class Client < ApplicationRecord
  has_secure_password

  validates :subdomain, format: { with: /\A[a-zA-Z0-9]+\Z/ }, presence: true
  validates :email, email: true, presence: true

  validates_presence_of :password_digest

  has_many :client_domains, dependent: :destroy

  has_many :portfolio_app_users, dependent: :destroy
  has_many :portfolio_items, dependent: :destroy
end
