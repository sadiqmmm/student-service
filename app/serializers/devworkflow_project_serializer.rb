class DevworkflowProjectSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :main_objective,
             :status,
             :updated_at,
             :column_names_merged_with_images

  belongs_to :devworkflow_user
  has_many :devworkflow_project_line_items
end
