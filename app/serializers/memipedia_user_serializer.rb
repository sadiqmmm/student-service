class MemipediaUserSerializer < ActiveModel::Serializer
  attributes :created_at,
             :email,
             :id,
             :column_names_merged_with_images
end
