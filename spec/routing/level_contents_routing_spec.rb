require "rails_helper"

RSpec.describe LevelContentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/level_contents").to route_to("level_contents#index")
    end

    it "routes to #new" do
      expect(:get => "/level_contents/new").to route_to("level_contents#new")
    end

    it "routes to #show" do
      expect(:get => "/level_contents/1").to route_to("level_contents#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/level_contents/1/edit").to route_to("level_contents#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/level_contents").to route_to("level_contents#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/level_contents/1").to route_to("level_contents#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/level_contents/1").to route_to("level_contents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/level_contents/1").to route_to("level_contents#destroy", :id => "1")
    end

  end
end
