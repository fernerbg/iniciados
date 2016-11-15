require 'rails_helper'

RSpec.describe "emanations/edit", type: :view do
  before(:each) do
    @emanation = assign(:emanation, Emanation.create!(
      :image_url => "MyString",
      :message => "MyText",
      :title => "MyString",
      :level => nil
    ))
  end

  it "renders the edit emanation form" do
    render

    assert_select "form[action=?][method=?]", emanation_path(@emanation), "post" do

      assert_select "input#emanation_image_url[name=?]", "emanation[image_url]"

      assert_select "textarea#emanation_message[name=?]", "emanation[message]"

      assert_select "input#emanation_title[name=?]", "emanation[title]"

      assert_select "input#emanation_level_id[name=?]", "emanation[level_id]"
    end
  end
end
