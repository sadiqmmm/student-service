class DevworkflowProjectSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :main_objective,
             :status,
             :updated_at

  belongs_to :devworkflow_user

  has_many :devworkflow_project_line_items
end
