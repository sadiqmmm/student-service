require 'rails_helper'

RSpec.describe "portfolio_items/index", type: :view do
  before(:each) do
    assign(:portfolio_items, [
      PortfolioItem.create!(
        :client => nil,
        :name => "Name",
        :description => "MyText",
        :url => "Url"
      ),
      PortfolioItem.create!(
        :client => nil,
        :name => "Name",
        :description => "MyText",
        :url => "Url"
      )
    ])
  end

  it "renders a list of portfolio_items" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
