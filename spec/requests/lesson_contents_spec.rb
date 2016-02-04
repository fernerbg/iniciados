require 'rails_helper'

RSpec.describe "LessonContents", type: :request do
  describe "GET /lesson_contents" do
    it "works! (now write some real specs)" do
      get lesson_contents_path
      expect(response).to have_http_status(200)
    end
  end
end
