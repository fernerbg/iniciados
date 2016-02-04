require 'rails_helper'

RSpec.describe "lesson_contents/edit", type: :view do
  before(:each) do
    @lesson_content = assign(:lesson_content, LessonContent.create!(
      :lesson => nil,
      :content => nil
    ))
  end

  it "renders the edit lesson_content form" do
    render

    assert_select "form[action=?][method=?]", lesson_content_path(@lesson_content), "post" do

      assert_select "input#lesson_content_lesson_id[name=?]", "lesson_content[lesson_id]"

      assert_select "input#lesson_content_content_id[name=?]", "lesson_content[content_id]"
    end
  end
end
