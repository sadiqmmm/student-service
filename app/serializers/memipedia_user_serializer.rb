class MemipediaUserSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :created_at,
             :column_names_merged_with_images
end
