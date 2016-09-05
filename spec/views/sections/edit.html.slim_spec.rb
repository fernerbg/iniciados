require 'rails_helper'

RSpec.describe "sections/edit", type: :view do
  before(:each) do
    @section = assign(:section, Section.create!(
      :title => "MyString",
      :start_page => 1,
      :level => nil
    ))
  end

  it "renders the edit section form" do
    render

    assert_select "form[action=?][method=?]", section_path(@section), "post" do

      assert_select "input#section_title[name=?]", "section[title]"

      assert_select "input#section_start_page[name=?]", "section[start_page]"

      assert_select "input#section_level_id[name=?]", "section[level_id]"
    end
  end
end
