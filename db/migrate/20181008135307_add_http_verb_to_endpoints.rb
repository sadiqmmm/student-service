class AddHttpVerbToEndpoints < ActiveRecord::Migration[5.2]
  def change
    add_column :endpoints, :http_verb, :string
  end
end
