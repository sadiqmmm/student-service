class PortfolioBlog < ApplicationRecord
  belongs_to :client

  validates_presence_of :title

  has_one_attached :featured_image

  enum status: {
    draft: 0,
    published: 1
  }

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
