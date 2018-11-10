class DevworkflowProjectLineItemSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :description,
             :completed,
             :devworkflow_project_id

  has_one :devworkflow_project
  has_many :devworkflow_check_list_items
end
