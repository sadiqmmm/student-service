class AddClientDomainToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :client_domain, :string
  end
end
