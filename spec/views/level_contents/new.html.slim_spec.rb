require 'rails_helper'

RSpec.describe "level_contents/new", type: :view do
  before(:each) do
    assign(:level_content, LevelContent.new(
      :level => nil,
      :content => nil
    ))
  end

  it "renders new level_content form" do
    render

    assert_select "form[action=?][method=?]", level_contents_path, "post" do

      assert_select "input#level_content_level_id[name=?]", "level_content[level_id]"

      assert_select "input#level_content_content_id[name=?]", "level_content[content_id]"
    end
  end
end
