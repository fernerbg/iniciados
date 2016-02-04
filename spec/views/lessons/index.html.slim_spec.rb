require 'rails_helper'

RSpec.describe "lessons/index", type: :view do
  before(:each) do
    assign(:lessons, [
      Lesson.create!(
        :name => "Name",
        :description => "MyText",
        :number_level => 1,
        :number => 2,
        :lesson_level => nil
      ),
      Lesson.create!(
        :name => "Name",
        :description => "MyText",
        :number_level => 1,
        :number => 2,
        :lesson_level => nil
      )
    ])
  end

  it "renders a list of lessons" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
