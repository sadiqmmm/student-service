class MemipediaPostSerializer < ActiveModel::Serializer
  attributes :id,
             :image_url,
             :name,
             :content,
             :created_at,
             :column_names_merged_with_images
end
