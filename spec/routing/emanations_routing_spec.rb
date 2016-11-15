require "rails_helper"

RSpec.describe EmanationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/emanations").to route_to("emanations#index")
    end

    it "routes to #new" do
      expect(:get => "/emanations/new").to route_to("emanations#new")
    end

    it "routes to #show" do
      expect(:get => "/emanations/1").to route_to("emanations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/emanations/1/edit").to route_to("emanations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/emanations").to route_to("emanations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/emanations/1").to route_to("emanations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/emanations/1").to route_to("emanations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/emanations/1").to route_to("emanations#destroy", :id => "1")
    end

  end
end
