class MemipediaUser < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email, scope: :client_id

  belongs_to :client
  belongs_to :app_template, optional: true
end
