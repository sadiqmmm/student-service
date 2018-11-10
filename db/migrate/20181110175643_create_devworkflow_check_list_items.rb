class CreateDevworkflowCheckListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :devworkflow_check_list_items do |t|
      t.references :devworkflow_project_line_item, foreign_key: true, index: { name: 'dw_pli_cli' }
      t.string :title
      t.boolean :completed, default: false
      t.references :devworkflow_user, foreign_key: true, index: { name: 'dw_u_cli' }

      t.timestamps
    end
  end
end
