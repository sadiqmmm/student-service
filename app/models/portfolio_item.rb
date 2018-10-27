class PortfolioItem < ApplicationRecord
  belongs_to :client
  has_one_attached :thumb_image
  has_one_attached :banner_image
end
