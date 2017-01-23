require 'rails_helper'

RSpec.describe "level_sections/new", type: :view do
  before(:each) do
    assign(:level_section, LevelSection.new(
      :section => nil,
      :level => nil
    ))
  end

  it "renders new level_section form" do
    render

    assert_select "form[action=?][method=?]", level_sections_path, "post" do

      assert_select "input#level_section_section_id[name=?]", "level_section[section_id]"

      assert_select "input#level_section_level_id[name=?]", "level_section[level_id]"
    end
  end
end
