class DevworkflowCheckListItem < ApplicationRecord
  belongs_to :devworkflow_project_line_item
  belongs_to :devworkflow_user
end
