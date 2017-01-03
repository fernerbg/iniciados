require 'rails_helper'

RSpec.describe "notifications/new", type: :view do
  before(:each) do
    assign(:notification, Notification.new(
      :title => "MyString",
      :description => "MyText",
      :media => "MyString"
    ))
  end

  it "renders new notification form" do
    render

    assert_select "form[action=?][method=?]", notifications_path, "post" do

      assert_select "input#notification_title[name=?]", "notification[title]"

      assert_select "textarea#notification_description[name=?]", "notification[description]"

      assert_select "input#notification_media[name=?]", "notification[media]"
    end
  end
end
