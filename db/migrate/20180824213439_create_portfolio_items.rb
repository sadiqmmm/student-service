class CreatePortfolioItems < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolio_items do |t|
      t.references :client, foreign_key: true
      t.string :name
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
