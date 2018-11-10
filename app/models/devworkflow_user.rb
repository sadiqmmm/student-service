class DevworkflowUser < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :email, :name

  has_many :devworkflow_projects, dependent: :destroy
  has_many :devworkflow_check_list_items, dependent: :destroy
end
