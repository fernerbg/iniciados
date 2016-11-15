require 'rails_helper'

RSpec.describe "emanations/index", type: :view do
  before(:each) do
    assign(:emanations, [
      Emanation.create!(
        :image_url => "Image Url",
        :message => "MyText",
        :title => "Title",
        :level => nil
      ),
      Emanation.create!(
        :image_url => "Image Url",
        :message => "MyText",
        :title => "Title",
        :level => nil
      )
    ])
  end

  it "renders a list of emanations" do
    render
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
