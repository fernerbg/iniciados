require 'rails_helper'

RSpec.describe "emanations/show", type: :view do
  before(:each) do
    @emanation = assign(:emanation, Emanation.create!(
      :image_url => "Image Url",
      :message => "MyText",
      :title => "Title",
      :level => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
  end
end
