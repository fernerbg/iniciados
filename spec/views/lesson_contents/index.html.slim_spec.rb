require 'rails_helper'

RSpec.describe "lesson_contents/index", type: :view do
  before(:each) do
    assign(:lesson_contents, [
      LessonContent.create!(
        :lesson => nil,
        :content => nil
      ),
      LessonContent.create!(
        :lesson => nil,
        :content => nil
      )
    ])
  end

  it "renders a list of lesson_contents" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
