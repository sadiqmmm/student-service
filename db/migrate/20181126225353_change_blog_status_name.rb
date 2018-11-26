class ChangeBlogStatusName < ActiveRecord::Migration[5.2]
  def change
    rename_column :portfolio_blogs, :status, :blog_status
  end
end
