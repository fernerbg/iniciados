require 'rails_helper'

RSpec.describe "lesson_levels/show", type: :view do
  before(:each) do
    @lesson_level = assign(:lesson_level, LessonLevel.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
