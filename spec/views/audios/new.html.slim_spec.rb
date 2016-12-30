require 'rails_helper'

RSpec.describe "audios/new", type: :view do
  before(:each) do
    assign(:audio, Audio.new(
      :name => "MyString",
      :length => "",
      :wave => "MyString",
      :track => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new audio form" do
    render

    assert_select "form[action=?][method=?]", audios_path, "post" do

      assert_select "input#audio_name[name=?]", "audio[name]"

      assert_select "input#audio_length[name=?]", "audio[length]"

      assert_select "input#audio_wave[name=?]", "audio[wave]"

      assert_select "input#audio_track[name=?]", "audio[track]"

      assert_select "textarea#audio_description[name=?]", "audio[description]"
    end
  end
end
