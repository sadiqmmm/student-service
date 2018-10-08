class AddWhiteLogoToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :white_logo, :text
  end
end
