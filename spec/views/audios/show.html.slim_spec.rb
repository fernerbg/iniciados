require 'rails_helper'

RSpec.describe "audios/show", type: :view do
  before(:each) do
    @audio = assign(:audio, Audio.create!(
      :name => "Name",
      :length => "",
      :wave => "Wave",
      :track => "Track",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Wave/)
    expect(rendered).to match(/Track/)
    expect(rendered).to match(/MyText/)
  end
end
