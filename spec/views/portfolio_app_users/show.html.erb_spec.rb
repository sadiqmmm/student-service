require 'rails_helper'

RSpec.describe "portfolio_app_users/show", type: :view do
  before(:each) do
    @portfolio_app_user = assign(:portfolio_app_user, PortfolioAppUser.create!(
      :email => "Email",
      :password_digest => "Password Digest",
      :role => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/2/)
  end
end
