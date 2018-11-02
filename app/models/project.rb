class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :endpoints, dependent: :destroy
  has_many :project_tables, dependent: :destroy
end
