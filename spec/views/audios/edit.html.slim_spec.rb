require 'rails_helper'

RSpec.describe "audios/edit", type: :view do
  before(:each) do
    @audio = assign(:audio, Audio.create!(
      :name => "MyString",
      :length => "",
      :wave => "MyString",
      :track => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit audio form" do
    render

    assert_select "form[action=?][method=?]", audio_path(@audio), "post" do

      assert_select "input#audio_name[name=?]", "audio[name]"

      assert_select "input#audio_length[name=?]", "audio[length]"

      assert_select "input#audio_wave[name=?]", "audio[wave]"

      assert_select "input#audio_track[name=?]", "audio[track]"

      assert_select "textarea#audio_description[name=?]", "audio[description]"
    end
  end
end
