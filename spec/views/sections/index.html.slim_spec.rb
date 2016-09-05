require 'rails_helper'

RSpec.describe "sections/index", type: :view do
  before(:each) do
    assign(:sections, [
      Section.create!(
        :title => "Title",
        :start_page => 1,
        :level => nil
      ),
      Section.create!(
        :title => "Title",
        :start_page => 1,
        :level => nil
      )
    ])
  end

  it "renders a list of sections" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
