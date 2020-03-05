class CreateMemipediaUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :memipedia_users do |t|
      t.string :email
      t.string :password_digest
      t.references :client, foreign_key: true
      t.references :app_template, foreign_key: true

      t.timestamps
    end
  end
end
