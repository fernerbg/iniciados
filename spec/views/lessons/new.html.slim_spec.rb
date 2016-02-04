require 'rails_helper'

RSpec.describe "lessons/new", type: :view do
  before(:each) do
    assign(:lesson, Lesson.new(
      :name => "MyString",
      :description => "MyText",
      :number_level => 1,
      :number => 1,
      :lesson_level => nil
    ))
  end

  it "renders new lesson form" do
    render

    assert_select "form[action=?][method=?]", lessons_path, "post" do

      assert_select "input#lesson_name[name=?]", "lesson[name]"

      assert_select "textarea#lesson_description[name=?]", "lesson[description]"

      assert_select "input#lesson_number_level[name=?]", "lesson[number_level]"

      assert_select "input#lesson_number[name=?]", "lesson[number]"

      assert_select "input#lesson_lesson_level_id[name=?]", "lesson[lesson_level_id]"
    end
  end
end
