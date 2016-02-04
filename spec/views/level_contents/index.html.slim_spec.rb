require 'rails_helper'

RSpec.describe "level_contents/index", type: :view do
  before(:each) do
    assign(:level_contents, [
      LevelContent.create!(
        :level => nil,
        :content => nil
      ),
      LevelContent.create!(
        :level => nil,
        :content => nil
      )
    ])
  end

  it "renders a list of level_contents" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
