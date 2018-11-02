class CreateProjectTables < ActiveRecord::Migration[5.2]
  def change
    create_table :project_tables do |t|
      t.references :project, foreign_key: true
      t.string :formatted_name
      t.string :table_name

      t.timestamps
    end
  end
end
