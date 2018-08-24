require 'rails_helper'

RSpec.describe "portfolio_app_users/new", type: :view do
  before(:each) do
    assign(:portfolio_app_user, PortfolioAppUser.new(
      :email => "MyString",
      :password_digest => "MyString",
      :role => 1
    ))
  end

  it "renders new portfolio_app_user form" do
    render

    assert_select "form[action=?][method=?]", portfolio_app_users_path, "post" do

      assert_select "input[name=?]", "portfolio_app_user[email]"

      assert_select "input[name=?]", "portfolio_app_user[password_digest]"

      assert_select "input[name=?]", "portfolio_app_user[role]"
    end
  end
end
