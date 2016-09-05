require 'rails_helper'

RSpec.describe "chapters/edit", type: :view do
  before(:each) do
    @chapter = assign(:chapter, Chapter.create!(
      :title => "MyString",
      :start_page => 1,
      :section => nil
    ))
  end

  it "renders the edit chapter form" do
    render

    assert_select "form[action=?][method=?]", chapter_path(@chapter), "post" do

      assert_select "input#chapter_title[name=?]", "chapter[title]"

      assert_select "input#chapter_start_page[name=?]", "chapter[start_page]"

      assert_select "input#chapter_section_id[name=?]", "chapter[section_id]"
    end
  end
end
