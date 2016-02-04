require 'rails_helper'

RSpec.describe "lesson_levels/edit", type: :view do
  before(:each) do
    @lesson_level = assign(:lesson_level, LessonLevel.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit lesson_level form" do
    render

    assert_select "form[action=?][method=?]", lesson_level_path(@lesson_level), "post" do

      assert_select "input#lesson_level_name[name=?]", "lesson_level[name]"
    end
  end
end
