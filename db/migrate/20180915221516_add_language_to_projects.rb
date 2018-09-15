class AddLanguageToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :language, :string
  end
end
