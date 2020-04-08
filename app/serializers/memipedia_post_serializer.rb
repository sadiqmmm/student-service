class MemipediaPostSerializer < ActiveModel::Serializer
  attributes :id,
             :post_image_url,
             :name,
             :content,
             :created_at,
             :column_names_merged_with_images
end
