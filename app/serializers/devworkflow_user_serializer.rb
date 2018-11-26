class DevworkflowUserSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :email,
             :filtered_field,
             :filtered_field_2,
             :column_names_merged_with_images
end
