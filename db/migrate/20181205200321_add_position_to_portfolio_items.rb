class AddPositionToPortfolioItems < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolio_items, :position, :integer
  end
end
