class CreateDevworkflowProjectLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :devworkflow_project_line_items do |t|
      t.references :devworkflow_project, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
