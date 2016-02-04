require 'rails_helper'

RSpec.describe "contents/edit", type: :view do
  before(:each) do
    @content = assign(:content, Content.create!(
      :title => "MyString",
      :description => "MyText",
      :type => "",
      :thumbnail => "MyText",
      :url => "MyText"
    ))
  end

  it "renders the edit content form" do
    render

    assert_select "form[action=?][method=?]", content_path(@content), "post" do

      assert_select "input#content_title[name=?]", "content[title]"

      assert_select "textarea#content_description[name=?]", "content[description]"

      assert_select "input#content_type[name=?]", "content[type]"

      assert_select "textarea#content_thumbnail[name=?]", "content[thumbnail]"

      assert_select "textarea#content_url[name=?]", "content[url]"
    end
  end
end
