require 'rails_helper'

RSpec.describe "level_contents/edit", type: :view do
  before(:each) do
    @level_content = assign(:level_content, LevelContent.create!(
      :level => nil,
      :content => nil
    ))
  end

  it "renders the edit level_content form" do
    render

    assert_select "form[action=?][method=?]", level_content_path(@level_content), "post" do

      assert_select "input#level_content_level_id[name=?]", "level_content[level_id]"

      assert_select "input#level_content_content_id[name=?]", "level_content[content_id]"
    end
  end
end
