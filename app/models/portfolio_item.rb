class PortfolioItem < ApplicationRecord
  belongs_to :client
  has_one_attached :thumb_image
  has_one_attached :banner_image
  has_one_attached :logo

  def thumb_image_url
    if self.thumb_image.attachment
      self.thumb_image.attachment.service_url
    end
  end

  def banner_image_url
    if self.banner_image.attachment
      self.banner_image.attachment.service_url
    end
  end

  def logo_url
    if self.logo.attachment
      self.logo.attachment.service_url
    end
  end
end
