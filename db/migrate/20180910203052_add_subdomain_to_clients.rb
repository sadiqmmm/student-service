class AddSubdomainToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :subdomain, :string
  end
end
