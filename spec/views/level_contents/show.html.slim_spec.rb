require 'rails_helper'

RSpec.describe "level_contents/show", type: :view do
  before(:each) do
    @level_content = assign(:level_content, LevelContent.create!(
      :level => nil,
      :content => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
