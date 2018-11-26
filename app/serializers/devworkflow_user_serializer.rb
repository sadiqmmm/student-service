class DevworkflowUserSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :email,
             :filtered_field,
             :filtered_field,
             :column_names_merged_with_images
end
