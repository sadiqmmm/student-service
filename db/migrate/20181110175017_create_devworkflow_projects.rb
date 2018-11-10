class CreateDevworkflowProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :devworkflow_projects do |t|
      t.string :title
      t.string :main_objective
      t.references :devworkflow_user, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
