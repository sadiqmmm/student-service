class AppTemplate < ApplicationRecord
  enum status: {
    draft:     0,
    published: 1
  }

  has_many :portfolio_app_users, dependent: :destroy
end
