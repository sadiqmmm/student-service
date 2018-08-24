require 'rails_helper'

RSpec.describe "portfolio_items/new", type: :view do
  before(:each) do
    assign(:portfolio_item, PortfolioItem.new(
      :client => nil,
      :name => "MyString",
      :description => "MyText",
      :url => "MyString"
    ))
  end

  it "renders new portfolio_item form" do
    render

    assert_select "form[action=?][method=?]", portfolio_items_path, "post" do

      assert_select "input[name=?]", "portfolio_item[client_id]"

      assert_select "input[name=?]", "portfolio_item[name]"

      assert_select "textarea[name=?]", "portfolio_item[description]"

      assert_select "input[name=?]", "portfolio_item[url]"
    end
  end
end
