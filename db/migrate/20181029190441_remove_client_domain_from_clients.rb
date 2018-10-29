class RemoveClientDomainFromClients < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :client_domain, :string
  end
end
