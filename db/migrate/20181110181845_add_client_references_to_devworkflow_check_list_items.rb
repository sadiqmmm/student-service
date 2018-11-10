class AddClientReferencesToDevworkflowCheckListItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :devworkflow_check_list_items, :client, foreign_key: true, index: { name: 'dw_cli_client' }
    add_reference :devworkflow_projects, :client, foreign_key: true, index: { name: 'dw_project_client' }
    add_reference :devworkflow_project_line_items, :client, foreign_key: true, index: { name: 'dw_pli_client' }
    add_reference :devworkflow_users, :client, foreign_key: true, index: { name: 'dw_user_client' }
  end
end
