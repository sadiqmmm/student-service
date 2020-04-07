class MemipediaPost < ApplicationRecord
  belongs_to :client
  belongs_to :memipedia_user

  has_one_attached :image

  def image_url
    if self.image.attachment
      self.image.attachment.service_url
    end
  end

  def column_names_merged_with_images
    MemipediaPost.column_names
      .select { |column| !['client_id'].include?(column) }
      .push(['id', 'name', 'content', 'image', 'created_at'])
      .flatten
      .uniq
  end
end
