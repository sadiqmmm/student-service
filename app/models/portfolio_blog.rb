class PortfolioBlog < ApplicationRecord
  belongs_to :client

  has_one_attached :featured_image

  def featured_image_url
    if self.featured_image.attachment
      self.featured_image.attachment.service_url
    end
  end

  def column_names_merged_with_images
    PortfolioBlog.column_names
      .select { |column| !['client_id', 'created_at', 'updated_at'].include?(column) }
      .push(['featured_image'])
      .flatten
      .uniq
  end
end
