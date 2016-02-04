require 'rails_helper'

RSpec.describe "LessonLevels", type: :request do
  describe "GET /lesson_levels" do
    it "works! (now write some real specs)" do
      get lesson_levels_path
      expect(response).to have_http_status(200)
    end
  end
end
