class CreateEndpoints < ActiveRecord::Migration[5.2]
  def change
    create_table :endpoints do |t|
      t.references :project, foreign_key: true
      t.string :title
      t.string :link

      t.timestamps
    end
  end
end
