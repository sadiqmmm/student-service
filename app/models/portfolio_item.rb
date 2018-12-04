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

  def column_names_merged_with_images
    PortfolioItem.column_names
      .select { |column| !['client_id', 'created_at', 'updated_at'].include?(column) }
      .push(['category', 'thumb_image', 'banner_image', 'logo'])
      .flatten
      .uniq
  end
end
