class DevworkflowProjectSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :main_objective,
             :column_names_merged_with_images
end
