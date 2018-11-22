class CreatePortfolioBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolio_blogs do |t|
      t.string :title
      t.text :content
      t.integer :status, default: 0
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
