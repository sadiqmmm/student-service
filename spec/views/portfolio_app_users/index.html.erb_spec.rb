require 'rails_helper'

RSpec.describe "portfolio_app_users/index", type: :view do
  before(:each) do
    assign(:portfolio_app_users, [
      PortfolioAppUser.create!(
        :email => "Email",
        :password_digest => "Password Digest",
        :role => 2
      ),
      PortfolioAppUser.create!(
        :email => "Email",
        :password_digest => "Password Digest",
        :role => 2
      )
    ])
  end

  it "renders a list of portfolio_app_users" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
