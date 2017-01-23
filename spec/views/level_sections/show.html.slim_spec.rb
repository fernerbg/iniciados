require 'rails_helper'

RSpec.describe "level_sections/show", type: :view do
  before(:each) do
    @level_section = assign(:level_section, LevelSection.create!(
      :section => nil,
      :level => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
