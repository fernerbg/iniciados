require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        :title => "Title",
        :description => "MyText",
        :media => "Media"
      ),
      Notification.create!(
        :title => "Title",
        :description => "MyText",
        :media => "Media"
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Media".to_s, :count => 2
  end
end
