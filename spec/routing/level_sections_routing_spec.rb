require "rails_helper"

RSpec.describe LevelSectionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/level_sections").to route_to("level_sections#index")
    end

    it "routes to #new" do
      expect(:get => "/level_sections/new").to route_to("level_sections#new")
    end

    it "routes to #show" do
      expect(:get => "/level_sections/1").to route_to("level_sections#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/level_sections/1/edit").to route_to("level_sections#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/level_sections").to route_to("level_sections#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/level_sections/1").to route_to("level_sections#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/level_sections/1").to route_to("level_sections#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/level_sections/1").to route_to("level_sections#destroy", :id => "1")
    end

  end
end
