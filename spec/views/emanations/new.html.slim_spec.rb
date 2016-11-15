require 'rails_helper'

RSpec.describe "emanations/new", type: :view do
  before(:each) do
    assign(:emanation, Emanation.new(
      :image_url => "MyString",
      :message => "MyText",
      :title => "MyString",
      :level => nil
    ))
  end

  it "renders new emanation form" do
    render

    assert_select "form[action=?][method=?]", emanations_path, "post" do

      assert_select "input#emanation_image_url[name=?]", "emanation[image_url]"

      assert_select "textarea#emanation_message[name=?]", "emanation[message]"

      assert_select "input#emanation_title[name=?]", "emanation[title]"

      assert_select "input#emanation_level_id[name=?]", "emanation[level_id]"
    end
  end
end
