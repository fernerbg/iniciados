require 'rails_helper'

RSpec.describe "contents/index", type: :view do
  before(:each) do
    assign(:contents, [
      Content.create!(
        :title => "Title",
        :description => "MyText",
        :type => "Type",
        :thumbnail => "MyText",
        :url => "MyText"
      ),
      Content.create!(
        :title => "Title",
        :description => "MyText",
        :type => "Type",
        :thumbnail => "MyText",
        :url => "MyText"
      )
    ])
  end

  it "renders a list of contents" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
