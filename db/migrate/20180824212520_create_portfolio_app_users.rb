class CreatePortfolioAppUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolio_app_users do |t|
      t.string :email
      t.string :password_digest
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
