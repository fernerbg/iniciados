require 'rails_helper'

RSpec.describe "chapters/index", type: :view do
  before(:each) do
    assign(:chapters, [
      Chapter.create!(
        :title => "Title",
        :start_page => 1,
        :section => nil
      ),
      Chapter.create!(
        :title => "Title",
        :start_page => 1,
        :section => nil
      )
    ])
  end

  it "renders a list of chapters" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
