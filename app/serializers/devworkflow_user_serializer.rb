class DevworkflowUserSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :email,
             :column_names_merged_with_images
end
