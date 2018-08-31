class AddAuthTokenToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :auth_token, :text
  end
end
