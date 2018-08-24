class AddAppTemplateReferencesToPortfolioAppUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :portfolio_app_users, :app_template, foreign_key: true
    add_reference :portfolio_app_users, :client, foreign_key: true
  end
end
