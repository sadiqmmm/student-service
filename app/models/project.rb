class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :endpoints, dependent: :destroy
end
