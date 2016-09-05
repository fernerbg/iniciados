require 'rails_helper'

RSpec.describe "sections/show", type: :view do
  before(:each) do
    @section = assign(:section, Section.create!(
      :title => "Title",
      :start_page => 1,
      :level => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
