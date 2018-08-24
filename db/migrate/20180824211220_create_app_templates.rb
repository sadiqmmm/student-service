class CreateAppTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :app_templates do |t|
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
