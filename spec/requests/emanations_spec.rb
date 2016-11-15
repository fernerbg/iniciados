require 'rails_helper'

RSpec.describe "Emanations", type: :request do
  describe "GET /emanations" do
    it "works! (now write some real specs)" do
      get emanations_path
      expect(response).to have_http_status(200)
    end
  end
end
