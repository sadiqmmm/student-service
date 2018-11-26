class DevworkflowUserSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :email,
             :password,
             :password,
             :column_names_merged_with_images
end
