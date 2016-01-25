require 'rails_helper'

RSpec.describe "roles/edit", type: :view do
  before(:each) do
    @role = assign(:role, Role.create!(
      :user => nil,
      :profile => nil
    ))
  end

  it "renders the edit role form" do
    render

    assert_select "form[action=?][method=?]", role_path(@role), "post" do

      assert_select "input#role_user_id[name=?]", "role[user_id]"

      assert_select "input#role_profile_id[name=?]", "role[profile_id]"
    end
  end
end
