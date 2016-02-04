require 'rails_helper'

RSpec.describe "LevelContents", type: :request do
  describe "GET /level_contents" do
    it "works! (now write some real specs)" do
      get level_contents_path
      expect(response).to have_http_status(200)
    end
  end
end
