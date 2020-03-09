class AppMemipediaUserSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :password,
             :password_confirmation,
             :created_at,
             :column_names_merged_with_images
end
