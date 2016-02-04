require 'rails_helper'

RSpec.describe "levels/index", type: :view do
  before(:each) do
    assign(:levels, [
      Level.create!(
        :name => "Name"
      ),
      Level.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of levels" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
