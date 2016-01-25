require 'rails_helper'

RSpec.describe "roles/index", type: :view do
  before(:each) do
    assign(:roles, [
      Role.create!(
        :user => nil,
        :profile => nil
      ),
      Role.create!(
        :user => nil,
        :profile => nil
      )
    ])
  end

  it "renders a list of roles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
