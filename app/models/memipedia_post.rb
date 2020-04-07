class MemipediaPost < ApplicationRecord
  belongs_to :client
  belongs_to :memipedia_user

  has_one_attached :image

  def image_url
    if self.image.attachment
      self.image.attachment.service_url
    end
  end
end
