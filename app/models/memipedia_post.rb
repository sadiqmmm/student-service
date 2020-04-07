class MemipediaPost < ApplicationRecord
  belongs_to :client
  belongs_to :memipedia_user

  has_one_attached :post_image

  def post_image_url
    if self.post_image.attachment
      self.post_image.attachment.service_url
    end
  end

  def column_names_merged_with_images
    MemipediaPost.column_names
      .select { |column| !['client_id'].include?(column) }
      .push(['id', 'name', 'content', 'post_image', 'created_at'])
      .flatten
      .uniq
  end
end
