class CreateClientDomains < ActiveRecord::Migration[5.2]
  def change
    create_table :client_domains do |t|
      t.string :url
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
