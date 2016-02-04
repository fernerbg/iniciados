require 'rails_helper'

RSpec.describe "lesson_contents/new", type: :view do
  before(:each) do
    assign(:lesson_content, LessonContent.new(
      :lesson => nil,
      :content => nil
    ))
  end

  it "renders new lesson_content form" do
    render

    assert_select "form[action=?][method=?]", lesson_contents_path, "post" do

      assert_select "input#lesson_content_lesson_id[name=?]", "lesson_content[lesson_id]"

      assert_select "input#lesson_content_content_id[name=?]", "lesson_content[content_id]"
    end
  end
end
