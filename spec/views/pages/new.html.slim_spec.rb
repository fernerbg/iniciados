require 'rails_helper'

RSpec.describe "pages/new", type: :view do
  before(:each) do
    assign(:page, Page.new(
      :page_url => "MyString",
      :number => 1,
      :level => nil
    ))
  end

  it "renders new page form" do
    render

    assert_select "form[action=?][method=?]", pages_path, "post" do

      assert_select "input#page_page_url[name=?]", "page[page_url]"

      assert_select "input#page_number[name=?]", "page[number]"

      assert_select "input#page_level_id[name=?]", "page[level_id]"
    end
  end
end
