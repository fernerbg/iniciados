require 'rails_helper'

RSpec.describe "lesson_levels/new", type: :view do
  before(:each) do
    assign(:lesson_level, LessonLevel.new(
      :name => "MyString"
    ))
  end

  it "renders new lesson_level form" do
    render

    assert_select "form[action=?][method=?]", lesson_levels_path, "post" do

      assert_select "input#lesson_level_name[name=?]", "lesson_level[name]"
    end
  end
end
