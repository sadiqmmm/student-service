class DevworkflowCheckListItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :completed
  has_one :devworkflow_project_line_item
  has_one :devworkflow_user
end
