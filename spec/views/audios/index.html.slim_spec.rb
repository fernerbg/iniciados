require 'rails_helper'

RSpec.describe "audios/index", type: :view do
  before(:each) do
    assign(:audios, [
      Audio.create!(
        :name => "Name",
        :length => "",
        :wave => "Wave",
        :track => "Track",
        :description => "MyText"
      ),
      Audio.create!(
        :name => "Name",
        :length => "",
        :wave => "Wave",
        :track => "Track",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of audios" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Wave".to_s, :count => 2
    assert_select "tr>td", :text => "Track".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
