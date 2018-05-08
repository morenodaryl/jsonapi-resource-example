require 'rails_helper'

RSpec.describe "Contents", type: :request do
   describe "GET /contents" do

    it "get list of a website content" do
      website = create :static_website
      get api_v1_website_contents_path(website)

      expect(response).to have_http_status(200)
      parsed_body = JSON.parse(response.body);
      expect(parsed_body['data'].length).to eq(website.contents.count)
    end

  end
end
