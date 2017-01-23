require 'rails_helper'

RSpec.describe "level_sections/index", type: :view do
  before(:each) do
    assign(:level_sections, [
      LevelSection.create!(
        :section => nil,
        :level => nil
      ),
      LevelSection.create!(
        :section => nil,
        :level => nil
      )
    ])
  end

  it "renders a list of level_sections" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
