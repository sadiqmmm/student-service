class AddCategoryToPortfolioItems < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolio_items, :category, :string
  end
end
