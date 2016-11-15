require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  before(:each) do
    assign(:pages, [
      Page.create!(
        :page_url => "Page Url",
        :number => 1,
        :level => nil
      ),
      Page.create!(
        :page_url => "Page Url",
        :number => 1,
        :level => nil
      )
    ])
  end

  it "renders a list of pages" do
    render
    assert_select "tr>td", :text => "Page Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
