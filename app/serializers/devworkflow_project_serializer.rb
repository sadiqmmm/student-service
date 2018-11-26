class DevworkflowProjectSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :main_objective,
             :devworkflow_user_id,
             :column_names_merged_with_images
end
