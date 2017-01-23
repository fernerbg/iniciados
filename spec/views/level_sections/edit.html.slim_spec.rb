require 'rails_helper'

RSpec.describe "level_sections/edit", type: :view do
  before(:each) do
    @level_section = assign(:level_section, LevelSection.create!(
      :section => nil,
      :level => nil
    ))
  end

  it "renders the edit level_section form" do
    render

    assert_select "form[action=?][method=?]", level_section_path(@level_section), "post" do

      assert_select "input#level_section_section_id[name=?]", "level_section[section_id]"

      assert_select "input#level_section_level_id[name=?]", "level_section[level_id]"
    end
  end
end
