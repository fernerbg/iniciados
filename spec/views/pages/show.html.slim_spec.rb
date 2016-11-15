require 'rails_helper'

RSpec.describe "pages/show", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :page_url => "Page Url",
      :number => 1,
      :level => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Page Url/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
