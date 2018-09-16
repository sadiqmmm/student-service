class AddLogoToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :logo, :string
  end
end
