require 'rails_helper'

RSpec.describe "lesson_contents/show", type: :view do
  before(:each) do
    @lesson_content = assign(:lesson_content, LessonContent.create!(
      :lesson => nil,
      :content => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
