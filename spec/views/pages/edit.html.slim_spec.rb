require 'rails_helper'

RSpec.describe "pages/edit", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :page_url => "MyString",
      :number => 1,
      :level => nil
    ))
  end

  it "renders the edit page form" do
    render

    assert_select "form[action=?][method=?]", page_path(@page), "post" do

      assert_select "input#page_page_url[name=?]", "page[page_url]"

      assert_select "input#page_number[name=?]", "page[number]"

      assert_select "input#page_level_id[name=?]", "page[level_id]"
    end
  end
end
