class CreateMemipediaPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :memipedia_posts do |t|
      t.references :client, foreign_key: true
      t.references :memipedia_user, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
