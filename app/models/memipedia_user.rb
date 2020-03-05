class MemipediaUser < ApplicationRecord
  belongs_to :client
  belongs_to :app_template
end
