class MemipediaPost < ApplicationRecord
  belongs_to :client
  belongs_to :memipedia_user
end
