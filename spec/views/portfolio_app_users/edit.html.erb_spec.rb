require 'rails_helper'

RSpec.describe "portfolio_app_users/edit", type: :view do
  before(:each) do
    @portfolio_app_user = assign(:portfolio_app_user, PortfolioAppUser.create!(
      :email => "MyString",
      :password_digest => "MyString",
      :role => 1
    ))
  end

  it "renders the edit portfolio_app_user form" do
    render

    assert_select "form[action=?][method=?]", portfolio_app_user_path(@portfolio_app_user), "post" do

      assert_select "input[name=?]", "portfolio_app_user[email]"

      assert_select "input[name=?]", "portfolio_app_user[password_digest]"

      assert_select "input[name=?]", "portfolio_app_user[role]"
    end
  end
end
