require 'rails_helper'

RSpec.describe "portfolio_items/edit", type: :view do
  before(:each) do
    @portfolio_item = assign(:portfolio_item, PortfolioItem.create!(
      :client => nil,
      :name => "MyString",
      :description => "MyText",
      :url => "MyString"
    ))
  end

  it "renders the edit portfolio_item form" do
    render

    assert_select "form[action=?][method=?]", portfolio_item_path(@portfolio_item), "post" do

      assert_select "input[name=?]", "portfolio_item[client_id]"

      assert_select "input[name=?]", "portfolio_item[name]"

      assert_select "textarea[name=?]", "portfolio_item[description]"

      assert_select "input[name=?]", "portfolio_item[url]"
    end
  end
end
