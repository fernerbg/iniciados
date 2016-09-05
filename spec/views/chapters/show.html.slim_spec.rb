require 'rails_helper'

RSpec.describe "chapters/show", type: :view do
  before(:each) do
    @chapter = assign(:chapter, Chapter.create!(
      :title => "Title",
      :start_page => 1,
      :section => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
