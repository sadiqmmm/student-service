class AddRouteNamespaceToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :route_namespace, :string
  end
end
