require 'rails_helper'

RSpec.describe "lesson_levels/index", type: :view do
  before(:each) do
    assign(:lesson_levels, [
      LessonLevel.create!(
        :name => "Name"
      ),
      LessonLevel.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of lesson_levels" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
