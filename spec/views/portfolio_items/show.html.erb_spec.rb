require 'rails_helper'

RSpec.describe "portfolio_items/show", type: :view do
  before(:each) do
    @portfolio_item = assign(:portfolio_item, PortfolioItem.create!(
      :client => nil,
      :name => "Name",
      :description => "MyText",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Url/)
  end
end
