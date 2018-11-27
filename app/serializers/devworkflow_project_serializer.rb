class DevworkflowProjectSerializer < ActiveModel::Serializer
  attributes :dw_project_id,
             :title,
             :main_objective,
             :dw_user_id,
             :column_names_merged_with_images
end
