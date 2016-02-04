require "rails_helper"

RSpec.describe LessonLevelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lesson_levels").to route_to("lesson_levels#index")
    end

    it "routes to #new" do
      expect(:get => "/lesson_levels/new").to route_to("lesson_levels#new")
    end

    it "routes to #show" do
      expect(:get => "/lesson_levels/1").to route_to("lesson_levels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lesson_levels/1/edit").to route_to("lesson_levels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lesson_levels").to route_to("lesson_levels#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/lesson_levels/1").to route_to("lesson_levels#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/lesson_levels/1").to route_to("lesson_levels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lesson_levels/1").to route_to("lesson_levels#destroy", :id => "1")
    end

  end
end
