class PortfolioBlogSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :content,
             :status,
             :featured_image_url,
             :column_names_merged_with_images
end
