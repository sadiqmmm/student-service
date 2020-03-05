class MemipediaUser < ApplicationRecord
  has_secure_password

  # TODO
  # scope validation through client
  validates_presence_of :email

  belongs_to :client
  belongs_to :app_template
end
