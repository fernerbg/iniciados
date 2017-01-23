require 'rails_helper'

RSpec.describe "LevelSections", type: :request do
  describe "GET /level_sections" do
    it "works! (now write some real specs)" do
      get level_sections_path
      expect(response).to have_http_status(200)
    end
  end
end
