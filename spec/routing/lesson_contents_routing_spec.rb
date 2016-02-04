require "rails_helper"

RSpec.describe LessonContentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lesson_contents").to route_to("lesson_contents#index")
    end

    it "routes to #new" do
      expect(:get => "/lesson_contents/new").to route_to("lesson_contents#new")
    end

    it "routes to #show" do
      expect(:get => "/lesson_contents/1").to route_to("lesson_contents#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lesson_contents/1/edit").to route_to("lesson_contents#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lesson_contents").to route_to("lesson_contents#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/lesson_contents/1").to route_to("lesson_contents#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/lesson_contents/1").to route_to("lesson_contents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lesson_contents/1").to route_to("lesson_contents#destroy", :id => "1")
    end

  end
end
